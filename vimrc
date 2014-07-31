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

" Automatic commands
if has("autocmd")
    augroup MyAutoCmd

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
endif

" :Configure to edit this file in a split window
command! Configure edit $MYVIMRC
command! SConfigure split $MYVIMRC
command! VConfigure vsplit $MYVIMRC

" :Cdpwd to set current window's pwd to the edited file's directory
command! Cdpwd lcd %:p:h

" :Q to quit
command! Q q
command! Qall qall


"""""""""""""""""""""""""""""""""
"" Basic settings
""

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

" Completion ignores
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

"""""""""""""""""""""""""""""""""""""""""""""
"" Settings for specific filetypes
""

if has("autocmd")
    au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
    au FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
    au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent shiftwidth=2 softtabstop=2 expandtab
    au BufWritePost,FileWritePost *.coffee silent make!
    au FileType c setlocal colorcolumn=79
    au FileType cpp setlocal list
    au FileType gitcommit setlocal nolist
    au FileType {make,gitconfig} set noexpandtab sw=4
    au QuickFixCmdPost * nested cwindow | redraw!
endif



"""""""""""""""""""""""""""""""""""""""""""""
"" Status line stuff
""

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
  au InsertEnter * hi StatusLine gui=NONE guifg=#FFFFFF guibg=#9D3569
  au InsertLeave * hi StatusLine gui=NONE guifg=#d6d6d6 guibg=#602040
endif

"""""""""""""""""""""""""""""""""""""""""""""
"" Session information, what to remember. Used with :mksession to save
"" and restore sessions as if you never quit vim. I used this before the
"" times of never shutting down my PC. Still useful at work and on laptops.

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Recovery, recover a file then write :DiffOrig to see
"" a vimdiff between the recovery and the original.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Spell checking
""

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


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Fugitive settings and bindings
"" https://github.com/tpope/vim-fugitive
""

" Maps .. to go up one level from fugitive blob and tree views
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

nnoremap <silent> <leader>.. :edit %:h<CR>

" Automatically delete hidden fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete


""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-space configuration
"" http://github.com/jfelchner/vim-space
""
let g:space_no_buffers = 1
let g:space_no_tabs = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
"" Gist configuration
"" https://github.com/mattn/gist-vim
""
let g:gist_clip_command = 'xsel --clipboard -i'
let g:gist_detect_filetype = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
"" Unite configuration
""

" Fuzzy match by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Fuzzy matching for plugins not using matcher_default as filter
call unite#custom#source('outline,line,grep,session', 'filters', ['matcher_fuzzy'])

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

" Situate on bottom or right by default
let g:unite_split_rule = "botright"
" Keep track of yanks
let g:unite_source_history_yank_enable = 1
" Prettier prompt
let g:unite_prompt = '» '
" Faster update time after keypresses
let g:unite_update_time = 200
" Always start in insert mode
let g:unite_enable_start_insert = 1
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

" Bindings
nnoremap <silent><leader>l<tab> :<C-u>Unite -buffer-name=ultisnips -vertical ultisnips<CR>
nnoremap <silent><leader>lr :call g:DoUniteFuzzy()<CR>
nnoremap <silent><leader>lR :call g:DoUniteNonFuzzy()<CR>
nnoremap <silent><leader>le :<C-u>Unite -buffer-name=files file_mru bookmark<CR>
nnoremap <silent><leader>lE :<C-u>Unite -buffer-name=files file_mru bookmark file_rec/async file/new<CR>
nnoremap <silent><leader>lb :<C-u>Unite -buffer-name=buffers buffer<CR>
nnoremap <silent><leader>ly :<C-u>Unite -buffer-name=yanks history/yank<CR>
nnoremap <silent><leader>lc :<C-u>Unite -buffer-name=changes change<CR>
nnoremap <silent><leader>lj :<C-u>Unite -buffer-name=jumps jump<CR>
nnoremap <silent><leader>lf :<C-u>Unite -buffer-name=jumps jump<CR>
nnoremap <silent><leader>l; :<C-u>Unite -buffer-name=commands history/command<CR>
nnoremap <silent><leader>l/ :<C-u>Unite -buffer-name=commands history/search<CR>
nnoremap <silent><leader>lo :<C-u>Unite -buffer-name=outline outline<CR>
nnoremap <silent><leader>la :<C-u>Unite -buffer-name=outline -vertical outline<CR>
nnoremap <silent><leader>ll :<C-u>Unite -buffer-name=line line<CR>
nnoremap <silent><leader>lq :<C-u>Unite -buffer-name=quickfix quickfix<CR>
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

