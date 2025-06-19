#!/usr/bin/env bash

function get-volume {
    local volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep --only-matching '[0-9].*')
    awk "BEGIN {print $volume * 100}" # get percentage from decimal
} 

case "$1" in
    "inc")
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$2"%+
        volume=$(get-volume)
        notify-send -u low -i audio-volume-high -h string:synchronous:volume "Volume:" "$volume%" -h int:value:${volume}
        ;;
    "dec")
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2"%-
        volume=$(get-volume)
        notify-send -u low -i audio-volume-low -h string:synchronous:volume "Volume:" "$volume%" -h int:value:${volume}
        ;;
    "toggle")
        if [[ $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep MUTED) ]]; then
            notify-send -u low -i audio-volume-medium -h string:synchronous:volume "Volume unmuted"
        else
            notify-send -u low -i audio-volume-muted -h string:synchronous:volume "Volume muted"
        fi
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      ;;
esac
