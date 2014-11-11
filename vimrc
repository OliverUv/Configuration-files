" Initialization {{{ "
"let g:pathogen_disabled = ['ctrlp', 'ctrlp-funky', 'vim-sneak', 'CoVim', 'neocomplcache', 'neocomplcache-ultisnips', 'python-mode', 'Rainbow-Parentheses-Improved-and2']
let g:pathogen_disabled = ['ctrlp', 'ctrlp-funky', 'vim-sneak', 'CoVim', 'neocomplcache', 'neocomplcache-ultisnips', 'python-mode', 'vim-niji']

if has("win32") || has("win64")
   " Required by pathogen.vim for loading plugins
   call pathogen#infect()

   "Required by vim-latex on windows machines
   set shellslash

   "Otherwise vim will try to write temp files in sys32 folder when editing new file
   set directory=.,$TEMP
else
   call pathogen#infect('~/.vim/bundle')
   " Unless we're in gvim, set up colors
   if !has("gui_running")
       set t_Co=256
       colorscheme liquorice-approx
   end
end

" Fix for my shell, otherwise some scripts break
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif
" }}} Initialization  "

" Automatic commands {{{ "
if has("autocmd")
augroup MyAutoCmd
    " Clear autocmds for this group
    autocmd!

    " Automatically load vimrc when it is saved
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
          \ so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif

    " Mapping for checking for existing mappings in vimrc
    autocmd BufEnter .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
          \ nnoremap <leader>' /leader>

    " Set ghc as compiler for haskell files
    autocmd BufEnter *.hs compiler ghc

    " Disable foldcolumn in diff windows
    au FilterWritePre * if &diff | setlocal fdc=0 | endif

    " Disable things that disturb diff-colors in diff window
    au FilterWritePre * if &diff | setlocal nocursorcolumn | endif
    au FilterWritePre * if &diff | setlocal nocursorline | endif
    au FilterWritePre * if &diff | IndentGuidesDisable | endif
augroup end
endif
" }}} Automatic commands "

" Custom commands {{{ "
" :Configure to edit this file in a split window
command! Configure edit $MYVIMRC
command! SConfigure split $MYVIMRC
command! VConfigure vsplit $MYVIMRC

" :Cdpwd to set current window's pwd to the edited file's directory
command! Cdpwd lcd %:p:h

" :Q to quit
command! Q q
command! Qall qall

" Recover a file then write :DiffOrig to see
" a vimdiff between the recovery and the original.
" (sort of superceded by recover.vim)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Copy current file path into os buffer
command! Ypwd let @+ = expand("%:p")

" }}} Custom commands "

" Basic settings {{{ "
syntax enable           " Enables syntax highlighting with custom colors
filetype plugin indent on " React on filetypes with plugins and syntax
set scrolloff=4         " Minimum number of lines to display around cursor
set autoread            " Files changed from outside are automatically reread
set hlsearch            " Highlight search results
set mousehide           " Hide the mouse when typing text
set smarttab            " <TAB> inserts 'shiftwidth' spaces
set shiftwidth=4        " Amount of spaces for tab to insert
set autoindent          " Automatically set the indent when creating new lines.
set showcmd             " Shows current command in statusline
set ruler               " Show cursor position information in statusline
set relativenumber      " Show relative line numbers by default
set number              " Show absolute line number of current line
set wrap                " Wrap text
"set list               " Show listchars
set ttyfast             " 'Smooth' scrolling
set mouse=a             " Enable mouse in terminals that support it
set showmatch           " Briefly display matching brackets when inserting such.
set incsearch           " Incremental searching as soon as typing begins.
set ignorecase          " Ignores case when searching
set smartcase           " Will override ignorecase if searching w/ diff cases.
set modeline            " Use modelines
set expandtab           " Makes <tab> insert spaces in insert mode
set wildchar=<TAB>      " Key that triggers command-line expansion.
set wildmenu            " Completion on commandline
set wildmode=longest:full " Commandline completion mode
set noerrorbells        " Disables beeping.
set hidden              " Allow switch buffer without saving
set previewheight=15    " Height of the preview window
"set winwidth=80        " Current window will be resized to this width
set switchbuf=useopen   " If switching to a buffer that is already open, go
                        " to where it is already open instead of here.