autocmd FileType unite call s:unite_my_settings()
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

""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tagbar configuration
""
nnoremap <silent> <leader>tt :TagbarToggle<cr>
nnoremap <silent> <leader>tg :TagbarOpen fj<cr>
let g:tagbar_compact = 1
let g:tagbar_width = 40

""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim-latex bindings
"" vim-latex.org
""

set grepprg=grep\ -nH\ $*

let g:Tex_DefaultTargetFormat = 'pdf'
let g:tex_flavor='latex'
let g:Tex_SmartKeyQuote=0
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

nnoremap <silent> <leader>,g :execute "!makeglossaries " . shellescape(expand('%:r'), 1)<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""
"" togglelist settings
"" https://github.com/xaimus/vim-togglelist
"" 
nnoremap <silent> <leader>A :Ltoggle<cr>
nnoremap <silent> <leader>q :Ctoggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""
"" neocomplete.vim completion
"" http://github.com/Shougo/neocomplete.vim
"" 
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

""""""""""""""""""""""""""""""""""""""""""""""""""
"" neocomplcache completion
"" http://github.com/Shougo/neocomplcache
"" 
" if !exists('g:neocomplcache_omni_functions')
"     let g:neocomplcache_omni_functions = {}
" endif
" if !exists('g:neocomplcache_force_omni_patterns')
"     let g:neocomplcache_force_omni_patterns = {}
" endif

"let g:neocomplcache_force_overwrite_completefunc = 1

" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_fuzzy_completion = 1

" inoremap <expr><C-g> neocomplcache#undo_completion()
" inoremap <expr><C-l> neocomplcache#complete_common_string()

" To complete in python with jedi-vim
" let g:neocomplcache_force_omni_patterns['python'] = '[^. t].w*'
" let g:neocomplcache_omni_functions['python'] = 'jedi#completions'

" To complete in c++ with clang_complete
" let g:neocomplcache_force_omni_patterns.c =
"             \ '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplcache_force_omni_patterns.cpp =
"             \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplcache_force_omni_patterns.objc =
"             \ '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplcache_force_omni_patterns.objcpp =
"             \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Fix <cr> behaviour
" function! s:my_cr_function()
"   return neocomplcache#smart_close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" endfunction
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
"" jedi-vim
"" 
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

autocmd FileType python setlocal omnifunc=jedi#complete
autocmd FileType python let b:did_ftplugin = 1


""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-sparkup settings
"" 
let g:sparkupExecuteMapping = '<leader>v'
let g:sparkupNextMapping = '<leader>b'


""""""""""""""""""""""""""""""""""""""""""""""""""
"" python-mode, ropevim settings
"" 
" let g:pymode_rope_extended_autocomplete=1
" let g:pymode_rope_autoimport_modules = ["os", "django.*"]
" let g:pymode_lint = 0


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings for misc plugins
"" 
let g:gist_detect_filetype = 1

let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = '<c-cr>'
let g:UltiSnipsJumpForwardTrigger = '<c-cr>'
let g:UltiSnipsJumpBackwardTrigger = '<s-cr>'
let g:UltiSnipsUsePythonVersion = 2

let g:maximizer_set_default_mapping = 0

let g:fontzoom_no_default_key_mappings = 1

if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['TagFileName'] = '.git/tags'

let g:undotree_SetFocusWhenToggle = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings for niji
"" 
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


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings for syntastic
"" 
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


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings for clang_complete
"" 

let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_use_library = 1
let g:clang_complete_macros = 1
"let g:clang_user_options = '|| exit 0'


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings for vim-indent-guides
"" 
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings for haskellmode-vim
"" 
let g:haddock_browser = "/usr/bin/google-chrome"
let g:ghc = "/usr/bin/ghc"


""""""""""""""""""""""""""""""""""""""""""""""""""
"" In visual mode you press * or # to search for the current selection
"" 

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


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Opens a preview window which looks at the ctags definition
"" of whichever word your cursor is currently over. Sweet
"" 

