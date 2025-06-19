#!/usr/bin/env bash

case "$1" in
    "inc")
        brightnessctl set "$2"%+
        brightness=$(brightnessctl info | grep --only-matching "[0-9]*%") # removing '%' is not necessary as it still parses as int
        notify-send -u low -i brightness-high -h string:synchronous:brightness "Brightness:" "$brightness" -h int:value:${brightness}
        ;;
    "dec")
        brightnessctl set "$2"%-
        brightness=$(brightnessctl info | grep --only-matching "[0-9]*%")
        notify-send -u low -i brightness-low -h string:synchronous:brightness "Brightness:" "$brightness" -h int:value:${brightness}
        ;;
esac
