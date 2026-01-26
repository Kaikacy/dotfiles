set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_DATA_DIRS "/usr/local/share:/usr/share"
set -gx XDG_CONFIG_DIRS "/etc/xdg"

set -gx PATH "$HOME/.local/bin" $PATH

set -gx QT_QPA_PLATFORMTHEME qt6ct
set -gx EDITOR nvim
set -gx VISUAL "$EDITOR"
set -gx TERMINAL foot
set -gx BROWSER zen-browser
set -gx PAGER less
set -gx MANPAGER "nvim +Man!"

if status is-interactive
    set -g fish_greeting ''
    set -g fish_key_bindings fish_vi_key_bindings

    alias vi=$EDITOR
    alias dots='git --git-dir="$HOME/dotfiles" --work-tree="$HOME"'

    bind -M insert ctrl-c cancel-commandline
    bind -M default ctrl-c cancel-commandline
    bind -M visual ctrl-c cancel-commandline
    bind -M replace ctrl-c cancel-commandline
    bind -M replace_one ctrl-c cancel-commandline

    starship init fish | source
end

