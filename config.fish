if status --is-login
	set PATH $PATH ~/bin
end

if type ksshaskpass >/dev/null ^/dev/null
    set SSH_ASKPASS ksshaskpass
    ssh-add </dev/null
end
