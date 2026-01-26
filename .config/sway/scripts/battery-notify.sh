#!/usr/bin/env dash

readonly BATTERY_PATH="/sys/class/power_supply/BAT1/"
readonly APP_NAME="system"

last_sent=

while true; do
	percentage=$(cat "${BATTERY_PATH}/capacity")
	status=$(cat "${BATTERY_PATH}/status")
	case "$last_sent" in
		"low")
			[ "$status" = "Charging" ] && last_sent=
			;;
		"high")
			[ "$status" = "Discharging" ] && last_sent=
			;;
		*)
			if [ $percentage -le 20 -a "$status" = "Discharging" ]; then
				notify-send "Low battery" \
				--app-name="$APP_NAME" \
				--urgency=critical \
				--icon="battery-020"
				last_sent=low
			elif [ $percentage -ge 80 -a "$status" = "Charging" ]; then
				notify-send "Battery almost charged" \
				--app-name="$APP_NAME" \
				--urgency=low \
				--icon="battery-080-charging"
				last_sent=high
			fi
			;;
	esac
	sleep 30
done