set backspace=indent,eol,start whichwrap+=<,>,[,] " backspace functionality
set formatprg=par        " user par to format text with the gq command
set formatoptions=croqlj " auto formatting options
                         " c - autowrap using textwidth
                         " r - autoinsert comment leader on i_<enter>
                         " q - allow formatting of comments with gq
                         " l - long lines aren't broken
                         " j - remove comment leader when joining lines
set noea                 " prevent equalizing of split sizes on closed split
set fillchars=fold:\ ,vert:\  " fill characters for fold lines and lines between vsplits
set ttimeoutlen=50      " Faster twitchin' for everything
set tildeop             " Tilde acts as an operator (no need to g~ to switch case with motions)

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"
" }}} Basic settings "

" Completion ignores {{{ "
" KEEP THESE IN SYNC WITH UNITE IGNORES!
" Never put .git in here!

set wildignore+=*/.hg/*,*/.svn/*,*.pyc,*.class
set wildignore+=.ropeproject/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=obj/**

" Ignore output and VCS files: Note: do not ignore .git! It breaks fugitive's :Gdiff
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,.svn,*.gem

" Ignore archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore image files
set wildignore+=*.jpg,*.jpeg,*.bmp,*.png,*.gif

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Ignore node modules
set wildignore+=node_modules/*

" Ignore tag files
set wildignore+=tags,*.taghl

" Ignore temp and backup files
set wildignore+=*.swp,*~,._*

" Ignore thirdparty assets
set wildignore+=*/thirdparty/*

" Ignore Debug and Release folders
set wildignore+=*/Debug/*,*/Release/*
" }}} Completion ignores "

" Filetype specific settings {{{ "
if has("autocmd")
    augroup MyFtCommands
    " Clear autocmds for this group
    autocmd!
    au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
    au FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
    au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent shiftwidth=2 softtabstop=2 expandtab
    au BufWritePost,FileWritePost *.coffee silent make!
    au FileType c setlocal colorcolumn=79
    au FileType cpp setlocal list
    au FileType gitcommit setlocal nolist
    au FileType {make,gitconfig} set noexpandtab sw=4
    au QuickFixCmdPost * nested cwindow | redraw!
    au FileType vim setlocal foldmethod=marker

    " Autocommands for fswitch.vim
    au BufEnter *.cpp let b:fswitchdst = 'h'
    au BufEnter *.cpp let b:fswitchlocs = 'reg:/src/include/,reg:/src.*/include/,reg:|src|include/**|,../include'
    au BufEnter *.h let b:fswitchdst = 'cpp,c'
    au BufEnter *.h let b:fswitchlocs = 'reg:|include|src/**|,reg:|include.*|src/**|,../src'
    augroup end

endif
" }}} Filetype specific settings "

" Extra syntax groups and keywords {{{ "
function! MyCppadd()
  syn keyword cMyItem contained TODO FIXME CLEAN PERF
  syn cluster cCommentGroup add=cMyItem
  hi link cMyItem Todo
endfun
if has("autocmd")
augroup SyntaxKeywordGroup
    " Clear autocmds for this group
    autocmd!

    au Syntax cpp call MyCppadd()
augroup end
endif
" }}} Extra syntax groups and keywords "

" Backup settings {{{ "
if !has("win32") && !has("win64")
    set backup

    set undodir=/var/tmp/vi.recover.$USER/undo//     " undo files
    set backupdir=/var/tmp/vi.recover.$USER/backup// " backups
    set directory=/var/tmp/vi.recover.$USER/swap//   " swap files

    " Make those folders automatically if they don't already exist.
    if !isdirectory(expand(&undodir))
        call mkdir(expand(&undodir), "p", 0700)
    endif
    if !isdirectory(expand(&backupdir))
        call mkdir(expand(&backupdir), "p", 0700)
    endif
    if !isdirectory(expand(&directory))
        call mkdir(expand(&directory), "p", 0700)
    endif
end
" }}} Backup settings "

" Statusline settings {{{ "
set laststatus=2	" always show status line

" Returns current file encoding.
" Currently used for status line.
function! FileEncoding()
    if &fileencoding == ''
        return "NONE"
    else
        return &fenc
    endif
endfunction

set statusline=%<%F\ %m%r%h%w%{fugitive#statusline()}\ %Y\ %{FileEncoding()}\ %{&ff}%=%#warningmsg#%{SyntasticStatuslineFlag()}%*\ %c\,\ %l/%L\ %p%%\ 
" <	truncation point
" F	full path to file
" m	modified marker
" r	read-only flag
" h	help buffer flag
" w	preview window flag
" {fug..Shows branch if file is in git repo
" Y	file type
" {&ff}	output of command ff (file format)
" {FileEncoding} function defined above
" =	split point for left/rigth justification
" #warningmsg#     switch to WarningMsg color
" {SyntasticStatuslineFlag()} syntax error stuff from syntastic
" *	switch back to normal color
" c	column number
" l	line number
" L	total line numbers
" p	percentage through file (in lines as CTRL-G

" change status line colour if it is in insert mode
if version >= 700
    if has("autocmd")
    augroup StatuslineColorGroup
        " Clear autocmds for this group
        autocmd!
    
        au InsertEnter * hi StatusLine gui=NONE guifg=#FFFFFF guibg=#9D3569
        au InsertLeave * hi StatusLine gui=NONE guifg=#d6d6d6 guibg=#602040
    augroup end
    endif
endif
" }}} Statusline settings "

" Session information for :mksession {{{ "
set viminfo='1000,f1,<1000,:500,@500,/500,!
" '		Max number of previously edited files for which marks are
" 		remembered
" f		remember marks
" <		max number of lines saved per register
" :		max items in commandline history
" @		max items in input-line history to be saved
" /		max items in search pattern history
set ssop=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize
" 		Enables saving and restoring
" blank		empty windows
" buffers	hidden and unloaded buffers
" curdir	remember the cwd
" folds		manually created folds, opened/closed folds and local fold opt
" help		the help window
" options	all options and mappings (also global vals for local opts)
" tabpages	all tab pages instead of only the current one
" winsize	window sizes (the windows inside vim)
" resize		size of the vim window, lines and columns
" }}} Session information for :mksession "

" Plugin settings {{{ "

" Fugitive {{{ "
" https://github.com/tpope/vim-fugitive
" Maps .. to go up one level from fugitive blob and tree views
if has("autocmd")
augroup FugitiveGroup
    " Clear autocmds for this group
    autocmd!

    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

    " Automatically delete hidden fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup end
endif

nnoremap <silent> <leader>.. :edit %:h<CR>

" }}} Fugitive "

" vim-space {{{ "
"" http://github.com/jfelchner/vim-space
""
let g:space_no_buffers = 1
let g:space_no_tabs = 1
" }}} vim-space "

" Gist {{{ "
"" https://github.com/mattn/gist-vim
""
let g:gist_clip_command = 'xsel --clipboard -i'
let g:gist_detect_filetype = 1
" }}} Gist "

" Unite {{{ "
" Fuzzy match by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Fuzzy matching for plugins not using matcher_default as filter
call unite#custom#source('outline,line,grep,session', 'matchers', ['matcher_fuzzy'])

" Ignore some things
" KEEP THESE IN SYNC WITH WILDIGNORE!
" Need to escape dots in the patterns!
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.swp', '\.swo', '\~$',
            \ '\.git/', '\.svn/', '\.hg/',
            \ '^tags$', '\.taghl$',
            \ '\.ropeproject/',
            \ 'node_modules/', 'log/', 'tmp/', 'obj/',
            \ '/vendor/gems/', '/vendor/cache/', '\.bundle/', '\.sass-cache/',
            \ '/tmp/cache/assets/.*/sprockets/', '/tmp/cache/assets/.*/sass/',
            \ 'thirdparty/', 'Debug/', 'Release/',
            \ '\.pyc$', '\.class$', '\.jar$',
            \ '\.jpg$', '\.jpeg$', '\.bmp$', '\.png$', '\.gif$',
            \ '\.o$', '\.out$', '\.obj$', '\.rbc$', '\.rbo$', '\.gem$',
            \ '\.zip$', '\.tar\.gz$', '\.tar\.bz2$', '\.rar$', '\.tar\.xz$'
            \ ], '\|'))

