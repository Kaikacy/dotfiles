#!/usr/bin/env bash

SERVER="$HOME/.cache/nvim/godot.pipe"

if [ ! -f "$SERVER" ]; then
    foot -D "$1" nvim --listen "$SERVER" &
    sleep 0.5
fi

nvim --server "$SERVER" --remote-send "<C-\><C-N><CMD>edit $2<CR><CMD>call cursor($3,$4)<CR>"
