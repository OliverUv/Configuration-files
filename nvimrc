"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let g:dein#types#git#default_protocol = 'ssh'

" Required:
set runtimepath+=/home/polydrone/Configuration-files/nvim_dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/polydrone/Configuration-files/nvim_dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
" call dein#add('Shougo/neosnippet.vim')
" call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')

call dein#add('AndrewRadev/switch.vim.git')
call dein#add('Glench/Vim-Jinja2-Syntax.git')
call dein#add('HerringtonDarkholme/yats.vim.git')
call dein#add('KabbAmine/zeavim.vim.git')
call dein#add('MarcWeber/vim-addon-mw-utils.git')
call dein#add('OliverUv/vim-lesscss.git')
call dein#add('OliverUv/windowing.vim.git')
call dein#add('PotatoesMaster/i3-vim-syntax.git')
call dein#add('Quramy/tsuquyomi.git')
call dein#add('Raimondi/delimitMate.git')
call dein#add('Rip-Rip/clang_complete.git')
call dein#add('Shougo/context_filetype.vim.git')
call dein#add('Shougo/neco-syntax.git')
" call dein#add('Shougo/neocomplete.vim.git')
call dein#add('Shougo/neomru.vim.git')
call dein#add('Shougo/neoyank.vim.git')
call dein#add('Shougo/tabpagebuffer.vim.git')
call dein#add('Shougo/unite.vim.git')
" call dein#add('Shougo/denite.nvim.git')
call dein#add('Shougo/unite-help.git')
call dein#add('Shougo/unite-outline.git')
call dein#add('Shougo/unite-session.git')
call dein#add('osyo-manga/unite-quickfix.git')
call dein#add('thinca/vim-unite-history.git')
call dein#add('tsukkee/unite-tag.git')
call dein#add('skeept/Ultisnips-neocomplete-unite.git')
call dein#add('SirVer/ultisnips.git')
call dein#add('StanAngeloff/php.vim.git')
call dein#add('abudden/taghighlight-automirror.git')
call dein#add('ap/vim-you-keep-using-that-word.git')
call dein#add('bkad/CamelCaseMotion.git')
call dein#add('bruno-/vim-man.git')
call dein#add('chrisbra/Recover.vim.git')
call dein#add('davidhalter/jedi-vim.git')
call dein#add('derekwyatt/vim-fswitch.git')
call dein#add('digitaltoad/vim-jade.git')
call dein#add('embear/vim-localvimrc.git')
call dein#add('godlygeek/csapprox.git')
call dein#add('godlygeek/tabular.git')
call dein#add('groenewege/vim-less.git')
call dein#add('hail2u/vim-css3-syntax.git')
call dein#add('honza/vim-snippets.git')
call dein#add('hrsh7th/vim-neco-calc.git')
call dein#add('ihameed/vim-togglelist.git')
call dein#add('junegunn/goyo.vim.git')
call dein#add('justinmk/vim-sneak.git')
call dein#add('kana/vim-textobj-function.git')
call dein#add('kana/vim-textobj-user.git')
call dein#add('kchmck/vim-coffee-script.git')
call dein#add('linktohack/vim-space.git')
call dein#add('ludovicchabant/vim-gutentags.git')
call dein#add('lukerandall/haskellmode-vim.git')
call dein#add('luochen1990/rainbow.git')
call dein#add('majutsushi/tagbar.git')
call dein#add('majutsushi/urxvt-font-size.git')
call dein#add('marijnh/tern_for_vim.git')
call dein#add('mattn/gist-vim.git')
call dein#add('mattn/webapi-vim.git')
call dein#add('mbbill/undotree.git')
call dein#add('michaeljsmith/vim-indent-object.git')
call dein#add('morhetz/gruvbox.git')
call dein#add('mxw/vim-jsx.git')
call dein#add('nathanaelkane/vim-indent-guides.git')
call dein#add('pangloss/vim-javascript.git')
call dein#add('romainl/flattened.git')
call dein#add('scrooloose/nerdcommenter.git')
call dein#add('scrooloose/syntastic.git')
call dein#add('skammer/vim-css-color.git')
call dein#add('szw/vim-maximizer.git')
call dein#add('thinca/vim-fontzoom.git')
call dein#add('tikhomirov/vim-glsl.git')
call dein#add('tobym/vim-scala.git')
call dein#add('tommcdo/vim-exchange.git')
call dein#add('tomtom/tlib_vim.git')
call dein#add('ton/vim-bufsurf.git')
call dein#add('tpope/vim-abolish.git')
call dein#add('tpope/vim-capslock.git')
call dein#add('tpope/vim-commentary.git')
call dein#add('tpope/vim-dispatch.git')
call dein#add('tpope/vim-eunuch.git')
call dein#add('tpope/vim-fugitive.git')
call dein#add('tpope/vim-git.git')
call dein#add('tpope/vim-repeat.git')
call dein#add('tpope/vim-surround.git')
call dein#add('tpope/vim-unimpaired.git')
call dein#add('tristen/vim-sparkup.git')
call dein#add('ujihisa/neco-ghc.git')
call dein#add('ujihisa/neco-look.git')
call dein#add('vim-scripts/Enter-Indent.git')
call dein#add('vim-scripts/L9.git')
call dein#add('vim-scripts/RST-Tables.git')
call dein#add('vim-scripts/Rainbow-Parentheses-Improved-and2.git')
call dein#add('vim-scripts/VST.git')
call dein#add('vim-scripts/colorv.vim.git')
call dein#add('vim-scripts/copycppdectoimp.vim.git')
call dein#add('vim-scripts/haskell.vim.git')
call dein#add('vim-scripts/httplog.git')
call dein#add('vim-scripts/rest.vim.git')
call dein#add('wellle/targets.vim.git')
call dein#add('wting/rust.vim.git')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

if filereadable(glob("~/.vimrc"))
    source ~/.vimrc
endif
