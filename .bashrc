# Interactive shell
if [[ $- == *i* ]]; then
    ### History ###
    HISTFILE="$HOME/.bash_history"
    HISTSIZE=1000
    HISTCONTROL="ignorespace:erasedups"
    shopt -s histappend # Append history to file instead of overwriting

    ### Options ###
    shopt -s cdspell # Correct minor splling mistakes in dir names on cd
    shopt -s dirspell # Correct dir name spelling mistakes when completing

    ### Aliases ###
    alias ls='ls --color=auto --human-readable --file-type'
    alias grep='grep --color=auto'
    alias vi='nvim'
    alias dots='git --git-dir "$HOME/dotfiles" --work-tree "$HOME"'

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
    _no_newline() {
        IFS=';' read -sdR -p $'\e[6n' ROW COL # Get cursor pos
        [ $COL -ne 1 ] && echo -e '\e[7;1m%\e[m'
    }

    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'_no_newline'

    # PS1='[\u@\h \W]\$ '
    eval "$(starship init bash)"
fi

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
