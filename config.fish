set PATH $PATH /bin
set PATH $PATH /usr/bin
set PATH $PATH /usr/local/bin
set PATH $PATH ~/.arcanist/arcanist/bin
set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/.g-npm/bin
set PATH $PATH ~/.local/bin
set PATH $PATH ~/Configuration-files/floating_fzf/bin
set PATH $PATH ~/Projects/fzf/bin
set PATH $PATH ~/bin
set PATH $PATH ~/bin.priv

# set SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

set fish_greeting " "

set TERM xterm-256color
set COLORTERM "truecolor"

set -x LOCATE_PATH "$HOME/.locate.db"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x EDITOR nvim

set -x SPIGOT_JAR "spigot-1.10.2.jar"
set -x NUKKIT_JAR "nukkit-1.0-SNAPSHOT.jar"
set -x POKKIT_JAR "pokkit-0.5-SNAPSHOT.jar"

set -x CODEMAO "$HOME/codemao"

set -x CATSTORAGE "$CODEMAO/catstorage"
set -x RESUL_TS "$CODEMAO/resul-ts"
set -x KITTEN "$CODEMAO/egret-ide"
set -x BLOCKLYCRAFT "$CODEMAO/BlocklyCraft"
set -x NUKKIT "$CODEMAO/Nukkit"
set -x POKKIT "$CODEMAO/Pokkit"
set -x SPIGOT_SERVER_DIR "$HOME/mc_tmp/spigot1102"
set -x NUKKIT_SERVER_DIR "$HOME/mc_tmp/nukkit1.0"
set -x LODASH "$HOME/work_tmp/lodash.js"

# set -x NODEJS_ORG_MIRROR "http://npm.taobao.org/mirrors/node"
# set -x IOJS_ORG_MIRROR "http://npm.taobao.org/mirrors/iojs"
# set -x NVM_NODEJS_ORG_MIRROR "http://npm.taobao.org/mirrors/node"
# set -x NVM_IOJS_ORG_MIRROR "http://npm.taobao.org/mirrors/iojs"
# set -x PHANTOMJS_CDNURL "http://npm.taobao.org/mirrors/phantomjs"
# set -x CHROMEDRIVER_CDNURL "http://npm.taobao.org/mirrors/chromedriver"
# set -x OPERADRIVER_CDNURL "http://npm.taobao.org/mirrors/operadriver"
# set -x SELENIUM_CDNURL "http://npm.taobao.org/mirrors/selenium"
# set -x ELECTRON_MIRROR "http://npm.taobao.org/mirrors/electron"
# set -x SASS_BINARY_SITE "http://npm.taobao.org/mirrors/node-sass"
# set -x SQLITE3_BINARY_SITE "http://npm.taobao.org/mirrors/sqlite3"
# set -x NPM_CONFIG_PROFILER_BINARY_HOST_MIRROR "http://npm.taobao.org/mirrors/node-inspector"

set -x RUST_SRC_PATH "$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

set -x N_PREFIX "$HOME/.local"

set -x NVIM_TUI_ENABLE_TRUE_COLOR 1
# set -x PP pp
set -x PP ""

# eval (python -m virtualfish)

if status is-interactive
    rcm --shade --bg-escape
end
