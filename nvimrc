" Setup {{{ "
if &compatible
  set nocompatible
endif

let g:dein#types#git#default_protocol = 'ssh'

let g:vimproc#dll_path = '~/.cache/dein/repos/github.com/Shougo/vimproc.vim/lib/vimproc_linux64.so'

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let deinpath = expand('~/.cache/dein')
" }}} Setup "

" Priority Settings {{{ "
" only on save because of box3. This needs to happen
" before we load ALE
let g:ale_lint_on_text_changed = 'never'
" }}} Priority Settings "

" Dein Plugin Loading {{{ "
" Setup {{{ "
if dein#load_state(deinpath)

    " Required:
    call dein#begin(deinpath)
    
    " Required: Let dein manage dein
    call dein#add('Shougo/dein.vim')
    
    " You can specify revision/branch/tag.
    " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
    " }}} Setup "

    " Auto-Completion {{{ "
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('Shougo/context_filetype.vim')
    " call dein#add('mhartington/nvim-typescript')
    call dein#local('/home/ponder/Projects', {} , ['nvim-typecript'])
    " let $NVIM_NODE_LOG_FILE='/home/ponder/nvim-node.log'
    " let $NVIM_NODE_LOG_LEVEL='warn'
    call dein#add('Rip-Rip/clang_complete.git')
    call dein#add('hrsh7th/vim-neco-calc.git')
    call dein#add('ujihisa/neco-ghc.git')
    call dein#add('ujihisa/neco-look.git')
    " call dein#add('Shougo/neocomplete.vim.git')
    " }}} Auto-Completion "

    " Navigation {{{ "
    " Denite {{{ "
    call dein#add('Shougo/denite.nvim.git')
    call dein#add('neoclide/denite-extra.git')
    " }}} Denite "
    " Unite {{{ "
    " Some of these are also used by Denite
    call dein#add('Shougo/unite.vim.git') " to use unite plugins
    call dein#add('Shougo/unite-help.git')
    call dein#add('Shougo/unite-outline.git')
    call dein#add('Shougo/unite-session.git')
    call dein#add('osyo-manga/unite-quickfix.git')
    call dein#add('thinca/vim-unite-history.git')
    call dein#add('tsukkee/unite-tag.git')
    call dein#add('skeept/Ultisnips-neocomplete-unite.git')
    call dein#add('raghur/fruzzy.git') " requires :call fruzzy#install()
    " }}} Unite/Denite "
    call dein#add('OliverUv/windowing.vim.git')
    call dein#add('KabbAmine/zeavim.vim.git')
    call dein#add('Shougo/neomru.vim.git')
    call dein#add('Shougo/neoyank.vim.git')
    call dein#add('bruno-/vim-man.git')
    call dein#add('ihameed/vim-togglelist.git')
    call dein#add('justinmk/vim-sneak.git')
    call dein#add('linktohack/vim-space.git')
    call dein#add('bkad/CamelCaseMotion.git')
    call dein#add('thinca/vim-fontzoom.git')
    call dein#add('szw/vim-maximizer.git')
    call dein#add('ton/vim-bufsurf.git')
    call dein#add('derekwyatt/vim-fswitch.git')
    " }}} Navigation "

    " IDE {{{ "
    " Language Focus {{{ "
    call dein#add('jalvesaq/Nvim-R.git') " R-lang
    call dein#add('Quramy/tsuquyomi.git') " TypeScript
    call dein#add('davidhalter/jedi-vim.git') " Python
    " call dein#add('klen/python-mode.git')
    call dein#add('racer-rust/vim-racer.git') " Rust
    call dein#add('lukerandall/haskellmode-vim.git')
    " }}} Language Focus "
    " Editing {{{ "
    " Text Objects {{{ "
    call dein#add('kana/vim-textobj-function.git')
    call dein#add('kana/vim-textobj-user.git')
    call dein#add('wellle/targets.vim.git')
    call dein#add('michaeljsmith/vim-indent-object.git')
    call dein#add('reedes/vim-textobj-sentence.git')
    call dein#add('beloglazov/vim-textobj-quotes.git')
    call dein#add('Julian/vim-textobj-brace.git')
    call dein#add('beloglazov/vim-textobj-punctuation.git')
    call dein#add('thinca/vim-textobj-between.git')
    " Tried but found lacking {{{ "
    " Bad ones:
    " call dein#add('saaguero/vim-textobj-pastedtext.git')
    " call dein#add('haya14busa/vim-textobj-function-syntax.git')
    " Ok but found no use:
    " call dein#add('kana/vim-textobj-syntax.git')
    " call dein#add('kana/vim-textobj-line.git') " conflicts with
    " targets.vim's 'last', e.g. vil'
    " }}} Tried but found lacking "
    " }}} Text Objects "
    call dein#add('tpope/vim-abolish.git')
    call dein#add('tpope/vim-commentary.git')
    call dein#add('scrooloose/nerdcommenter.git')
    call dein#add('vim-scripts/copycppdectoimp.vim.git')
    call dein#add('tpope/vim-surround.git')
    call dein#add('ap/vim-you-keep-using-that-word.git')
    call dein#add('AndrewRadev/switch.vim.git')
    call dein#add('AndrewRadev/splitjoin.vim.git')
    call dein#add('andymass/vim-matchup.git')
    call dein#add('Raimondi/delimitMate.git')
    " call dein#add('cohama/lexima.vim.git') 
    " was very good but had some annoyances compared to delimitMate
    call dein#add('godlygeek/tabular.git')
    call dein#add('tommcdo/vim-exchange.git')
    call dein#add('tristen/vim-sparkup.git')
    call dein#add('vim-scripts/Enter-Indent.git')
    call dein#add('vim-scripts/RST-Tables.git')
    " call dein#add('tpope/vim-capslock.git')
    call dein#add('gu-fan/colorv.vim.git')
    call dein#add('triglav/vim-visual-increment.git')
    " }}} Editing "

    call dein#add('tpope/vim-fugitive.git')
    call dein#add('junegunn/gv.vim.git')
    call dein#add('w0rp/ale')
    " call dein#add('scrooloose/syntastic.git')
    call dein#add('tpope/vim-eunuch.git')
    call dein#add('OliverUv/vim-unimpaired.git')
    call dein#add('SirVer/ultisnips.git')
    call dein#add('honza/vim-snippets.git')
    call dein#add('chrisbra/Recover.vim.git')
    call dein#add('ludovicchabant/vim-gutentags.git')
    call dein#add('mattn/gist-vim.git')
    call dein#add('marijnh/tern_for_vim.git')
    call dein#add('mbbill/undotree.git')
    call dein#add('embear/vim-localvimrc.git')
    call dein#add('stevearc/vim-arduino.git')
    call dein#add('haya14busa/incsearch.vim.git')
    call dein#add('francoiscabrol/ranger.vim.git')

    call dein#add('autozimu/LanguageClient-neovim', {
                \ 'rev': 'next',
                \ 'build': 'bash install.sh',
                \ })

    " call dein#add('dyng/ctrlsf.vim.git') " not great
    " call dein#add('tpope/vim-dispatch.git')
    " call dein#add('brooth/far.vim.git') " not working too well yet
    " }}} IDE "

    " File Types {{{ "
    call dein#add('cespare/vim-toml.git')
    call dein#add('dag/vim-fish.git')
    call dein#add('vim-scripts/rest.vim.git') " RST
    call dein#add('vim-scripts/haskell.vim.git')
    call dein#add('vim-scripts/httplog.git') " HTTP logs
    call dein#add('tpope/vim-git.git')
    call dein#add('tikhomirov/vim-glsl.git')
    call dein#add('tobym/vim-scala.git')
    call dein#add('mxw/vim-jsx.git')
    call dein#add('pangloss/vim-javascript.git')
    call dein#add('hail2u/vim-css3-syntax.git')
    call dein#add('digitaltoad/vim-jade.git')
    call dein#add('groenewege/vim-less.git')
    call dein#add('kchmck/vim-coffee-script.git')
    call dein#add('HerringtonDarkholme/yats.vim.git') " TypeScript syntax
    call dein#add('StanAngeloff/php.vim.git')
    call dein#add('PotatoesMaster/i3-vim-syntax.git')
    call dein#add('OliverUv/vim-lesscss.git')
    call dein#add('Glench/Vim-Jinja2-Syntax.git')
    call dein#add('sukima/vim-tiddlywiki.git')
    call dein#add('wting/rust.vim.git')
    call dein#add('Shougo/neco-syntax.git') " Shougo things
    call dein#add('sudar/vim-arduino-snippets') " arduino ultisnips
    " }}} File Types "

    " Libs {{{ "
    call dein#add('tpope/vim-repeat.git')
    call dein#add('Shougo/tabpagebuffer.vim.git')
    call dein#add('MarcWeber/vim-addon-mw-utils.git')
    call dein#add('tomtom/tlib_vim.git')
    call dein#add('Shougo/vimproc.vim.git')
    call dein#add('vim-scripts/L9.git')
    call dein#add('mattn/webapi-vim.git')
    " }}} Libs "

    " Bling {{{ "
    " call dein#add('jaxbot/semantic-highlight.vim.git') " too crazy + seems to not work
    call dein#add('vim-scripts/Rainbow-Parentheses-Improved-and2.git')
    call dein#add('skammer/vim-css-color.git')
    " call dein#add('luochen1990/rainbow.git')
    call dein#add('romainl/flattened.git')
    call dein#add('junegunn/goyo.vim.git')
    call dein#add('nathanaelkane/vim-indent-guides.git')
    call dein#add('morhetz/gruvbox.git')
    call dein#add('abudden/taghighlight-automirror.git')
    call dein#add('godlygeek/csapprox.git')
    call dein#add('gerw/vim-HiLinkTrace.git')
    " call dein#add('airblade/vim-gitgutter.git') " Didn't find it useful enough
    " }}} Bling "

    " Management {{{ "
    call dein#add('blindFS/vim-taskwarrior.git')
    call dein#add('tbabej/taskwiki.git')
    call dein#add('vimwiki/vimwiki.git')
    " }}} Management "

    " Misc {{{ "
    call dein#add('vim-scripts/VST.git') " Export to HTML
    " }}} Misc "

    " Finish Setup {{{ "
        " Required:
        call dein#end()
        call dein#save_state()
    endif
    " }}} Finish Setup "