let g:unite_source_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'max_candidates', 0)

" Keep track of yanks
let g:unite_source_history_yank_enable = 1
" Prettier prompt
call unite#custom#profile('default', 'context', {
    \   'prompt': '» ',
    \   'start_insert': 1,
    \   'update_time': 200,
    \   'cursor_line_highlight': 'UniteSelectedLine',
    \   'direction': 'botright',
    \   'prompt_direction': 'top',
    \ })
" Autosave sessions for unite-sessions
let g:unite_source_session_enable_auto_save = 1
" Non-ugly colors for selected item, requires you to set 'hi UnitedSelectedLine'
let g:unite_cursor_line_highlight = "UniteSelectedLine"
" Set to some better time formats
let g:unite_source_buffer_time_format = "%Y-%m-%d  %H:%M:%S  "
let g:unite_source_file_mru_time_format = "%Y-%m-%d  %H:%M:%S  "

" Use ag or ack as grep command if possible
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-case --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
              \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

function! g:DoUniteFuzzy()
    call unite#custom#source('file_rec/async,file/new', 'sorters', 'sorter_rank')
    call unite#custom#source('file_rec/async,file/new', 'converters', 'converter_relative_word')
    call unite#custom#source('file_rec/async,file/new', 'matchers', 'matcher_fuzzy')
    exec "Unite -buffer-name=files file_rec/async file/new"
