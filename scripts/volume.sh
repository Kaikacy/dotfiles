#!/usr/bin/env bash

function get-volume {
    local volume
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep --only-matching '[0-9].*')
    awk "BEGIN {print $volume * 100}" # get percentage from decimal
}

case "$1" in
"inc")
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$2"%+
    volume=$(get-volume)
    notify-send --urgency=low --icon=audio-volume-high --hint=string:synchronous:volume "Volume:" "$volume%" --hint=int:value:"${volume}"
    ;;
"dec")
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2"%-
    volume=$(get-volume)
    notify-send --urgency=low --icon=audio-volume-low --hint=string:synchronous:volume "Volume:" "$volume%" --hint=int:value:"${volume}"
    ;;
"toggle")
    if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED; then
        notify-send --urgency=low --icon=audio-volume-medium --hint=string:synchronous:volume "Volume unmuted"
    else
        notify-send --urgency=low --icon=audio-volume-muted --hint=string:synchronous:volume "Volume muted"
    fi
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
esac
