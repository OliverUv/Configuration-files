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
    call dein#add('mhartington/nvim-typescript')
    call dein#add('Rip-Rip/clang_complete.git')
    call dein#add('hrsh7th/vim-neco-calc.git')
    call dein#add('ujihisa/neco-ghc.git')
    call dein#add('ujihisa/neco-look.git')
    " call dein#add('Shougo/neocomplete.vim.git')
    " }}} Auto-Completion "

    " Navigation {{{ "
    " Unite/Denite {{{ "
    call dein#add('Shougo/denite.nvim.git')
    call dein#add('Shougo/unite.vim.git') " to use unite plugins
    call dein#add('Shougo/unite-help.git')
    call dein#add('Shougo/unite-outline.git')
    call dein#add('Shougo/unite-session.git')
    call dein#add('osyo-manga/unite-quickfix.git')
    call dein#add('thinca/vim-unite-history.git')
    call dein#add('tsukkee/unite-tag.git')
    call dein#add('skeept/Ultisnips-neocomplete-unite.git')
    " }}} Unite/Denite "
    call dein#add('OliverUv/windowing.vim.git')
    call dein#add('KabbAmine/zeavim.vim.git')
    call dein#add('Shougo/neomru.vim.git')
    call dein#add('Shougo/neoyank.vim.git')
    call dein#add('Shougo/tabpagebuffer.vim.git')
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
    call dein#add('jalvesaq/Nvim-R.git') " TypeScript
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
    " }}} Text Objects "
    call dein#add('tpope/vim-abolish.git')
    call dein#add('tpope/vim-commentary.git')
    call dein#add('scrooloose/nerdcommenter.git')
    call dein#add('vim-scripts/copycppdectoimp.vim.git')
    call dein#add('tpope/vim-surround.git')
    call dein#add('ap/vim-you-keep-using-that-word.git')
    call dein#add('AndrewRadev/switch.vim.git')
    call dein#add('Raimondi/delimitMate.git')
    call dein#add('godlygeek/tabular.git')
    call dein#add('tommcdo/vim-exchange.git')
    call dein#add('tristen/vim-sparkup.git')
    call dein#add('vim-scripts/Enter-Indent.git')
    call dein#add('vim-scripts/RST-Tables.git')
    " call dein#add('tpope/vim-capslock.git')
    call dein#add('gu-fan/colorv.vim.git')
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
    " call dein#add('tpope/vim-dispatch.git')
    " }}} IDE "

    " File Types {{{ "
    call dein#add('cespare/vim-toml.git')
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
    call dein#add('HerringtonDarkholme/yats.vim.git') " TypeScript
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
    call dein#add('vim-scripts/Rainbow-Parentheses-Improved-and2.git')
    call dein#add('skammer/vim-css-color.git')
    call dein#add('luochen1990/rainbow.git')
    call dein#add('romainl/flattened.git')
    call dein#add('junegunn/goyo.vim.git')
    call dein#add('nathanaelkane/vim-indent-guides.git')
    call dein#add('morhetz/gruvbox.git')
    call dein#add('abudden/taghighlight-automirror.git')
    call dein#add('godlygeek/csapprox.git')
    call dein#add('gerw/vim-HiLinkTrace.git')
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
let g:deoplete#file#enable_buffer_path = 1
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
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_error = '-▶'
let g:ale_sign_warning = '-◈'
let g:ale_sign_info = '-◇'
let g:ale_linters = {
\   'rust': [
\       'rls',
\   ],
\}
let g:ale_fixers = {
\   'rust': [
\       'rls',
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

" Misc {{{ "
let g:gutentags_ctags_exclude = ['node_modules', 'build', 'dist']
let g:echodoc#enable_at_startup = 1
" }}} Misc "

" }}} Plugin Settings "

" Terminal Mode {{{ "

tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" }}} Terminal Mode "

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif

" Color Settings {{{ "
set t_ut=
set termguicolors
colorscheme liquorice
" }}} Color Settings "

let sharedrc = expand('~/Configuration-files/vim8_nvim_rc.vim')
if filereadable(sharedrc)
    exec "source " . sharedrc
endif