endfunction
function! g:DoUniteNonFuzzy()
    call unite#custom#source('file_rec/async,file/new', 'sorters', 'sorter_nothing')
    call unite#custom#source('file_rec/async,file/new', 'converters', 'converter_relative_word')
    call unite#custom#source('file_rec/async,file/new', 'matchers', 'matcher_glob')
    exec "Unite -buffer-name=files file_rec/async file/new"
endfunction
function! g:DoUniteFuzzyQuickfix()
    call unite#custom#source('quickfix', 'sorters', 'sorter_rank')
    call unite#custom#source('quickfix', 'matchers', 'matcher_fuzzy')
    exec "Unite -buffer-name=quickfix quickfix"
endfunction
function! g:DoUniteNonFuzzyQuickfix()
    call unite#custom#source('quickfix', 'sorters', 'sorter_nothing')
    call unite#custom#source('quickfix', 'matchers', 'matcher_glob')
    exec "Unite -buffer-name=quickfix quickfix"
endfunction
function! UltiSnipsCallUnite()
    Unite -immediately -no-empty -vertical -buffer-name=ultisnips ultisnips
    return ''
endfunction

" Bindings
inoremap <silent><leader>l<tab> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent><leader>l<tab> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent><leader>lr :call g:DoUniteFuzzy()<CR>
nnoremap <silent><leader>lR :call g:DoUniteNonFuzzy()<CR>
nnoremap <silent><leader>lq :call g:DoUniteFuzzyQuickfix()<CR>
nnoremap <silent><leader>lQ :call g:DoUniteNonFuzzyQuickfix()<CR>
nnoremap <silent><leader>le :<C-u>Unite -buffer-name=files file_mru bookmark<CR>
nnoremap <silent><leader>lE :<C-u>Unite -buffer-name=files file_mru bookmark file_rec/async file/new<CR>
nnoremap <silent><leader>lB :<C-u>Unite -buffer-name=buffers buffer<CR>
nnoremap <silent><leader>lb :<C-u>Unite -buffer-name=buffers buffer_tab<CR>
nnoremap <silent><leader>ly :<C-u>Unite -buffer-name=yanks history/yank<CR>
nnoremap <silent><leader>lc :<C-u>Unite -buffer-name=changes change<CR>
nnoremap <silent><leader>lj :<C-u>Unite -buffer-name=jumps jump<CR>
nnoremap <silent><leader>lf :<C-u>Unite -buffer-name=jumps jump<CR>
nnoremap <silent><leader>l; :<C-u>Unite -buffer-name=commands history/command<CR>
nnoremap <silent><leader>l/ :<C-u>Unite -buffer-name=commands history/search<CR>
nnoremap <silent><leader>lo :<C-u>Unite -buffer-name=outline outline<CR>
nnoremap <silent><leader>la :<C-u>Unite -buffer-name=outline -vertical outline<CR>
nnoremap <silent><leader>ll :<C-u>Unite -buffer-name=line line<CR>
nnoremap <silent><leader>lw :<C-u>Unite -buffer-name=location_list location_list<CR>
nnoremap <silent><leader>l* :<C-u>UniteWithCursorWord -buffer-name=line line<CR>
nnoremap <silent><leader>lg :<C-u>Unite -buffer-name=grep grep<CR>
nnoremap <silent><leader>ls :<C-u>Unite session<CR>
nnoremap <silent><leader>lt :<C-u>Unite -buffer-name=tags tag tag/file<CR>
nnoremap <silent><leader>li :<C-u>Unite -buffer-name=included_tags tag/include<CR>
nnoremap <silent><leader>ld :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru directory<CR>
nnoremap <silent><leader>l, :<C-u>UniteResume<CR>
nnoremap <silent><leader>lv :<C-u>UniteResume<CR>
nnoremap <silent><leader>lV :<C-u>UniteResume 

