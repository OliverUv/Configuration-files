function fish_prompt --description 'Write out the prompt'
	if test -z $VIRTUAL_ENV
   printf '%s%s@%s%s%s%s%s> ' (set_color yellow) (whoami) (set_color purple) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
 else
   printf '%s%s@%s%s%s(%s)%s%s%s> ' (set_color yellow) (whoami) (set_color purple) (hostname|cut -d . -f 1) (set_color blue) (basename $VIRTUAL_ENV) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
 end
end
