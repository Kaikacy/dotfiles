#!/usr/bin/env dash

# using swaybar-protocol(7)

# header
echo '{"version": 1}\n['

readonly SEPARATOR_WIDTH_FIELD='"separator_block_width": 28'
readonly COLOR_RED="#AA0000"
readonly COLOR_YELLOW="#CC7722"
readonly COLOR_GREEN="#00AA00"
readonly COLOR_GRAY="#999999"

readonly UPDATE_TIME=7
readonly BATTERY_PATH='/sys/class/power_supply/BAT1'
readonly TIME_FORMAT='%H:%M %B %d. %A'

battery_block=
time_block=
volume_block=
network_block=
kb_layout_block=
cpu_block=
mem_block=

get_time_block() {
	echo '{"full_text": "'$(date +"$TIME_FORMAT")'"}'
}

get_battery_block() {
	local percentage=$(cat "$BATTERY_PATH/capacity")
	local status=$(cat "$BATTERY_PATH/status")
	local color=
	if [ $percentage -ge 80 ]; then
		color="$COLOR_GREEN"
	elif [ $percentage -le 20 -a "$status" = "Discharging" ]; then
		color="$COLOR_RED"
	fi

	local full_text=$(echo "$status $percentage%")
	if [ $color ]; then
		printf '{"full_text": "%s", "color": "%s", %s}' "$full_text" "$color" "$SEPARATOR_WIDTH_FIELD"
	else
		echo '{"full_text": "'$full_text'", '$SEPARATOR_WIDTH_FIELD'}'
	fi
}

get_volume_block() {
	local raw_input=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
	local percentage=$(echo "$raw_input" | awk '{printf "%0.f", $2 * 100}')
	if echo "$raw_input" | grep -q "MUTED"; then
		echo '{"full_text": "Volume MUTED", '$SEPARATOR_WIDTH_FIELD', "color": "'$COLOR_GRAY'"}'
	else
		echo '{"full_text": "Volume '$percentage'%", '$SEPARATOR_WIDTH_FIELD'}'
	fi
}

get_network_block() {
	# TODO: ethernet
	
	local raw_active_connections=$(nmcli --terse --fields=name,type,device connection show --active)

	local wifi_name=
	local color=
	local full_text=

	# can't use echo with | (pipe) as that creates new subshell
	# so current shell un-exported variables wouldn't be accessable
	while IFS=: read -r name type device; do
		if [ "$type" = "loopback" ]; then
			continue
		fi
		if echo "$type" | grep -q "wireless"; then
			wifi_name="$name"
			full_text="Wifi $name"
		fi
	done << EOF
$raw_active_connections
EOF

	if [ -z "$wifi_name" ]; then
		echo '{"full_text": "DISCONNECTED", "color": "'$COLOR_GRAY'", '$SEPARATOR_WIDTH_FIELD'}'
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

	if [ -n "$color" ]; then
		printf '{"full_text": "%s", "color": "%s", %s}' "$full_text" "$color" "$SEPARATOR_WIDTH_FIELD"
	else
		printf '{"full_text": "%s", %s}' "$full_text" "$SEPARATOR_WIDTH_FIELD"
	fi
}

get_kb_layout_block() {
	# good for us jq returns quoted string if -r (--raw-output) flag is not specified
	local quoted_layout=$(swaymsg -t get_inputs | jq '.[] | select(.type == "keyboard").xkb_active_layout_name' | head -n1)
	printf '{"full_text": %s, %s}' "$quoted_layout" "$SEPARATOR_WIDTH_FIELD"
}

get_cpu_block() {
	local cpu_load=$(vmstat 1 2 | tail -1 | awk '{print 100-$15}')
	local color=
	if [ $cpu_load -ge 80 ]; then
		color="$COLOR_RED"
	elif [ $cpu_load -ge 60 ]; then
		color="$COLOR_YELLOW"
	fi

	local full_text="CPU load ${cpu_load}%"
	if [ "$color" ]; then
		printf '{"full_text": "%s", "color": "%s", %s}' "$full_text" "$color" "$SEPARATOR_WIDTH_FIELD"
	else
		printf '{"full_text": "%s", %s}' "$full_text" "$SEPARATOR_WIDTH_FIELD"
	fi
}

get_mem_block() {
	local mem_used=$(free | grep Mem | awk '{printf "%.f", $3/$2*100}')
	local color=
	if [ $mem_used -ge 80 ]; then
		color="$COLOR_RED"
	elif [ $mem_used -ge 60 ]; then
		color="$COLOR_YELLOW"
	fi

	local full_text="Memory used ${mem_used}%"
	if [ "$color" ]; then
		printf '{"full_text": "%s", "color": "%s", %s}' "$full_text" "$color" "$SEPARATOR_WIDTH_FIELD"
	else
		printf '{"full_text": "%s", %s}' "$full_text" "$SEPARATOR_WIDTH_FIELD"
	fi
}

monitor_audio_changes() {
	pactl subscribe | while read -r event_line; do
		if echo "$event_line" | grep -q -E "Event 'change' on (sink|source) #"; then
			update_status
			print_statusbar
		fi
	done
}

monitor_kb_layout_changes() {
	# can't use monitor flag as that outputs json object for each keyboard device
	while true; do
		if [ $(swaymsg -t subscribe '["input"]' | jq '.change') = "xkb_layout" ]; then
			update_status
			print_statusbar
		fi
	done
}

update_status() {
	volume_block=$(get_volume_block)
	battery_block=$(get_battery_block)
	time_block=$(get_time_block)
	network_block=$(get_network_block)
	kb_layout_block=$(get_kb_layout_block "$1")
	cpu_block=$(get_cpu_block)
	mem_block=$(get_mem_block)
}

print_statusbar() {
	echo "[$kb_layout_block, $network_block, $cpu_block, $mem_block, $volume_block, $battery_block, $time_block],"
}

monitor_audio_changes &
monitor_kb_layout_changes &

while true; do
	update_status
	print_statusbar
	sleep $UPDATE_TIME
done
