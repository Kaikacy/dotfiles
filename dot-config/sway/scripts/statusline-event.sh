#!/usr/bin/env dash

# using swaybar-protocol(7)

# utilizing bar_state_update event to update only when statusbar is shown
# using sway-ipc(7)

# header
echo '{"version": 1}\n['

readonly SEPARATOR_WIDTH_FIELD='"separator_block_width": 28'
readonly COLOR_RED="#aa2929"
readonly COLOR_YELLOW="#bb7722"
readonly COLOR_GREEN="#29aa29"
readonly COLOR_GRAY="#555555"

readonly UPDATE_TIME=7
readonly BATTERY_PATH='/sys/class/power_supply/BAT1'
readonly TIME_FORMAT='%H:%M %A. %_d %B'

tlp_profile_block=
battery_block=
time_block=
volume_block=
brightness_block=
network_block=
kb_layout_block=
cpu_block=
memory_block=

# TODO: move printing to separate function, that accepts text and color args
print() {
	if [ "$2" ]; then
		echo '{"full_text": "'$1'", "color": "'$2'", '$SEPARATOR_WIDTH_FIELD'}'
	else
		echo '{"full_text": "'$1'", '$SEPARATOR_WIDTH_FIELD'}'
	fi
}

get_time_block() {
	print "$(date +"$TIME_FORMAT")"
}

get_battery_block() {
	local percentage=$(cat "$BATTERY_PATH/capacity")
	local status=$(cat "$BATTERY_PATH/status")
	local color=
	if [ "$status" = "Charging" ]; then
		color="$COLOR_GREEN"
	elif [ $percentage -le 20 -a "$status" = "Discharging" ]; then
		color="$COLOR_RED"
	fi

	print "Bat: $status ${percentage}%" "$color"
}

get_tlp_profile_block() {
	local color=
	local text=
	case "`tlpctl get`" in
		"balanced")
			text="BAL"
			;;
		"performance")
			text="PRF"
			color="$COLOR_RED"
			;;
		"power-saver")
			text="SAV"
			color="$COLOR_GREEN"
			;;
	esac
	print "TLP: $text" "$color"
}

get_volume_block() {
	local raw_input=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
	local percentage=$(echo "$raw_input" | awk '{printf "%0.f", $2 * 100}')
	if echo "$raw_input" | grep -q "MUTED"; then
		print "Vol: MUTED" "$COLOR_GRAY"
	else
		print "Vol: ${percentage}%"
	fi
}

get_brightness_block() {
	local percentage=$(brightnessctl info | grep -o "([0-9]*%)" | grep -o "[0-9]*")
	print "Bri: ${percentage}%"
}

get_network_block() {
	# TODO: ethernet

	local raw_active_connections=$(nmcli --terse --fields=name,type,device connection show --active)

	local wifi_name=
	local color=
	local full_text=

	# can't use echo with pipe as that creates new subshell
	# so current shell's un-exported variables wouldn't be accessable
	while IFS=: read -r name type device; do
		if [ "$type" = "loopback" ]; then
			continue
		fi
		if echo "$type" | grep -q "wireless"; then
			wifi_name="$name"
			full_text="Wifi: $name"
		fi
	done << EOF
$raw_active_connections
EOF

	if [ -z "$wifi_name" ]; then
		print "Wifi: DISCONNECTED" "$COLOR_GRAY"
		return
	fi

	if [ -n "$wifi_name" ]; then
		local raw_active_wifi=$(nmcli --terse --fields active,ssid,signal device wifi list --rescan no | grep -m1 -E "^yes:$wifi_name:")
		local signal_strength=$(echo $raw_active_wifi | awk -F ':' '{print $3}')

		[ -n "$signal_strength" ] && full_text="$full_text ${signal_strength}%"
		[ $signal_strength -le 20 ] && color="$COLOR_RED"
	fi

	# escape quotes for json
	full_text=$(echo "$full_text" | sed 's/"/\\\"/g')
	print "$full_text" "$color"
}

get_kb_layout_block() {
	local quoted_layout=$(swaymsg -t get_inputs | jq --raw-output '.[] | select(.type == "keyboard").xkb_active_layout_name' | head -n1)
	print "Kbd: $quoted_layout"
}

# takes at least 1 sec for accurate data
get_cpu_block() {
	local cpu_load=$(vmstat 1 2 | tail -1 | awk '{print 100-$15}')
	local color=
	if [ $cpu_load -ge 80 ]; then
		color="$COLOR_RED"
	elif [ $cpu_load -ge 60 ]; then
		color="$COLOR_YELLOW"
	fi

	print "CPU: ${cpu_load}%"
}

get_memory_block() {
	local memory_used=$(free | grep Mem | awk '{printf "%.f", $3/$2*100}')
	local color=
	if [ $memory_used -ge 80 ]; then
		color="$COLOR_RED"
	elif [ $memory_used -ge 60 ]; then
		color="$COLOR_YELLOW"
	fi

	print "Mem: ${memory_used}%" "$color"
}

# TODO: maybe: add only_ and skip_ check for other modules too
update_status() {
	if [ "$1" = "only_cpu" ]; then
		cpu_block="$(get_cpu_block)"
		return
	fi
	volume_block=$(get_volume_block)
	brightness_block=$(get_brightness_block)
	tlp_profile_block=$(get_tlp_profile_block)
	battery_block=$(get_battery_block)
	time_block=$(get_time_block)
	network_block=$(get_network_block)
	kb_layout_block=$(get_kb_layout_block)
	[ "$1" = "skip_cpu" ] || cpu_block=$(get_cpu_block)
	memory_block=$(get_memory_block)
}

print_statusline() {
	echo "[$kb_layout_block, $network_block, $cpu_block, $memory_block, $brightness_block, $volume_block, $tlp_profile_block, $battery_block, $time_block],"
}

update_status

# TODO: low priority: use update loop if statusbar stays visible
swaymsg -t subscribe -m '["bar_state_update"]' | jq --unbuffered '.visible_by_modifier // empty' | \
# $visible is always "true" as jq line doesn't output on "false" (can be modified to detect hide)
while read visible; do
	update_status skip_cpu
	print_statusline
	update_status only_cpu
	print_statusline
done
