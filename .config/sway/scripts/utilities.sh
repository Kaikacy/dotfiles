#!/usr/bin/env dash

# brightness, volume and mic utilities

get_volume() {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%0.f", $2 * 100}'
}

get_brightness() {
	echo $(($(brightnessctl get) * 100 / $(brightnessctl max)))
}

is_sink_muted() {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "MUTED"
}

is_source_muted() {
	wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep "MUTED"
}

readonly NOTIFICATION_TAG_HINT="string:x-canonical-private-synchronous"
readonly APP_NAME="system-osd"

if [ "$1" = "volume" ]; then
	case "$2" in
		"set")
			wpctl set-volume @DEFAULT_AUDIO_SINK@ $3%
			volume=$(get_volume)
			is_sink_muted && volume_text="Volume: $volume (muted)" || volume_text="Volume: $volume"
			notify-send "$volume_text" \
				--app-name="$APP_NAME" \
				--urgency=low \
				--hint="${NOTIFICATION_TAG_HINT}:volume" \
				--hint="int:value:$volume" \
				--icon="audio-volume-medium"
			;;
		"inc")
			wpctl set-volume @DEFAULT_AUDIO_SINK@ $3%+
			volume=$(get_volume)
			is_sink_muted && volume_text="Volume: $volume (muted)" || volume_text="Volume: $volume"
			notify-send "$volume_text" \
				--app-name="$APP_NAME" \
				--urgency=low \
				--hint="${NOTIFICATION_TAG_HINT}:volume" \
				--hint="int:value:$volume" \
				--icon="audio-volume-high"
			;;
		"dec")
			wpctl set-volume @DEFAULT_AUDIO_SINK@ $3%-
			volume=$(get_volume)
			is_sink_muted && volume_text="Volume: $volume (muted)" || volume_text="Volume: $volume"
			notify-send "$volume_text" \
				--app-name="$APP_NAME" \
				--urgency=low \
				--hint="${NOTIFICATION_TAG_HINT}:volume" \
				--hint="int:value:$volume" \
				--icon="audio-volume-low"
			;;
		"toggle")
			wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
			if is_sink_muted; then
				notify-send "Volume muted" \
					--app-name="$APP_NAME" \
					--urgency=low \
					--hint="${NOTIFICATION_TAG_HINT}:volume" \
					--icon="audio-volume-muted"
			else
				notify-send "Volume unmuted" \
					--app-name="$APP_NAME" \
					--urgency=low \
					--hint="${NOTIFICATION_TAG_HINT}:volume" \
					--icon="audio-volume-medium"
			fi
			;;
	esac
elif [ "$1" = "brightness" ]; then
	case "$2" in
		"set")
			brightnessctl set $3%
			brightness_icon="video-display-brightness"
			;;
		"inc")
			brightnessctl set $3%+
			brightness_icon="high-brightness"
			;;
		"dec")
			brightnessctl set $3%-
			brightness_icon="low-brightness"
			;;
	esac
	brightness=$(get_brightness)
	notify-send "Brightness: $brightness%" \
		--app-name="$APP_NAME" \
		--urgency=low \
		--hint="${NOTIFICATION_TAG_HINT}:brightness" \
		--hint="int:value:$brightness" \
		--icon=$brightness_icon
elif [ "$1" = "mic" ]; then
	if [ "$2" = "toggle" ]; then
		wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
		if is_source_muted; then
			notify-send "Mic muted" \
				--app-name="$APP_NAME" \
				--urgency=low \
				--hint="${NOTIFICATION_TAG_HINT}:mic" \
				--icon="microphone-sensitivity-muted"
		else
			notify-send "Mic unmuted" \
				--app-name="$APP_NAME" \
				--urgency=low \
				--hint="${NOTIFICATION_TAG_HINT}:mic" \
				--icon="microphone-sensitivity-medium"
		fi
	fi
fi
