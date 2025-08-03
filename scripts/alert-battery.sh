#!/usr/bin/env bash

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [[ $status = "Discharging" && $capacity -le 20 ]]; then
    notify-send -u critical -i battery-low "Low battery alert!"
fi
