#!/usr/bin/env bash

readonly POWEROFF=" Poweroff"
readonly REBOOT=" Reboot"
readonly LOGOUT="󰗽 Logout"
readonly SUSPEND="󰒲 Suspend"
readonly LOCK="󰌾 Lock"

action=$(echo -e "1 $POWEROFF\n2 $REBOOT\n3 $LOGOUT\n4 $SUSPEND\n5 $LOCK" |
    rofi -dmenu -case-smart -p "Power" -l 5 -no-show-icons -normalize-match \
        -kb-select-1 "1" -kb-select-2 "2" -kb-select-3 "3" -kb-select-4 "4" -kb-select-5 "5")

case "${action:2}" in
"$POWEROFF")
    systemctl poweroff
    ;;
"$REBOOT")
    systemctl reboot
    ;;
"$LOGOUT")
    ~/scripts/logout.sh
    ;;
"$SUSPEND")
    systemctl suspend
    ;;
"$LOCK")
    swaylock --daemonize
    ;;
esac
