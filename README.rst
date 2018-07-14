###################
Configuration-files
###################

Default applications
====================

* p7zip
* atool
* chromium-browser
* conky
* curl
* dmenu_run, dmenu, ..
* docker
* dunst
* exuberant-ctags
* feh
* firefox
  - decentraleyes
  - disconnect
  - stylish
  - gnotifier
  - random agent spoofer
  - ublock origin
  - vimperator
* fish
* gimp
* git
* i3
  - i3-py (pip2,3)
  - i3-quickswitch
  - i3lock
  - rcm
* imagemagick
* kdeconnect
* krita
* lnav (log navigator)
* meld (visual merge tool)
* mpv
* n (for getting node envs)
* ncdu (ncurses du)
* pactl
* pavucontrol
* peek (gif/mp4 screenshot)
* proxychains
* python
  - pip
  - py2
  - py3
  - virtualenv
* r-base (rlang)
* ranger
* redshift
* ripgrep (cargo)
* rlwrap
* shadowsocks
* taskwarrior
* tig
* tmux (1.9+)
* tmsu (tag my shit up)
* tree
* urxvt
* vim
  - vimproc
* wget
* wmctrl
* xbacklight
* xclip
* xdotool
* xsel
* xterm
* zeal

PIP2
====

* tasklib
* youtube-dl

PIP3
====

* tasklib

GET-DEPS
========

apt-get build-dep X

* libcurl4-gnutls-dev
* vim-gtk

R-lang
======

install.package("X")

* ggplot2
* ggrepel
* lintr

APT
===

Via `comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)`

* akonadi-backend-sqlite
* apache2
* apache2-utils
* apg
* asciidoc
* atool
* autoconf
* automake
* build-essential
* byzanz
* calibre
* chromium-codecs-ffmpeg
* cmake
* conky
* curl
* debhelper
* dh-systemd
* docbook-utils
* docker-ce
* dos2unix
* dpkg-dev
* exuberant-ctags
* feh
* ffmpeg
* filezilla
* g++
* gawk
* gimp
* git
* google-chrome-stable
* htop
* ibus
* ibus-libpinyin
* ibus-pinyin
* intel-microcode
* krita
* libacl1-dev
* libappindicator3-dev
* libasound2-dev
* libass-dev
* libavcodec-dev
* libavdevice-dev
* libavfilter-dev
* libavformat-dev
* libavresample-dev
* libavutil-dev
* libbluray-dev
* libcairo2-dev
* libc-ares-dev
* libcdio-paranoia-dev
* libcurl4-gnutls-dev
* libdvdnav-dev
* libdvdread-dev
* libegl1-mesa-dev
* libenca-dev
* libev-dev
* libfdk-aac-dev
* libfontconfig1-dev
* libfreetype6-dev
* libfribidi-dev
* libgl1-mesa-dev
* libglib2.0-dev
* libgnomeui-dev
* libgnutls28-dev
* libgnutls-openssl27
* libgpm-dev
* libgtk2.0-dev
* libgtk-3-dev
* libguess-dev
* libjack-dev
* libjavascriptcoregtk-3.0-dev
* libjpeg-dev
* libjpeg-turbo8-dev
* liblcms2-dev
* liblua5.1-0-dev
* liblua5.2-dev
* libluajit-5.1-dev
* libmbedtls-dev
* libmp3lame-dev
* libncurses5-dev
* libnotify-bin
* libopenal1
* libopenal-dev
* libpam0g-dev
* libpango1.0-0
* libpango1.0-dev
* libpangox-1.0-0
* libpcre3-dev
* libperl-dev
* libpoppler-glib8
* libprotobuf-dev
* libpulse-dev
* libpython2.7-dev
* libpython3-dev
* librubberband-dev
* libsdl2-dev
* libselinux1-dev
* libsmbclient-dev
* libsndio-dev
* libsodium-dev
* libspice-client-gtk-3.0-dev
* libssl-dev
* libstartup-notification0-dev
* libswscale-dev
* libtasn1-6-dev
* libtinfo-dev
* libtool
* libtool-bin
* libudev-dev
* libudns-dev
* libutempter-dev
* libva-dev
* libvdpau-dev
* libwayland-dev
* libwebkitgtk-3.0-dev
* libx11-dev
* libx264-dev
* libxaw7-dev
* libxcb-cursor-dev
* libxcb-dpms0-dev
* libxcb-icccm4-dev
* libxcb-keysyms1-dev
* libxcb-randr0-dev
* libxcb-util0-dev
* libxcb-util-dev
* libxcb-xinerama0-dev
* libxcb-xkb-dev
* libxcb-xrm-dev
* libxdg-basedir-dev
* libxinerama-dev
* libxkbcommon-dev
* libxkbcommon-x11-dev
* libxpm-dev
* libxrandr-dev
* libxss-dev
* libxt-dev
* libxv-dev
* libyajl-dev
* libzzip-0-13
* linux-tools-common
* linux-tools-generic
* lua5.2
* luajit
* mkchromecast
* mupdf
* ncdu
* nmap
* nvidia-367
* oprofile
* pacmixer (tui pavucontrol)
* par
* pavucontrol
* pdf2svg
* php
* php-curl
* pkg-config
* protobuf-compiler
* proxychains
* python3-dev
* python3-pip
* python-dev
* python-docutils
* python-pip
* ranger
* rar
* redshift
* ruby-dev
* rxvt-unicode-256color
* scrot
* shellcheck
* silversearcher-ag
* steam:i386
* synology-assistant
* tcl-dev
* tig
* tmux
* tree
* units
* unrar
* uuid-dev
* valac
* valgrind
* virtualbox
* vlc
* wmctrl
* xbacklight
* xclip
* xdotool
* xmlto
* xsel
* xterm
* yasm
* zanshin
* zeal
* zlib1g-dev
