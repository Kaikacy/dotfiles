#!/usr/bin/env bash

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
    echo "true" >"$STATUS_FILE"
    notify-send "Enabling Touchpad" -i touchpad_enabled -u low -h string:synchronous:touchpad
    hyprctl keyword 'device[synps/2-synaptics-touchpad]:enabled' 1
}

disable_touchpad() {
    echo "false" >"$STATUS_FILE"
    notify-send "Disabling Touchpad" -i touchpad_disabled -u low -h string:synchronous:touchpad
    hyprctl keyword 'device[synps/2-synaptics-touchpad]:enabled' 0
}

if ! [ -f "$STATUS_FILE" ]; then
  disable_touchpad
else
  if [ $(cat "$STATUS_FILE") = "true" ]; then
    disable_touchpad
  elif [ $(cat "$STATUS_FILE") = "false" ]; then
    enable_touchpad
  fi
fi
