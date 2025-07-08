#!/usr/bin/env bash

case "$XDG_CURRENT_DESKTOP" in
"niri")
    niri msg action quit --skip-confirmation
    ;;
"hyprland") # only for uwsm managed
    uwsm stop
    ;;
sway*)
    swaymsg exit
    ;;
esac
