" Thanks to Alexandre Gauthier <alex@underwares.org> for almost
" all of the stuff in this :)

" Remove toolbar and scrollbars from gVim,
" because, frankly, they are a waste of space.
set guioptions-=T
set guioptions-=m

" Use non-gui tabline
set guioptions-=e

" Add Vim icon to window, where it is shown depends on platform, windowing
" system, X11 server depth, etc etc.
set guioptions+=i

" Automagically yank to windowing system clipboard on visual select.
" This makes gvim behave like a normal unix application.
set guioptions+=a

" Remove scrollbars
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b

" Use console dialogs instead of popup dialogs, gosh
set guioptions+=c

" colorscheme to use for GUI
"set background=dark
colorscheme liquorice

set listchars=tab:⇥⋅,trail:⋅,nbsp:⋅ " fill characters for tabs etc when set list

" Yeah baby I went there. Only use with very subtle colour theme.
set cursorcolumn
set cursorline

" Shorter spacing between lines
set linespace=-2

" Set GUI Font depending on the kind of gui/platform being loaded.
set guifont=Liberation\ Mono\ 10  " Sane default
if has("gui_win32")
	set guifont=Consolas:h11:cANSI
elseif has("gui_macvim")
	set antialias " Use smooth, antialiased fonts (OS X Specific)
	set guifont=Menlo\ Regular:h12
elseif has("gui_gnome") || has("gui_gtk") || has("gui_gtk2")
        set guifont=Inconsolata\ Medium\ 12
endif

" MacVim specific: Set fullscreen options to be as full screen as possible
if has("gui_macvim")
    set fuoptions=maxhorz,maxvert
endif

" " Set semi-sensible default window sizes for gui
" if has('gui_running')
"     set lines=54 " Yes 54 lines is completely arbitrary.
"     set columns=100 " I like some extra horizontal space by default.
"                     " For some reason it helps me focus, and not everyone
"                     " aligns their code to 80 columns.
" endif

" Technically, according to the documentation
" (try :help mousehide if you think I'm a filthy liar)
" The default behavior in the gui is to hide the mouse pointer
" when you are typing, and bring it back once you stop.
" On my system it's just always gone forever.
" So, we remedy this.
"set nomousehide

" Attempt to source .gvimrc.local for very machine-specific configurations that
" would benefit absolutely no one by being here. Mostly bug workarounds.
if filereadable(expand('~/.gvimrc.local'))
    source ~/.gvimrc.local
endif
