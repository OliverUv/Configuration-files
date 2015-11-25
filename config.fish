set PATH $PATH /usr/local/bin
set PATH $PATH /usr/bin
set PATH $PATH /bin
set PATH $PATH ~/bin
set PATH $PATH ~/bin.priv
set PATH $PATH ~/.g-npm/bin

set fish_greeting " "

set TERM screen-256color

set -x LOCATE_PATH "$HOME/.locate.db"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x EDITOR vim

eval (python -m virtualfish)
