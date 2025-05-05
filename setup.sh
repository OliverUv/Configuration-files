#!/usr/bin/env bash

DOTNAMED="profile tmux.conf Xdefaults vimrc gvimrc ctags gitconfig gitignoreglobal gtkrc-2.0 dmenurc taskrc xsessionrc pam_environment"
HOME=~

for f in $DOTNAMED ; do
    ln -s "$HOME/Configuration-files/$f" "$HOME/.$f"
done

mkdir -p ~/.config/rua
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/conky
mkdir -p ~/.config/dunst
mkdir -p ~/.config/feh
mkdir -p ~/.config/fish
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/nvim
mkdir -p ~/.i3
mkdir -p ~/.proxychains
mkdir -p ~/.tmux/plugins
mkdir -p ~/.urxvt/ext

ln -s ~/Configuration-files/ranger ~/.config/
ln -s ~/Configuration-files/systemd ~/.config/
ln -s ~/Configuration-files/jj ~/.config/

ln -s ~/Configuration-files/alacritty.yml ~/.config/alacritty/
ln -s ~/Configuration-files/mpv ~/.config/

ln -s ~/Configuration-files/rua_wrap ~/.config/rua/wrap_args.d

ln -s ~/Configuration-files/bin ~/bin

ln -s ~/Configuration-files/dotvim ~/.vim
ln -s ~/Configuration-files/nvimrc ~/.config/nvim/init.vim
ln -s ~/Configuration-files/dotvim/colors ~/.config/nvim/colors
ln -s ~/Configuration-files/dotvim/ftdetect ~/.config/nvim/ftdetect
ln -s ~/Configuration-files/dotvim/ftplugin ~/.config/nvim/ftplugin
ln -s ~/Configuration-files/dotvim/spell ~/.config/nvim/spell
ln -s ~/Configuration-files/dotvim/syntax ~/.config/nvim/syntax
ln -s ~/Configuration-files/dotvim/UltiSnips ~/.config/nvim/UltiSnips

ln -s ~/Configuration-files/dunstrc ~/.config/dunst/dunstrc

ln -s ~/Configuration-files/fehbuttons ~/.config/feh/buttons
ln -s ~/Configuration-files/fehkeys ~/.config/feh/keys
ln -s ~/Configuration-files/fehthemes ~/.config/feh/themes

ln -s ~/Configuration-files/config.fish ~/.config/fish/config.fish
ln -s ~/Configuration-files/fish-functions ~/.config/fish/functions
ln -s ~/Configuration-files/fish-completions ~/.config/fish/completions
ln -s ~/Configuration-files/fish_plugins ~/.config/fish/fish_plugins

ln -s ~/Configuration-files/gtkrc-3.0 ~/.config/gtk-3.0/settings.ini

ln -s ~/Configuration-files/urxvt-perls/clipboard ~/.urxvt/ext/
ln -s ~/Configuration-files/urxvt-perls/keyboard-select ~/.urxvt/ext/
ln -s ~/Configuration-files/urxvt-perls/url-select ~/.urxvt/ext/
ln -s ~/Configuration-files/urxvt-font-size/font-size ~/.urxvt/ext/

ln -s ~/Configuration-files/i3status.conf ~/.i3/status.conf
ln -s ~/Configuration-files/i3config.base ~/.i3/config.base

ln -s ~/Configuration-files/mpv-input.conf ~/.mpv/input.conf

ln -s ~/Configuration-files/proxychains.conf ~/.proxychains/proxychains.conf

cp -r ~/Configuration-files/tmux/plugins/tpm ~/.tmux/plugins/

echo "conkyrc .vimrc.local .tmux.conf.local i3config.local" | xargs echo "Needs manual linking:"
