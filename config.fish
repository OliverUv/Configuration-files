if status --is-login
	set PATH $PATH ~/bin
        set TERM screen-256color
end

if type ksshaskpass >/dev/null ^/dev/null
    set SSH_ASKPASS ksshaskpass
    ssh-add </dev/null
end
