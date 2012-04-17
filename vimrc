if has("win32") || has("win64")
   " Required by pathogen.vim for loading plugins
   call pathogen#infect()
   
   "Required by vim-latex on windows machines
   set shellslash

   "Otherwise vim will try to write temp files in sys32 folder when editing new file
   set directory=.,$TEMP
else
   call pathogen#infect('~/.vim/bundle')
   set t_Co=256
   colorscheme neon-approx
end

" Fix for my shell, otherwise some scripts break
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif

" Automatic commands
if has("autocmd")
    " Automatically load vimrc when it is saved
    autocmd bufwritepost .vimrc source $MYVIMRC
    " Adds åäöÅÄÖ to iskeyword for lisp-files
    "autocmd BufNewFile,BufRead *.lisp call CorrectISKF()
    "autocmd BufNewFile,BufRead *.cl call CorrectISKF()
    "autocmd BufNewFile,BufRead *.asd call CorrectISKF()
endif

" :Configure to edit this file in a split window
command! Configure edit $MYVIMRC
command! SConfigure split $MYVIMRC
command! VConfigure vsplit $MYVIMRC

" :Cdpwd to set current window's pwd to the edited file's directory
command! Cdpwd lcd %:p:h


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
set noexpandtab		" Makes <tab> not insert spaces in insert mode
set wildchar=<TAB>      " Key that triggers command-line expansion.
set noerrorbells        " Disables beeping.
set hidden		" Allow switch buffer without saving
set previewheight=7	" Height of the preview window
set winwidth=80		" Current window will be resized to this width
set switchbuf=usetab	" If switching to a buffer that is already open, go
			" to where it is already open instead of here.
set backspace=indent,eol,start whichwrap+=<,>,[,] "backspace functionality
set formatprg=par	" user par to format text with the gq command
"set listchars=tab:\|_,trail:.,extends:>,precedes:>,eol:~ "list mode shit



"""""""""""""""""""""""""""""""""""""""""""""
"" Status line stuff
""

set laststatus=2	" always show status line

set statusline=%<%F\ %r%h%w[%Y\ %{&ff}]%{fugitive#statusline()}%m%=[%c\,\ %l/%L\ (%p%%)]
" <	truncation point
" F	full path to file
" r	read-only flag
" h	help buffer flag
" w	preview window flag
" Y	file type
" {&ff}	output of command ff (file format)
" {fug..Shows branch if file is in git repo
" m	modified marker
" =	split point for left/rigth justification
" c	column number
" l	line number
" L	total line numbers
" p	percentage through file (in lines as CTRL-G

" change status line colour if it is in insert mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=3 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
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

" Automatically delete hidden fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete


""""""""""""""""""""""""""""""""""""""""""""""""""
"" FuzzyFinder configuration
"" vim-latex.org
""
nnoremap <silent> <leader>lf :FufFile<cr>
nnoremap <silent> <leader>lr :FufCoverageFile<cr>
nnoremap <silent> <leader>lb :FufBuffer<cr>
nnoremap <silent> <leader>lm :FufMruFile<cr>
nnoremap <silent> <leader>lq :FufQuickfix<cr>
nnoremap <silent> <leader>ll :FufLine<cr>
nnoremap <silent> <leader>lt :FufTag<cr>
nnoremap <silent> <leader>ly :FufBufferTag<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tagbar configuration
""
nnoremap <silent> <leader>tt :TagbarToggle<cr>
nnoremap <silent> <leader>tg :TagbarOpen fj<cr>
let g:tagbar_compact = 1

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
"" snipMate settings
"" 
let g:snips_author = 'Oliver Uvman'


""""""""""""""""""""""""""""""""""""""""""""""""""
"" showmarks settings
"" 
let g:showmarks_ignore_type = 'hmpqr'


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

" change buffers with ctrl-n and ctrl-p
nnoremap <silent> <C-n> :bn<cr>
nnoremap <silent> <C-p> :bp<cr>

" Shows the ctags definition of keyword under
" the cursor in a preview window
"map <C-[> :call PreviewWord()<cr>
" Closes the preview window
"map <leader>[ <C-W>z

"supposed to fix a syntax highlighting bug, haven't needed it yet
"let g:miniBufExplForceSyntaxEnable = 1

" Use up and down keys to scroll up and down
nmap <Up> 3<C-y>
nmap <Down> 3<C-e>

" Bash-like keys for the command line
cnoremap <C-A>	<Home>
cnoremap <C-E>	<End>
cnoremap <C-K>	<C-U>
cnoremap <C-P>	<Up>
cnoremap <C-N>	<Down>

"Like D for yanking
map Y y$