nnoremap <leader>lS :<C-u>UniteSessionSave 

function! s:unite_my_settings()
  "Don't add parens to my filters
  let b:delimitMate_autoclose = 0

  "Keymaps inside the unite split
  nmap <buffer> <nowait> <leader>d <Plug>(unite_exit)
  nmap <buffer> <nowait> <C-c> <Plug>(unite_exit)
  imap <buffer> <nowait> <C-c> <Plug>(unite_exit)

  nnoremap <buffer> <C-n> <Plug>(unite_select_next_line)
  nnoremap <buffer> <C-p> <Plug>(unite_select_previous_line)

  inoremap <silent><buffer><expr> <C-j> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-j> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-k> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-k> unite#do_action('vsplit')
endfunction

if has("autocmd")
augroup UniteSettingsGroup
    " Clear autocmds for this group
    autocmd!

    autocmd FileType unite call s:unite_my_settings()
augroup end
endif

" }}} Unite "

" Tagbar {{{ "
nnoremap <silent> <leader>tt :TagbarToggle<cr>
nnoremap <silent> <leader>tg :TagbarOpen fj<cr>
let g:tagbar_compact = 1
let g:tagbar_width = 40
" }}} Tagbar "

" Vim-latex {{{ "
set grepprg=grep\ -nH\ $*

let g:Tex_DefaultTargetFormat = 'pdf'
let g:tex_flavor='latex'
let g:Tex_SmartKeyQuote=0
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

nnoremap <silent> <leader>,g :execute "!makeglossaries " . shellescape(expand('%:r'), 1)<CR>
" }}} Vim-latex "

" Rainbow-Parentheses-Improved-and2 {{{ "
"" Rainbow-Parentheses-Improved-and2 settings
"" http://github.com/vim-scripts/Rainbow-Parentheses-Improved-and2
"" 
" These are so ugly
"let g:rainbow_ctermfgs = [184, 39, 170, 162, 154, 9, 10, 11, 13, 14, 15]
" These are alright
"let g:rainbow_guifgs = ['#ffffff', '#000000']
    "\   'guifgs': ['#8E8EBE', '#8E8E8E', '#BE8EBE', '#BEBE8E', '#8EBE8E', '#BE8E8E'],
let g:rainbow_conf = {
    \   'guifgs': ['#A77990', '#8DC4C4', '#C6ACC6', '#ADBCA0', '#A2B1C1', '#C6A0B3', '#98A7B7', '#7B907C', '#B7AB9B', '#96C1AC', '#79A9A9', '#96838D', '#C6A890'],
    \   'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan'],
    \   'operators': '_,_',
    \   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
    \   'separately': {
    \       '*': {},
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \           'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
    \       },
    \       'vim': {
    \           'parentheses': [['fu\w* \s*.*)','endfu\w*'], ['for','endfor'], ['while', 'endwhile'], ['if','_elseif\|else_','endif'], ['(',')'], ['\[','\]'], ['{','}']],
    \       },
    \       'tex': {
    \           'parentheses': [['(',')'], ['\[','\]'], ['\\begin{.*}','\\end{.*}']],
    \       },
    \       'css': 0,
    \       'xml': {
    \           'parentheses': [['\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>','</\z1>']],
    \       },
    \       'xhtml': {
    \           'parentheses': [['\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>','</\z1>']],
    \       },
    \       'djangohtml': {
    \           'guifgs': [],
    \           'ctermfgs': [],
    \           'parantheses': [],
    \           'operators': []},
    \       'html': {
    \           'parentheses': [['\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>','</\z1>']],
    \       },
    \   }
    \}
let g:rainbow_active = 1
let g:rainbow_operators = 1
" }}} Rainbow-Parentheses-Improved-and2 "

" vim-togglelist {{{ "
" https://github.com/xaimus/vim-togglelist
nnoremap <silent> <leader>A :Ltoggle<cr>
nnoremap <silent> <leader>q :Ctoggle<cr>
" }}} vim-togglelist "

" Neocomplete {{{ "
" http://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" To complete in python with jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python =
            \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" To complete in c++ with clang_complete
let g:neocomplete#force_omni_input_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.objc =
            \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" }}} Neocomplete "

" jedi-vim {{{ "
" play nice with neocomplcache
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0

