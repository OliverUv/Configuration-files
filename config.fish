set PATH $PATH /usr/local/bin
set PATH $PATH /usr/bin
set PATH $PATH /bin
set PATH $PATH ~/bin
set PATH $PATH ~/bin.priv
set PATH $PATH ~/.g-npm/bin
set PATH $PATH ~/.arcanist/arcanist/bin
set PATH $PATH ~/.cargo/bin

set fish_greeting " "

set TERM screen-256color

set -x LOCATE_PATH "$HOME/.locate.db"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x EDITOR vim

set -x KITTEN "/home/polydrone/codemao/egret-ide"
set -x BLOCKLYCRAFT "/home/polydrone/codemao/BlocklyCraft"
set -x MC_SERVER_DIR "/home/polydrone/mc_tmp/spigot1102"
set -x LODASH "/home/polydrone/work_tmp/lodash.js"

set -x RUST_SRC_PATH "/home/polydrone/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

eval (python -m virtualfish)
