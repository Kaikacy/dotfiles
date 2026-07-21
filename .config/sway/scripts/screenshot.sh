#!/usr/bin/env dash

readonly SAVE_PATH="${HOME}/Pictures/screenshots"
[ ! -d "$SAVE_PATH" ] && mkdir -p "$SAVE_PATH"

readonly WINDOW_SELECTOR="${HOME}/.config/sway/scripts/slurp_window.sh"

readonly DATE_FORMAT="%T_%d-%m-%Y"

readonly GRIM_OPTIONS="-l 3"

readonly SCREEN="Screen"
readonly WINDOW="Window"
readonly REGION="Region"

readonly MODE=$(echo "$SCREEN\n$WINDOW\n$REGION" | rofi -dmenu -i -p "Screenshot")

case "$MODE" in
	"$SCREEN")
		name="${SAVE_PATH}/`date '+'${DATE_FORMAT}''`.png"
		grim $GRIM_OPTIONS "$name"
		;;
	"$WINDOW")
		rect=$(sh "$WINDOW_SELECTOR")
		if [ -n "$rect" ]; then
			name="${SAVE_PATH}/w_`date '+'${DATE_FORMAT}''`.png"
			grim $GRIM_OPTIONS -g "$rect" "$name"
		fi
		;;
	"$REGION")
		name="${SAVE_PATH}/r_`date '+'${DATE_FORMAT}''`.png"
		grim $GRIM_OPTIONS -g "`slurp`" "$name"
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
