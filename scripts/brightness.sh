#!/usr/bin/env bash

case "$1" in
"inc")
    brightnessctl set "$2"%+
    brightness=$(brightnessctl info | grep --only-matching "[0-9]*%") # removing '%' is not necessary as it still parses as int
    notify-send --urgency=low --icon=brightness-high --hint=string:synchronous:brightness "Brightness:" "$brightness" --hint=int:value:"${brightness}"
    ;;
"dec")
    brightnessctl set "$2"%-
    brightness=$(brightnessctl info | grep --only-matching "[0-9]*%")
    notify-send --urgency=low --icon=brightness-low --hint=string:synchronous:brightness "Brightness:" "$brightness" --hint=int:value:"${brightness}"
    ;;
esac
