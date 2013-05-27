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
    " Automatically load vimrc when it is saved
    autocmd bufwritepost .vimrc source $MYVIMRC
    " Set ghc as compiler for haskell files
    autocmd BufEnter *.hs compiler ghc
    " Disable foldcolumn in diff windows
    au FilterWritePre * if &diff | setlocal fdc=0 | endif
    " Disable ugly-making things in diff window
    au FilterWritePre * if &diff | setlocal nocursorcolumn | endif
    au FilterWritePre * if &diff | setlocal nocursorline | endif
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

syntax enable		" Enables syntax highlighting with custom colors
filetype plugin indent on	" React on filetypes with plugins and syntax
set autoread		" Files changed from outside are automatically reread
set hlsearch            " Highlight search results
set mousehide           " Hide the mouse when typing text
set smarttab            " <TAB> inserts 'shiftwidth' spaces
set shiftwidth=4	" Amount of spaces for tab to insert
set autoindent          " Automatically set the indent when creating new lines.
set showcmd             " Shows current command in statusline
set ruler               " Show cursor position information in statusline
set number		" Show line numbers by default
set wrap                " Wrap text
set ttyfast             " 'Smooth' scrolling
set showmatch           " Briefly display matching brackets when inserting such.
set incsearch           " Incremental searching as soon as typing begins.
set ignorecase          " Ignores case when searching
set smartcase           " Will override ignorecase if searching w/ diff cases.
set modeline	        " Use moelines
set expandtab						" Makes <tab> insert spaces in insert mode
set wildchar=<TAB>      " Key that triggers command-line expansion.
set noerrorbells        " Disables beeping.
set hidden		" Allow switch buffer without saving
set previewheight=15	" Height of the preview window
"set winwidth=80		" Current window will be resized to this width
set switchbuf=usetab	" If switching to a buffer that is already open, go
			" to where it is already open instead of here.
set backspace=indent,eol,start whichwrap+=<,>,[,] "backspace functionality
set formatprg=par	" user par to format text with the gq command
set noea		" prevent equalizing of split sizes on closed split
set fillchars=fold:\ ,vert:\  " fill characters for fold lines and lines between vsplits

"""""""""""""""""""""""""""""""""""""""""""""
"" Settings for specific filetypes
""

au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
au FileType c setlocal colorcolumn=79


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
" #warningmsg# no idea
" {SyntasticStatuslineFlag()} syntax error stuff from syntastic
" *	no idea
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
set ssop=blank,buffers,sesdir,folds,help,options,tabpages,winsize,resize
" 		Enables saving and restoring
" blank		empty windows
" buffers	hidden and unloaded buffers
" sesdir	makes the current directory the one the session file is in
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

" Pressing ,ff will toggle and untoggle spell checking, fe sets checking
" to english and fs sets checking to swedish.
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
"" CtrlP configuration
"" http://github.com/kien/ctrlp.vim
" Remove history
" Bind up/down to c-p c-n
" Bind vert/hor splits to c-k c-j
  let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>'],
    \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
    \ 'PrtHistory(-1)':       ['<c-]>'],
    \ 'PrtHistory(1)':        ['<c-[>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>', '<c-j>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>', '<c-k>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'PrtExit()':            ['<c-c>', '<c-g>'],
    \ }
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc
" Don't muck about with pwd
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_map = '<leader>lr'
nnoremap <silent> <leader>lb :CtrlPBuffer<cr>
nnoremap <silent> <leader>lf :CtrlPFunky<cr>

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

nnoremap <silent> <leader>lg :execute "!makeglossaries " . shellescape(expand('%:r'), 1)<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Rainbow-Parentheses-Improved-and2 settings
"" http://github.com/vim-scripts/Rainbow-Parentheses-Improved-and2
"" 
let g:rainbow_ctermfgs = [184, 39, 170, 162, 154, 9, 10, 11, 13, 14, 15]
let g:rainbow_active = 1
let g:rainbow_operators = 2


""""""""""""""""""""""""""""""""""""""""""""""""""
"" togglelist settings
"" https://github.com/xaimus/vim-togglelist
"" 
nnoremap <silent> <leader>A :Ltoggle<cr>
nnoremap <silent> <leader>q :Ctoggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
"" neocomplcache completion
"" http://github.com/Shougo/neocomplcache
"" 
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_fuzzy_completion = 1
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" Fix <cr> behaviour
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
"" python-mode, ropevim settings
"" 
let g:pymode_rope_extended_autocomplete=1
let g:pymode_rope_autoimport_modules = ["os", "django.*"]
let g:pymode_lint_ignore = "W901,E501"


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings for misc plugins
"" 
let g:gist_detect_filetype = 1
let g:UltiSnipsEditSplit='horizontal'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings for syntastic
"" 
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_always_populate_loc_list = 1
" Use pythonmode's linter
let g:syntastic_mode_map = { 'mode': 'active',
			   \ 'passive_filetypes': ['python'] }

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


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Keymaps
""

" Pull word under cursor into LHS of a substitute
nnoremap <leader>z :s#\<<c-r>=expand("<cword>")<cr>\>##g<left><left>
nnoremap <leader>Z :%s#\<<c-r>=expand("<cword>")<cr>\>##gc<left><left><left>

" move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" make window 40 chars wide, useful for CSS files
nnoremap <silent> <leader>4 :vertical resize 40<cr>

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
inoremap <c-h> <esc>o<BS>
inoremap <c-o> <esc>o

"Like D for yanking
map Y y$

" Save, quit, etc
nnoremap <silent> <leader>s :w<cr>
nnoremap <silent> <leader>w :wa<cr>
nnoremap <silent> <leader>x :wq<cr>
nnoremap <silent> <leader>d :q<cr>
nnoremap <silent> <leader>c :qa<cr>
" w!! -> write even if you forgot sudo
cmap w!! w !sudo tee >/dev/null %

" Disable Ex mode
map Q <Nop>

" Mappings to interact with fugitive
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gg :Ggrep 
nnoremap <silent> <leader>gl :Glog<cr> 
nnoremap <silent> <leader>gd :Gdiff<cr> 
nnoremap <silent> <leader>gh :Git hub<cr> 
nnoremap <silent> <leader>gH :Git buh<cr> 
nnoremap <silent> <leader>gp :Git push 

" Misc mappings
nnoremap <leader><space> i <esc>la <esc>h
nnoremap <silent> <leader>< :noh<cr>
nnoremap <silent> <leader>e :UltiSnipsEdit<cr>
nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <leader>m :w<cr>:make<cr>
nnoremap <silent> <leader>a :sign unplace *<cr>:Lclose<cr>
nnoremap <leader>' /leader>
