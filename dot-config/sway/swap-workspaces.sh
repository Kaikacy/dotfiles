#!/usr/bin/env bash

workspaces=$(swaymsg --type get_workspaces --raw)
focused_workspace=$(echo "$workspaces" | jq '.[] | select(.focused == true).name' --raw-output)

[ "$1" = "$focused_workspace" ] && exit 0

if echo "$workspaces" | jq '.[].name' | grep -q "$1"; then
    swaymsg rename workspace to "__swap-workspaces-temp__", \
        rename workspace "$1" to "$focused_workspace", \
        rename workspace "__swap-workspaces-temp__" to "$1"
else
    swaymsg rename workspace to "$1"
fi
