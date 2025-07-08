#!/usr/bin/env bash

notify() {
    notify-send "Keyboard Layout set to $1" --icon=keyboard-layout --urgency=low --hint=string:synchronous:kb_layout
}

case $XDG_CURRENT_DESKTOP in
sway*)
    swaymsg input type:keyboard xkb_switch_layout "$1"
    layout=$(swaymsg -t get_inputs -r | jq 'map(select(.type == "keyboard"))[0].xkb_active_layout_name')
    notify "$layout"
    ;;
esac
