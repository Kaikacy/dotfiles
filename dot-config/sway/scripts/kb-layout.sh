#!/usr/bin/env dash

readonly APP_NAME="system-osd"
readonly NOTIFICATION_TAG_HINT="string:x-canonical-private-synchronous"

swaymsg input type:keyboard xkb_switch_layout $1

layout=$(swaymsg -t get_inputs | jq --raw-output '.[] | select(.type == "keyboard").xkb_active_layout_name' | head -n1)

notify-send "Keyboard layout: $layout" \
	--app-name="$APP_NAME" \
	--urgency=low \
	--hint="${NOTIFICATION_TAG_HINT}:kb-layout" \
	--icon="keyboard-layout"
