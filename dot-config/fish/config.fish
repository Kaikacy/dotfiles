set -q XDG_CONFIG_HOME || set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_CACHE_HOME || set -gx XDG_CACHE_HOME "$HOME/.cache"
set -q XDG_STATE_HOME || set -gx XDG_STATE_HOME "$HOME/.local/state"
set -q XDG_DATA_HOME || set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_DATA_DIRS || set -gx XDG_DATA_DIRS "/usr/local/share:/usr/share"
set -q XDG_CONFIG_DIRS || set -gx XDG_CONFIG_DIRS "/etc/xdg"

fish_add_path --path --prepend "$HOME/.local/bin" "$HOME/.cargo/bin"

## Colored manpages
## By @yousuckatprogramming (https://gist.github.com/bahamas10/542875bb47990933638d2b7dfaa501bf)
set -gx GROFF_NO_SGR 1 # Use format interpretable by less
# Begin blinking text mode
set -gx LESS_TERMCAP_mb "$(set_color --bold --reverse red)"
# Begin bold text mode
set -gx LESS_TERMCAP_md "$(set_color --bold yellow)"
# End all special formatting started by mb/md/etc.
set -gx LESS_TERMCAP_me "$(set_color normal)"
# End standout mode
set -gx LESS_TERMCAP_se "$(set_color normal)"
# Begin standout mode
set -gx LESS_TERMCAP_so "$(set_color --reverse blue)"
# End underline mode
set -gx LESS_TERMCAP_ue "$(set_color normal)"
# Begin underline mode
set -gx LESS_TERMCAP_us "$(set_color --underline red)"
# Begin reverse-video mode
set -gx LESS_TERMCAP_mr "$(set_color --reverse)"
# Begin dim/half-bright mode
set -gx LESS_TERMCAP_mh "$(set_color --dim)"
# Begin subscript mode
set -gx LESS_TERMCAP_ZN "$(echo -e '\e[74m')" # Subscript (if supported)
# End subscript mode
set -gx LESS_TERMCAP_ZV "$(echo -e '\e[75m')" # Subscript off
# Begin superscript mode
set -gx LESS_TERMCAP_ZO "$(echo -e '\e[73m')" # Superscript (if supported)
# End superscript mode
set -gx LESS_TERMCAP_ZW "$(echo -e '\e[75m')" # Superscript off

set -gx QT_QPA_PLATFORMTHEME qt6ct
set -gx EDITOR nvim
set -gx VISUAL "$EDITOR"
set -gx TERMINAL footclient
set -gx BROWSER helium-browser
set -gx PAGER less
set -gx MANPAGER less
set -gx GPG_TTY $(tty)

if status is-interactive
    set -g fish_greeting ''
    set -g fish_key_bindings fish_vi_key_bindings

    alias vi=$EDITOR
    alias grep='grep --color=auto'

    bind -M insert ctrl-c cancel-commandline
    bind -M default ctrl-c cancel-commandline
    bind -M visual ctrl-c cancel-commandline
    bind -M replace ctrl-c cancel-commandline
    bind -M replace_one ctrl-c cancel-commandline

    fzf --fish | source

    starship init fish | source
end

