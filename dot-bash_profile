# Read for login shell

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export TERMINAL=foot
export BROWSER=helium-browser
export MANPAGER="less"
export GPG_TTY=$(tty)

eval "$(dircolors --sh)"

## Colored manpages
## By @yousuckatprogramming (https://gist.github.com/bahamas10/542875bb47990933638d2b7dfaa501bf)
export GROFF_NO_SGR=1 # Use format interpretable by less
# Begin blinking text mode
export LESS_TERMCAP_mb=$'\e[1;7;31m' # Bold red inversed
# Begin bold text mode
export LESS_TERMCAP_md=$'\e[1;33m' # Bold yellow
# End all special formatting started by mb/md/etc.
export LESS_TERMCAP_me=$'\e[0m'
# End standout mode
export LESS_TERMCAP_se=$'\e[0m'
# Begin standout mode
export LESS_TERMCAP_so=$'\e[7;34m' # Italic green
# End underline mode
export LESS_TERMCAP_ue=$'\e[0m'
# Begin underline mode
export LESS_TERMCAP_us=$'\e[4;35m' # Underline red
# Begin reverse-video mode
export LESS_TERMCAP_mr=$'\e[7m' # Inverse
# Begin dim/half-bright mode
export LESS_TERMCAP_mh=$'\e[2m' # Dim
# Begin subscript mode
export LESS_TERMCAP_ZN=$'\e[74m' # Subscript (if supported)
# End subscript mode
export LESS_TERMCAP_ZV=$'\e[75m' # Subscript off
# Begin superscript mode
export LESS_TERMCAP_ZO=$'\e[73m' # Superscript (if supported)
# End superscript mode
export LESS_TERMCAP_ZW=$'\e[75m' # Superscript off

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

# Interactive login shell
if [[ $- == "*i*" && -f "$HOME/.bashrc" ]]; then
    source "$HOME/.bashrc"
fi

. "$HOME/.local/share/../bin/env"
