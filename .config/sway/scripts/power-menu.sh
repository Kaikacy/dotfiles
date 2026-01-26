#!/usr/bin/env dash

readonly SHUTDOWN="Shutdown"
readonly REBOOT="Reboot"
readonly SUSPEND="Suspend"
readonly LOGOUT="Log out"
readonly LOCK="Lock"

action=$(echo "$SHUTDOWN\n$REBOOT\n$SUSPEND\n$LOGOUT\n$LOCK" | rofi -dmenu -i -p "Power menu")

case "$action" in
	"$SHUTDOWN")
		systemctl poweroff
		;;
	"$REBOOT")
		systemctl reboot
		;;
	"$SUSPEND")
		systemctl suspend
		;;
	"$LOGOUT")
		swaymsg exit
		;;
	"$LOCK")
		swaylock -C ~/.config/sway/swaylock
		;;
esac
