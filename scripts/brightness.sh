#!/usr/bin/bash

case "$1" in
    "inc")
        brightnessctl set "$2"%+
        dunstify -u low -i brightness-high -h string:synchronous:brightness "Brightness: " -h int:value:"`brightnessctl info | grep "[0-9]*%" -o | sed 's/%//'`"
        ;;
    "dec")
        brightnessctl set "$2"%-
        dunstify -u low -i brightness-low -h string:synchronous:volume "Brightness: " -h int:value:"`brightnessctl info | grep "[0-9]*%" -o | sed 's/%//'`"
        ;;
esac
