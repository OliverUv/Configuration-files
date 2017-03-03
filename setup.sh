#!/usr/bin/env bash

DOTNAMED="profile tmux.conf Xdefaults vimrc gvimrc ctags agignore gitconfig gitignoreglobal vimperatorrc gtkrc-2.0 dmenurc"
HOME=~

for f in $DOTNAMED ; do
    ln -s "$HOME/Configuration-files/$f" "$HOME/.$f"
done

mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim
mkdir -p ~/.config/dunst
mkdir -p ~/.vimperator/info/dev-edition-default
mkdir -p ~/.i3
mkdir -p ~/.mpv
mkdir -p ~/.urxvt/ext

ln -s ~/Configuration-files/coffeelint.json ~/.config/coffeelint.json
ln -s ~/Configuration-files/flake8 ~/.config/flake8

ln -s ~/Configuration-files/bin ~/bin

ln -s ~/Configuration-files/dotvim ~/.vim
ln -s ~/Configuration-files/nvimrc ~/.config/nvim/init.vim

ln -s ~/Configuration-files/dunstrc ~/.config/dunst/dunstrc

ln -s ~/Configuration-files/config.fish ~/.config/fish/config.fish
ln -s ~/Configuration-files/fish-functions ~/.config/fish/functions
ln -s ~/Configuration-files/fish-completions ~/.config/fish/completions

ln -s ~/Configuration-files/urxvt-perls/clipboard ~/.urxvt/ext/
ln -s ~/Configuration-files/urxvt-perls/keyboard-select ~/.urxvt/ext/
ln -s ~/Configuration-files/urxvt-perls/url-select ~/.urxvt/ext/
ln -s ~/Configuration-files/urxvt-font-size/font-size ~/.urxvt/ext/

ln -s ~/Configuration-files/vimperatorcolors ~/.vimperator/colors
ln -s ~/Configuration-files/vimperatorplugin ~/.vimperator/plugin
ln -s ~/Configuration-files/vimperatorquickmarks ~/.vimperator/info/dev-edition-default/quickmarks
ln -s ~/Configuration-files/vimperatorignored-keys ~/.vimperator/info/dev-edition-default/ignored-keys

ln -s ~/Configuration-files/i3status.conf ~/.i3/status.conf
ln -s ~/Configuration-files/i3config.base ~/.i3/config.base

ln -s ~/Configuration-files/mpv-input.conf ~/.mpv/input.conf

echo "conkyrc urxvt-perls .vimrc.local .tmux.conf.local i3config.local" | xargs echo "Needs manual linking:"
