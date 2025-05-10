#!/usr/bin/bash

case "$1" in
    "inc")
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$2"%+
        dunstify -u low -i audio-volume-high -h string:synchronous:volume "Volume: " -h int:value:"`wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o '[0-9.]*' | sed 's/\.//'`"
        ;;
    "dec")
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2"%-
        dunstify -u low -i audio-volume-low -h string:synchronous:volume "Volume: " -h int:value:"`wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o '[0-9.]*' | sed 's/\.//'`"
        ;;
    "toggle")
        if [[ $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep MUTED) ]]; then
            dunstify -u low -i audio-volume-medium -h string:synchronous:volume "Volume unmuted"
        else
            dunstify -u low -i audio-volume-muted -h string:synchronous:volume "Volume muted"
        fi
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      ;;
esac
