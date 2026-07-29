#!/usr/bin/env dash

readonly SHUTDOWN="Shutdown"
readonly REBOOT="Reboot"
readonly SUSPEND="Suspend"
readonly HIBERNATE="Hibernate"
readonly LOGOUT="Log out"
readonly LOCK="Lock"

action=$(echo "$SHUTDOWN\n$REBOOT\n$SUSPEND\n$HIBERNATE\n$LOGOUT\n$LOCK" \
	| fuzzel --dmenu --minimal-lines --mesg "Power menu")

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
	"$HIBERNATE")
		systemctl hibernate
		;;
	"$LOGOUT")
		swaymsg exit
		;;
	"$LOCK")
		swaylock -C ~/.config/sway/swaylock
		;;
esac
