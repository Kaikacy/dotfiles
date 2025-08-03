if status is-interactive

    bind -M default \e\x7F backward-kill-word
    bind -M default \ck history-search-backward
    bind -M default \cj history-search-forward
    bind -M default \cf accept-autosuggestion
    bind -M default \ch backward-char
    bind -M default \cl forward-char
    bind -M default \cb backward-word
    bind -M default \ce forward-word
    bind -M default \eb backward-bigword
    bind -M default \ee forward-bigword
    bind -M default \el clear-screen

    set -g __fish_git_prompt_char_stateseparator ''
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_color_dirtystate red
    set -g __fish_git_prompt_color_invalidstate magenta
    set -g __fish_git_prompt_char_invalidstate -
    set -g __fish_git_prompt_color_stagedstate green
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_char_untrackedfiles '?'
    set -g __fish_git_prompt_color_untrackedfiles yellow
    set -g __fish_git_prompt_showupstream auto
    set -g __fish_git_prompt_color_upstream brblue

    # source ~/.config/fish/prompt.fish
    starship init fish | source
end

source ~/.config/fish/private.fish