let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command    = "K"
let g:jedi#usages_command           = "<leader>ju"
let g:jedi#completions_command      = "<leader>jc"
let g:jedi#rename_command           = "<leader>jr"
let g:jedi#show_call_signatures     = "1"

if has("autocmd")
augroup JediGroup
    " Clear autocmds for this group
    autocmd!

    autocmd FileType python setlocal omnifunc=jedi#complete
    autocmd FileType python let b:did_ftplugin = 1
augroup end
endif
" }}} jedi-vim "

" vim-sparkup {{{ "
let g:sparkupExecuteMapping = '<leader>v'
let g:sparkupNextMapping = '<leader>b'
" }}} vim-sparkup "

" Misc {{{ "
let g:gist_detect_filetype = 1

let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = '<c-cr>'
let g:UltiSnipsJumpForwardTrigger = '<c-cr>'
let g:UltiSnipsJumpBackwardTrigger = '<s-cr>'
let g:UltiSnipsUsePythonVersion = 2
nmap <c-cr> i<c-cr>

let g:maximizer_set_default_mapping = 0

let g:fontzoom_no_default_key_mappings = 1

if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['TagFileName'] = '.git/tags'

let g:undotree_SetFocusWhenToggle = 1
" }}} Misc "

" niji {{{ "
"let g:niji_matching_filetypes = ['lisp', 'ruby', 'python', 'c', 'cpp', 'bash']
"let g:niji_dark_colours = [184, 39, 170, 162, 154, 9, 10, 11, 13, 14, 15]

" let g:niji_dark_colours = [['184', '39'], ['170', '162'], ['154', '9'], ['10', '11'], ['13', '14']]

" hi Rbow1 guifg=#ff0000 ctermfg=white
" hi Rbow2 guifg=#00ff00 ctermfg=white
" hi Rbow3 guifg=#0000ff ctermfg=white
" hi Rbow4 guifg=#ffff00 ctermfg=white

let g:niji_dark_colours = [['#111111', '#222222'],
                        \  ['#333333', '#444444'],
                        \  ['#555555', '#666666'],
                        \  ['#777777', '#888888'],
                        \  ['#999999', '#AAAAAA']]
let g:niji_light_colours = g:niji_dark_colours
" }}} niji "

" Syntastic {{{ "
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_warning_symbol = '⚠⚠'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 6
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_coffee_coffeelint_args = '-f ~/.config/coffeelint.json'
let g:syntastic_c_config_file = '.clang_complete'
let g:syntastic_cpp_config_file = '.clang_complete'
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_mode_map = { "mode": "active",
            \ "active_filetypes": ["coffee", "javascript", "python"],
            \ "passive_filetypes": ["cpp"] }
" }}} Syntastic "

" clang_complete {{{ "
" let g:clang_complete_loaded = 1 " Don't load clang_complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_snippets_engine = 'ultisnips'
let g:clang_snippets = 1
let g:clang_use_library = 1
let g:clang_complete_macros = 1
"let g:clang_user_options = '|| exit 0'
" }}} clang_complete "

" vim-indent-guides {{{ "
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
" }}} vim-indent-guides "

" haskellmode-vim {{{ "
let g:haddock_browser = "/usr/bin/google-chrome"
let g:ghc = "/usr/bin/ghc"
" }}} haskellmode-vim "

" switch.vim {{{ "
" These switches apply to all filetypes
let g:switch_custom_definitions = 
    \ [
    \   ['&&', '||'],
    \   {
    \     '\CTrue':  'False',
    \     '\CFalse': 'True',
    \   },
    \   {
    \     '\Ctrue':  'false',
    \     '\Cfalse': 'true',
    \   },
    \   ['width', 'height'],
    \ ]
if has("autocmd")
augroup SwitchVimFtGroups
    " Clear autocmds for this group
    autocmd!

    autocmd FileType cpp let b:switch_custom_definitions =
        \ [
        \   g:switch_builtins.cpp_pointer,
        \
        \   {
        \     ' & ': ' * ',
        \     ' \* ': ' & '
        \   },
        \
        \   g:switch_builtins.rspec_should,
        \ ]
augroup end
endif
" }}} switch.vim "

" }}} Plugin settings "

" VisualSearch {{{ "
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" }}} VisualSearch "

" Highlight Word {{{ "
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.
"
" From Steve Losh @ https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc

function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" Create highlight definitions such as:
" hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
" hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
" }}} Highlight Word "