" }}} Dein Plugin Loading "

" Plugin Settings {{{ "

" Deoplete {{{ "
let g:deoplete#enable_at_startup = 1

" " file complete sources from buffer dir instead of current dir
" " used to have it until it broke, but don't think I even want it now?
" let g:deoplete#file#enable_buffer_path = 1

" No preview window
set completeopt-=preview
" More completions
let g:nvim_typescript#max_completion_detail = 100

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction

" }}} Deoplete "

" ALE {{{ "
" only on save because of box3
let g:ale_lint_on_text_changed = 'never'
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_error = '-▶'
let g:ale_sign_warning = '-◈'
let g:ale_sign_info = '-◇'
let g:ale_linters = {
\   'rust': [
\       'rust-analyzer',
\   ],
\}

let g:ale_rust_rls_executable = '~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/rust-analyzer'
" let g:ale_rust_rls_executable = 'rust-analyzer'
" let g:ale_rust_rls_toolchain = ''

let g:ale_fixers = {
\   'rust': [
\       'analyzer',
\   ],
\   'typescript': [
\       'tslint',
\       'remove_trailing_lines',
\       'trim_whitespace',
\   ],
\}
nmap <leader>ma <Plug>(ale_fix)
nmap <silent> [w <Plug>(ale_previous_wrap)
nmap <silent> ]w <Plug>(ale_next_wrap)
" }}} ALE "

