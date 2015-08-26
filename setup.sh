#!/usr/bin/env bash

DOTNAMED="profile tmux.conf Xdefaults vimrc gvimrc agignore gitconfig gitignoreglobal vimperatorrc"

for f in $DOTNAMED ; do
    ln -s "~/Configuration-files/$f" "~/.$f"
done

mkdir -p ~/.config/fish
mkdir -p ~/.vimperator/info/dev-edition-default
mkdir -p ~/.i3
mkdir -p ~/.mpv

ln -s ~/Configuration-files/coffeelint.json ~/.config/coffeelint.json
ln -s ~/Configuration-files/flake8 ~/.config/flake8

ln -s ~/Configuration-files/config.fish ~/.config/fish/config.fish
ln -s ~/Configuration-files/fish-functions ~/.config/fish/functions

ln -s ~/Configuration-files/vimperatorcolors ~/.vimperator/colors
ln -s ~/Configuration-files/vimperatorplugin ~/.vimperator/plugin
ln -s ~/Configuration-files/vimperatorquickmarks ~/.vimperator/info/dev-edition-default/quickmarks
ln -s ~/Configuration-files/vimperatorignored-keys ~/.vimperator/info/dev-edition-default/ignored-keys

ln -s ~/Configuration-files/i3status.conf ~/.i3/status.conf
ln -s ~/Configuration-files/i3config.base ~/.i3/config.base
ln -s ~/Configuration-files/i3config.local ~/.i3/config.local

ln -s ~/Configuration-files/mpv-input.conf ~/.mpv/input.conf

echo "conkyrc urxvt-perls vimrc.local" | xargs echo "Needs manual linking:"

echo "Needs install:"
echo "sudo pip install i3-py"
echo "git clone 'git@github.com:OliverUv/quickswitch-for-i3.git'"
