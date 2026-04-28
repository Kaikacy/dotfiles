# Read for login shell

set -o allexport # Export every variable (same as `set -a`)

XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_STATE_HOME="$HOME/.local/state"
XDG_DATA_HOME="$HOME/.local/share"
XDG_DATA_DIRS="/usr/local/share:/usr/share"
XDG_CONFIG_DIRS="/etc/xdg"

EDITOR=nvim
VISUAL=$EDITOR
PAGER=less
TERMINAL=foot
BROWSER=helium-browser
MANPAGER="less"
GPG_TTY=$(tty)

eval "$(dircolors --sh)"

## Colored manpages
## By @yousuckatprogramming (https://gist.github.com/bahamas10/542875bb47990933638d2b7dfaa501bf)
GROFF_NO_SGR=1 # Use format interpretable by less
# Begin blinking text mode
LESS_TERMCAP_mb=$'\e[1;7;31m' # Bold red inversed
# Begin bold text mode
LESS_TERMCAP_md=$'\e[1;33m' # Bold yellow
# End all special formatting started by mb/md/etc.
LESS_TERMCAP_me=$'\e[0m'
# End standout mode
LESS_TERMCAP_se=$'\e[0m'
# Begin standout mode
LESS_TERMCAP_so=$'\e[3;32m' # Italic green
# End underline mode
LESS_TERMCAP_ue=$'\e[0m'
# Begin underline mode
LESS_TERMCAP_us=$'\e[4;35m' # Underline red
# Begin reverse-video mode
LESS_TERMCAP_mr=$'\e[7m' # Inverse
# Begin dim/half-bright mode
LESS_TERMCAP_mh=$'\e[2m' # Dim
# Begin subscript mode
LESS_TERMCAP_ZN=$'\e[74m' # Subscript (if supported)
# End subscript mode
LESS_TERMCAP_ZV=$'\e[75m' # Subscript off
# Begin superscript mode
LESS_TERMCAP_ZO=$'\e[73m' # Superscript (if supported)
# End superscript mode
LESS_TERMCAP_ZW=$'\e[75m' # Superscript off

PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

set +o allexport # Unset option (same as `set +a`)

# Interactive login shell
if [[ $- == "*i*" && -f "$HOME/.bashrc" ]]; then
    source "$HOME/.bashrc"
fi
