# Read for interactive non-login shell

### History ###
HISTFILE="$HOME/.bash_history"
HISTSIZE=3000
HISTCONTROL="ignorespace:erasedups"
shopt -s histappend # Append history to file instead of overwriting

### Options ###
shopt -s cdspell # Correct minor splling mistakes in dir names on cd
shopt -s dirspell # Correct dir name spelling mistakes when completing
# set -o notify # Notify asynchronously when background job completes

### Aliases ###
alias ls='ls --color=auto --human-readable --file-type'
alias grep='grep --color=auto'
alias vi='nvim'
alias dots='git --git-dir "$HOME/dotfiles" --work-tree "$HOME"'
alias editkbd='vi -c "cd $HOME/qmk_firmware/keyboards/crkbd/keymaps/kaikacy" -c "edit ."'
mkdircd() {
    mkdir -p "$@"
    cd "$@"
}

### Bindings ###
# Smart help
_run_help() {
    set $READLINE_LINE
    if [ "$1" ]; then
        man "$1"
    fi
}
bind -x '"\C-x\C-h": _run_help'

eval "$(fzf --bash)"

### Prompt ###
# Indicate if last output didn't end with newline
_prompt__no_newline() {
    IFS=';' read -sdR -p $'\e[6n' ROW COL # Get cursor pos
    [ $COL -ne 1 ] && echo -e '\e[7;1m%\e[m'
}
# OSC-133;A for jumping between prompts
_prompt__marker() {
    printf '\e]133;A\e\\'
}
# Snippet taken from foot terminal wiki
_prompt__osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
# To pipe last command output in foot terminal by setting markers before and after
_prompt__command_done() {
    printf '\e]133;D\e\\'
}
PS0+='\e]133;C\e\\'

PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'_prompt__command_done; _prompt__osc7_cwd; _prompt__no_newline; _prompt__marker'

# PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