" LanguageClient-neovim {{{ "
" '~/.cargo/bin/rust-analyzer'
" '~/.cargo/bin/rustup', 'run', 'stable', 'rls'
" '~/.cargo/bin/rustup', 'run', 'nightly', 'rust-analyzer'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rust-analyzer'],
    \ }

let g:LanguageClient_autoStart = 1
let g:LanguageClient_useVirtualText = "No"

" }}} LanguageClient-neovim "

" Misc {{{ "
let g:gutentags_ctags_exclude = ['node_modules', 'build', 'dist']
let g:echodoc#enable_at_startup = 1
" }}} Misc "

" }}} Plugin Settings "

" Neovim Config {{{ "

" Terminal Mode {{{ "

tnoremap <Esc> <C-\><C-n>
tnoremap <leader><Esc> <Esc>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" }}} Terminal Mode "

set pumblend=15
set winblend=0
set inccommand=nosplit

" }}} neovim config "


" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif

" Color Settings {{{ "
set t_ut=
set termguicolors
let rcmfile = '/tmp/termcolor'
if filereadable(rcmfile)
    let rrr = readfile(rcmfile)
    if matchstr(rrr[0], '^1')
        colorscheme proton
    else
        colorscheme liquorice
    endif
else
    colorscheme liquorice
endif
" }}} Color Settings "

let sharedrc = expand('~/Configuration-files/vim8_nvim_rc.vim')
if filereadable(sharedrc)
    exec "source " . sharedrc
endif
