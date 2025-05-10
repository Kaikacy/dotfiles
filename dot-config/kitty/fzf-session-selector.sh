#!/usr/bin/bash

cd ~/.config/kitty/sessions/

cur=$(fzf)

status=$(echo $?)

# if fzf was successful, replace current kitty window with the new one
# WARNING: we have to first create new kitty instance and then kill previous
[[ $status == 0 ]] && kitty --detach --session "sessions/$cur" && kill -9 $KITTY_PID