" Uppercase word mapping {{{ "
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <c-b> <esc>mzgUiw`za
" }}} Uppercase word mapping "

" Build scripts {{{ "

function! g:BuildOden(config, doclean)
    " From Syntastic, to be used with clang
    " -fshow-column
    " -fshow-source-location
    " -fno-caret-diagnostics
    " -fno-color-diagnostics
    " -fdiagnostics-format=clang
    let errorformat =
            \ '%E%f:%l:%c: fatal error: %m,' .
            \ '%E%f:%l:%c: error: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
            \ '%E%m'
    exec "make -C " . a:config . "/ -j4 " . a:doclean
endfunction
nnoremap <silent> <leader>oo :call g:BuildOden("Debug", "")<cr>
nnoremap <silent> <leader>oc :call g:BuildOden("Debug", "clean")<cr>
nnoremap <silent> <leader>oq :!qoden<cr>
nnoremap <silent> <leader>oO :call g:BuildOden("Release", "")<cr>
nnoremap <silent> <leader>oC :call g:BuildOden("Release", "clean")<cr>

" }}} Build scripts "

" Keymaps {{{ "

" Toggle colorcolumn TODO make this save previous value
" instead of using 79 all the time.
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=79
  endif
endfunction
nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<cr>

" Pull word under cursor into LHS of a substitute
nnoremap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>##gc<left><left><left>
nnoremap <leader>Z :bufdo %s#\<<c-r>=expand("<cword>")<cr>\>##gce<space><bar><space>update<left><left><left><left><left><left><left><left><left><left><left><left><left>

" move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" move between tabs
nnoremap <silent> <C-PageDown> :tabnext<CR>
nnoremap <silent> <C-PageUp> :tabprevious<CR>
nnoremap <silent> <C-A> :tabprevious<CR>
nnoremap <silent> <C-S> :tabnext<CR>
nnoremap <silent> <C-Z> :tabnew<CR>

" windowing
nnoremap <silent> z<cr> :call windowing#minimize_vertically()<cr>
nnoremap <silent> co4 :<c-u>vertical resize 84<cr>
nnoremap <silent> zh mzggzfip`z

" change buffers with ctrl-n and ctrl-p
nnoremap <silent> <C-p> :BufSurfBack<cr>
nnoremap <silent> <C-n> :BufSurfForward<cr>

" Use up and down keys to scroll up and down
nnoremap <Up> 3<C-y>
nnoremap <Down> 3<C-e>
nnoremap <Left> 10zh
nnoremap <Right> 10zl

" Mark current word (as with * but without movement)
" Switch HL / ^$ for faster movement
noremap H ^
noremap L $
noremap ^ H
noremap $ L

" Switch ` and '
noremap ` '
noremap ' `

