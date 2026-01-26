#!/usr/bin/env dash

readonly SAVE_PATH="${HOME}/Pictures/screenshots"
[ ! -d "$SAVE_PATH" ] && mkdir -p "$SAVE_PATH"

readonly SLURP_WINDOW_PATH="${HOME}/.config/sway/scripts/slurp_window.sh"

readonly SCREEN="Screen"
readonly WINDOW="Window"
readonly REGION="Region"

readonly MODE=$(echo "$SCREEN\n$WINDOW\n$REGION" | rofi -dmenu -i -p "Screenshot")

case "$MODE" in
	"$SCREEN")
		name="${SAVE_PATH}/`date '+%T_%d-%m-%Y'`.png"
		grim "$name"
		;;
	"$WINDOW")
		rect=$(sh "$SLURP_WINDOW_PATH")
		if [ -n "$rect" ]; then
			name="${SAVE_PATH}/w_`date '+%T_%d-%m-%Y'`.png"
			grim -g "$rect" "$name"
		fi
		;;
	"$REGION")
		name="${SAVE_PATH}/r_`date '+%T_%d-%m-%Y'`.png"
		grim -g "`slurp`" "$name" 
		;;
	*)
		exit
esac

if [ -n $name ]; then
	readonly ACTION=$(notify-send "Screenshot saved" "$name" \
		--app-name=screenshot \
		--icon="$name" \
		--action="open"="Open" \
		--action="delete"="Delete")
	if [ "$ACTION" = "open" ]; then
		xdg-open "$name"
	elif [ "$ACTION" = "delete" ]; then
		rm "$name"
		notify-send "Screenshot deleted" \
			--app-name=screenshot
	fi
fi
