#!/usr/bin/env bash

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
    echo "true" >"$STATUS_FILE"
    notify-send "Enabling Touchpad" --icon=touchpad_enabled --urgency=low --hint=string:synchronous:touchpad
    case $XDG_CURRENT_DESKTOP in
    "sway")
        swaymsg input type:touchpad events enabled
        ;;
    "hyprland")
        hyprctl keyword 'device[synps/2-synaptics-touchpad]:enabled' 1
        ;;
    esac
}

disable_touchpad() {
    echo "false" >"$STATUS_FILE"
    notify-send "Disabling Touchpad" --icon=touchpad_disabled --urgency=low --hint=string:synchronous:touchpad
    case $XDG_CURRENT_DESKTOP in
    sway*)
        swaymsg input type:touchpad events disabled
        ;;
    "hyprland")
        hyprctl keyword 'device[synps/2-synaptics-touchpad]:enabled' 0
        ;;
    esac
}

if ! [ -f "$STATUS_FILE" ]; then
    disable_touchpad
else
    if [ "$(cat "$STATUS_FILE")" = "true" ]; then
        disable_touchpad
    elif [ "$(cat "$STATUS_FILE")" = "false" ]; then
        enable_touchpad
    fi
fi
