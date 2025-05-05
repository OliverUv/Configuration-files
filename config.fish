set PATH $PATH /bin
set PATH $PATH /usr/bin
set PATH $PATH /usr/local/bin
set PATH $PATH ~/.arcanist/arcanist/bin
set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/.g-npm/bin
set PATH $PATH ~/.local/bin
set PATH $PATH ~/Projects/floating_fzf/bin
set PATH $PATH ~/Projects/fzf/bin
set PATH $PATH ~/bin
set PATH $PATH ~/bin.priv

# set SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

set fish_greeting " "

set TERM xterm-256color
set COLORTERM "truecolor"

set -x MANPAGER "vi +Man!"
set -x MANWIDTH 999

set -x LOCATE_PATH "$HOME/.locate.db"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x EDITOR vi

set -x RUST_SRC_PATH "$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

set -x N_PREFIX "$HOME/.local"

set -x NVIM_TUI_ENABLE_TRUE_COLOR 1

if status is-interactive
    rcm --shade --bg-escape
end
