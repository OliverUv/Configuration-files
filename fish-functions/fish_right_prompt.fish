function fish_right_prompt --description 'Write out the prompt'
	#Save the return status of the previous command
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o normal)
    set __fish_text_status " "
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
        set __fish_text_status "($stat)"
    end

    switch $USER

        case root toor

            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'

            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            printf '%s%s%s %s ' "$__fish_color_status" "$__fish_text_status" "$__fish_prompt_normal" (date "+%H:%M:%S")

    end
end