"    :func! PreviewWord()
"    :  if &previewwindow			" don't do this in the preview window
"    :    return
"    :  endif
"    :  let w = expand("<cword>")		" get the word under cursor
"    :  if w =~ '\a'			" if the word contains a letter
"    :
"    :    " Delete any existing highlight before showing another tag
"    :    silent! wincmd P			" jump to preview window
"    :    if &previewwindow			" if we really get there...
"    :      match none			" delete existing highlight
"    :      wincmd p			" back to old window
"    :    endif
"    :
"    :    " Try displaying a matching tag for the word under the cursor
"    :    try
"    :       exe "ptag " . w
"    :    catch
"    :      return
"    :    endtry
"    :
"    :    silent! wincmd P			" jump to preview window
"    :    if &previewwindow		" if we really get there...
"    :	 if has("folding")
"    :	   silent! .foldopen		" don't want a closed fold
"    :	 endif
"    :	 call search("$", "b")		" to end of previous line
"    :	 let w = substitute(w, '\\', '\\\\', "")
"    :	 call search('\<\V' . w . '\>')	" position cursor on match
"    :	 " Add a match highlight to the word at this position
"    :      hi previewWord term=bold ctermbg=green guibg=green
"    :	 exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
"    :      wincmd p			" back to old window
"    :    endif
"    :  endif
"    :endfun
"


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Keymaps
""

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

" make window 40 chars wide, useful for CSS files
nnoremap <silent> <leader>4 :vertical resize 40<cr>

" windowing
nnoremap <silent> z<cr> :call windowing#minimize_vertically()<cr>

" change buffers with ctrl-n and ctrl-p
nnoremap <silent> <C-p> :BufSurfBack<cr>
nnoremap <silent> <C-n> :BufSurfForward<cr>

" Shows the ctags definition of keyword under
" the cursor in a preview window
"map <C-[> :call PreviewWord()<cr>
" Closes the preview window
"map <leader>[ <C-W>z

" Use up and down keys to scroll up and down
nmap <Up> 3<C-y>
nmap <Down> 3<C-e>
nmap <Left> 10zh
nmap <Right> 10zl

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
map Y y$

" Copy/Paste with os buffer
map <leader>y "+y
map <leader>Y "+y$
nmap <leader>p "+p
nmap <leader>P "+P

" Copy current file path into os buffer
command! Ypwd let @+ = expand("%:p")
nnoremap <silent> <leader>fy :Ypwd<cr>

" Save, quit, etc
nnoremap <silent> <leader>s :w<cr>
nnoremap <silent> <leader>S :w<cr>
nnoremap <silent> <leader>x :wq<cr>
nnoremap <silent> <leader>X :wqa<cr>
nnoremap <silent> <leader>d :q<cr>
nnoremap <silent> <leader>D :qa<cr>
nnoremap <silent> <leader>h :FSHere<cr>
nnoremap <silent> <leader>hh :FSHere<cr>
nnoremap <silent> <leader>hu :FSSplitAbove<cr>
nnoremap <silent> <leader>hl :FSSplitLeft<cr>
" Maximize buffer toggling
nnoremap <silent> <leader><tab> :MaximizerToggle<cr>
vnoremap <silent> <leader><tab> :MaximizerToggle<cr>gv
inoremap <silent> <leader><tab> <c-o>:MaximizerToggle<cr>
" w!! -> write even if you forgot sudo
cmap w!! w !sudo tee >/dev/null %

" Disable Ex mode
map Q <Nop>

" Mappings to interact with fugitive
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr> 
nnoremap <silent> <leader>gb :Gblame<cr> 
nnoremap <silent> <leader>gw :Gwrite<cr> 
nnoremap <silent> <leader>gh :Git hub<cr> 
nnoremap <silent> <leader>gH :Git buh<cr> 
nnoremap <silent> <leader>gp :Git push 
nnoremap <leader>gl :Glog 
nnoremap <leader>gg :Ggrep 
nnoremap <leader>gc :Gcommit -m '
nnoremap <leader>gA :Git checkout -- %

" Misc mappings
nnoremap <leader><space> i <esc>la <esc>h
nnoremap <silent> <leader>< :noh<cr>
nnoremap <silent> <leader>e :UltiSnipsEdit<cr>
nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <leader>m :w<cr>:make<cr>
nnoremap <silent> <leader>a :sign unplace *<cr>:Lclose<cr>

" Accidentally pressing F1 is to press ESC
map <F1> <esc>
imap <F1> <esc>
cmap <F1> <esc>
xmap <F1> <esc>
smap <F1> <esc>
lmap <F1> <esc>

" Load local .vimrc for machine-specific options
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