nnoremap <silent> <leader>8 :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Bash-like keys for the command line
cnoremap <C-A>	<Home>
cnoremap <C-E>	<End>
cnoremap <C-K>	<C-U>
cnoremap <C-P>	<Up>
cnoremap <C-N>	<Down>

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Indent the entire file
nnoremap <leader>= gg=G`'

" Sort in paragraph
nnoremap <leader>ms Vip:sort<cr>

" Tabularize things
nnoremap <leader>mt= :Tabularize /=/<cr>
nnoremap <leader>mt/ :Tabularize /\/\//<cr>
nnoremap <leader>mt, :Tabularize /, /r0<cr>

" Break up paramater list with newlines
nnoremap <silent> <leader>mp mz:s/(/(\r/<cr>:s/, /,\r/g<cr>jmx`zj=`x:noh<cr>

" Edit register
function! EditRegister()
    call inputsave()
    let l:reg = input("Enter a register: ")
    call inputrestore()
    return "let @".l:reg." = ".string(getreg(l:reg))
endfunction

nnoremap <leader>eq :<C-U><C-R>=EditRegister()<CR><C-E><C-F><Left>

" Move cpp // comment at end of line to line above
nnoremap <leader>cu $F/hhr<cr>kddpk$

" Drag current line(s) up/down
noremap <leader>j :m+<CR>
noremap <leader>k :m-2<CR>
inoremap <leader>j <Esc>:m+<CR>
inoremap <leader>k <Esc>:m-2<CR>
vnoremap <leader>j :m'>+<CR>gv
vnoremap <leader>k :m-2<CR>gv

" Ctrl-h for next line + <backspace>
" Ctrl-o for next line
" ;a for <esc>
inoremap <c-h> <esc>o<BS>
inoremap <c-o> <esc>o
inoremap <c-space> <esc>A;<esc>
noremap <c-space> A;<esc>
noremap ;a <esc>
inoremap ;a <esc>

"Like D for yanking
noremap Y y$

" Copy/Paste with os buffer
noremap <leader>y "+y
noremap <leader>Y "+y$
nmap <leader>p "+p
nmap <leader>P "+P

" Copy current file path into os buffer
nnoremap <silent> <leader>fy :Ypwd<cr>

" Save, quit, etc
nnoremap <silent> <leader>s :<C-U>w<cr>
nnoremap <silent> <leader>S :<C-U>w<cr>
nnoremap <silent> <leader>x :<C-U>wq<cr>
nnoremap <silent> <leader>X :<C-U>wqa<cr>
nnoremap <silent> <leader>d :<C-U>q<cr>
nnoremap <silent> <leader>D :<C-U>qa<cr>
nnoremap <silent> <leader>h :<C-U>FSHere<cr>
nnoremap <silent> <leader>hh :<C-U>FSHere<cr>
nnoremap <silent> <leader>hu :<C-U>FSSplitAbove<cr>
nnoremap <silent> <leader>hb :<C-U>FSSplitBelow<cr>
nnoremap <silent> <leader>hl :<C-U>FSSplitLeft<cr>
nnoremap <silent> <leader>hr :<C-U>FSSplitRight<cr>
" Maximize buffer toggling
nnoremap <silent> <leader><tab> :<C-U>MaximizerToggle<cr>
vnoremap <silent> <leader><tab> :<C-U>MaximizerToggle<cr>gv
inoremap <silent> <leader><tab> <c-o>:MaximizerToggle<cr>
" w!! -> write even if you forgot sudo
cmap w!! w !sudo tee >/dev/null %

" Disable Ex mode
map Q <Nop>

" Mappings to interact with fugitive
nnoremap <silent> <leader>gs :<C-U>Gstatus<cr>
nnoremap <silent> <leader>gd :<C-U>Gvdiff<cr>
nnoremap <silent> <leader>gb :<C-U>Gblame<cr>
nnoremap <silent> <leader>gw :<C-U>Gwrite<cr>
nnoremap <silent> <leader>gW :<C-U>Gwrite!<cr>
nnoremap <silent> <leader>gh :<C-U>Gpush<cr>
nnoremap <silent> <leader>gH :<C-U>Gpull<cr>
nnoremap <silent> <leader>gp :<C-U>Git push 
nnoremap <leader>gm :<C-U>Gmove %:h
nnoremap <leader>gl :<C-U>Glog 
nnoremap <leader>gg :<C-U>Ggrep 
nnoremap <leader>gc :<C-U>Gcommit -m '
nnoremap <leader>gA :<C-U>Git checkout -- %

" Mappings for interacting with diff merges
nnoremap <silent> dgh :diffget \\2<cr>
nnoremap <silent> dgl :diffget \\3<cr>

" Misc mappings
nnoremap <leader>i i <esc>la <esc>h
nnoremap <silent> <leader><space> :noh<cr>
nnoremap <silent> <leader>ee :UltiSnipsEdit<cr>
nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <leader>a :sign unplace *<cr>:Lclose<cr>
nnoremap <silent> - mz:<c-u>:Switch<cr><esc>`z

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Accidentally pressing F1 is to press ESC
map <F1> <esc>
imap <F1> <esc>
cmap <F1> <esc>
xmap <F1> <esc>
smap <F1> <esc>
lmap <F1> <esc>

" Spell checking mappings {{{ "
" Pressing <leader>ff will toggle and untoggle spell checking,
" fe sets checking to english and fs sets checking to swedish.
nnoremap <silent> <leader>ff :setlocal spell!<cr>
nnoremap <silent> <leader>fs :setlocal spelllang=sv<cr>
nnoremap <silent> <leader>fe :setlocal spelllang=en<cr>

"go to next error
nnoremap <leader>fn ]s
"go to previous error
nnoremap <leader>fp [s
"add to spellfile
nnoremap <leader>fa zg
"suggest correct words
nnoremap <leader>f? z=
" }}} Spell checking mappings "
" }}} Keymaps "

" Machine specific settings loading {{{ "
" Load local .vimrc for machine-specific options
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
" }}} Machine specific settings loading "
