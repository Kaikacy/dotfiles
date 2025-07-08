function fish_prompt
    set -l last_status $status
    set -l cmd_duration $CMD_DURATION

    set -l fmt_status
    if test $last_status -ne 0
        set fmt_status (set_color --bold red) $last_status ' ' (set_color normal)
    end

    set -l job_count (jobs --group | count)
    set -l fmt_jobs
    if test $job_count -ne 0
        set fmt_jobs (set_color --bold magenta) $job_count ' ' (set_color normal)
    end

    set -l git_info (fish_vcs_prompt ' ')
    set -l fmt_git
    if test -n "$git_info"
        set fmt_git (set_color brblack) (string sub -s 2 $git_info) (set_color normal)
    end

    set -l cmd_duration (expr (expr $cmd_duration + 500) / 1000)
    set -l fmt_duration
    if test $cmd_duration -ge 5
        if test $cmd_duration -lt 60
            set fmt_duration $cmd_duration s
        else if test $cmd_duration -lt 3600
            set fmt_duration (date -u -d @$cmd_duration "+%Mm%Ss")
        else
            set fmt_duration (date -u -d @$cmd_duration "+%Hh%Mm%Ss")
        end
        set fmt_duration (set_color yellow) $fmt_duration ' ' (set_color normal)
    end

    set -l cwd (set_color --bold cyan) (basename (pwd | string replace $HOME '~')) ' ' (set_color normal)

    set -l symbol_color green
    if test $last_status -ne 0
        set symbol_color red
    end
    set -l symbol (set_color --bold $symbol_color) 'λ ' (set_color normal)

    echo -ns $cwd $fmt_git $fmt_jobs $fmt_status $fmt_duration $symbol
end
