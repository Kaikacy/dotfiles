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

end

function fish_prompt
    set -l last_status $status

    set -l git_info (fish_vcs_prompt ' ')
    set -l fmt_git
    if test -n "$git_info"
        set fmt_git (set_color brblack) (echo $git_info | string sub -s 2) (set_color normal)
    end

    set -l cwd (set_color --bold cyan) (basename (pwd | string replace $HOME '~')) ' ' (set_color normal)

    set -l symbol_color green
    if test $last_status -ne 0
        set symbol_color red
    else if jobs -q >/dev/null
        set symbol_color yellow
    end
    set -l symbol (set_color --bold $symbol_color) 'λ ' (set_color normal)

    echo -ns $cwd $fmt_git $fmt_jobs $symbol
end

function fish_right_prompt
    set -l last_status $status
    set -l cmd_duration $CMD_DURATION

    set -l fmt_status
    if test $last_status -ne 0
        set fmt_status (set_color --bold red) ' ' $last_status (set_color normal)
    end

    set -l job_count (count (jobs --group))
    set -l fmt_jobs
    if test $job_count -ne 0
        set fmt_jobs (set_color --bold yellow) ' ' $job_count (set_color normal)
    end

    set -l cmd_duration (expr (expr $cmd_duration + 500) / 1000)
    set -l fmt_duration
    if test $cmd_duration -ge 5
        if test $cmd_duration -lt 60
            set fmt_duration $cmd_duration s
        else if test $cmd_duration -lt 3600
            set fmt_duration (date -u -d @$cmd_duration "+%Ss%Mm")
        else
            set fmt_duration (date -u -d @$cmd_duration "+%Ss%Mm%Hh")
        end
        set fmt_duration (set_color --bold brblack) $fmt_duration (set_color normal)
    end

    echo -ns $fmt_duration $fmt_jobs $fmt_status
end
