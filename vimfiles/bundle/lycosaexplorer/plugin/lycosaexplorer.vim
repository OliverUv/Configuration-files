"    Copyright: Copyright (C) 2012 Michael Hart
"               LycosaExplorer (which this script is based on)
"               Copyright (C) 2007-2010 Stephen Bach
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               lycosa-explorer.vim is provided *as is* and comes with no
"               warranty of any kind, either expressed or implied. In no
"               event will the copyright holder be liable for any damages
"               resulting from the use of this software.
"
" Name Of File: lycosaexplorer.vim
"  Description: Dynamic Filesystem and Buffer Explorer Vim Plugin
"  Maintainers: Michael Hart
"
" Release Date: January 16 2012
"      Version: 0.9
"
"        Usage:
"                 <Leader>lf  - Opens the filesystem explorer.
"                 <Leader>lr  - Opens the filesystem explorer from the
"                               directory of the current file.
"                 <Leader>lb  - Opens the buffer explorer.
"
"               You can also use the commands:
"
"                 ":LycosaFilesystemExplorer"
"                 ":LycosaFilesystemExplorer <some directory path>"
"                 ":LycosaFilesystemExplorerFromHere"
"                 ":LycosaBufferExplorer"
"
"               When launched, a new window appears at bottom presenting a
"               table of files/dirs or buffers, and in the status bar a
"               prompt:
"
"                 >>
"
"               As you type, the table updates for possible matches using a
"               fuzzy matching algorithm.  Special keys include:
"
"                 <Enter>  open selected match
"                 <Tab>    open selected match
"                 <Esc>    cancel
"                 <C-c>    cancel
"                 <C-g>    cancel
"
"                 <C-t>    open selected match in a new [t]ab
"                 <C-o>    open selected match in a new h[o]rizontal split
"                 <C-v>    open selected match in a new [v]ertical split
"
"                 <C-b>    go [b]ack one column
"                 <C-f>    go [f]orward one column
"                 <C-n>    select [n]ext match
"                 <C-p>    select [p]revious match
"                 The above four actions can also be accessed with the cursor
"                 keys
"
"                 <C-u>    clear prompt
"
"               Additional shortcuts for the filesystem explorer:
"
"                 <C-w>    ascend one directory at prompt
"                 <C-r>    [r]efresh directory contents
"                 <C-a>    open [a]ll files in current tab
"                 <C-e>    create new buffer with the given name and path
"                 <C-y>    call callback, see install instructions below
"
" Filesystem Explorer:
"
"  - Directory contents are memoized.  (<C-r> to refresh.)
"  - You can recurse into and out of directories by typing the directory name
"    and a slash, e.g. "stuff/" or "../".
"  - Variable expansion, e.g. "$D" -> "/long/dir/path/".
"  - Tilde (~) expansion, e.g. "~/" -> "/home/steve/".
"  - Dotfiles are hidden by default, but are shown if the current search term
"    begins with a '.'.  To show these file at all times, set this option:
"
"       let g:LycosaExplorerAlwaysShowDotFiles = 1
"
"  You can prevent certain files from appearing in the table with the
"  following variable:
"
"    set wildignore=*.o,*.fasl,CVS
"
"  The above will mask all object files, compiled lisp files, and
"  files/directories named CVS from appearing in the table.  Note that they
"  can still be opened by being named explicitly.
"
"  See :help 'wildignore' for more information.
"
" Buffer Explorer:
"
"  - Buffers are sorted first by fuzzy match and then by most-recently used.
"  - The currently active buffer is highlighted.
"
"
" Install Details:
"
" Copy this file and lycosa.py into $HOME/.vim/plugin directory so that it will
" be sourced on startup automatically.
"
" Note! This plugin requires Vim be compiled with Python interpretation.  If you
" don't know if your build of Vim has this functionality, you can check by
" running "vim --version" from the command line and looking for "+python".
" Alternatively, just try sourcing this script.
"
" If your version of Vim does not have "+python" but you would still like to
" use this plugin, you can fix it.  See the "Check for Python functionality"
" comment below for instructions.
"
" If you are using the same Vim configuration and plugins for multiple
" machines, some of which have Python and some of which don't, you may want to
" turn off the "Sorry, LycosaExplorer requires python" warning.  You can do so
" like this (in .vimrc):
"
"   let g:LycosaExplorerSuppressPythonWarning = 1
"
" Default keybindings can be suppressed if you want a mapping other than that
" already provided. You can do this so like this (in .vimrc)
"
"   let g:LycosaExplorerDefaultMappings = 0
"
" You can set a callback to be run with the current directory name when C-y is
" pressed in a filesystem explorer, for example:
"
"   function g:example_callback(dirname)
"       echo a:dirname
"   endfunction
"
"   let g:LycosaExplorerYankCallback = "g:example_callback"

" Exit quickly when already loaded.
if exists("g:loaded_lycosaexplorer")
  finish
endif

if &compatible
  echohl ErrorMsg
  echo "LycosaExplorer is not designed to run in &compatible mode;"
  echo "To use this plugin, first disable vi-compatible mode like so:\n"

  echo "   :set nocompatible\n"

  echo "Or even better, just create an empty .vimrc file."
  echohl none
  finish
endif

" Check for Python functionality.
if !has("python") || version < 700
  if !exists("g:LycosaExplorerSuppressPythonWarning") ||
      \ g:LycosaExplorerSuppressPythonWarning == "0"
    echohl ErrorMsg
    echon "Sorry, LycosaExplorer requires python.  "
    echon "Here are some tips for adding it:\n"

    echo "Debian / Ubuntu:"
    echo "    # apt-get install vim\n"

    echo "Fedora:"
    echo "    # yum install vim-enhanced\n"

    echo "Gentoo:"
    echo "    # USE=\"python\" emerge vim\n"

    echo "FreeBSD:"
    echo "    # pkg_add -r vim+python\n"

    echo "Windows:"
    echo "    1. Download and install Python from here:"
    echo "       http://www.python.org/"
    echo "    2. Install a Vim binary with Python support:"
    echo "       http://www.vim.org/download.php#pc"

    echo "Manually (including Cygwin):"
    echo "    1. Install Python."
    echo "    2. Download the Vim source package (say, vim-7.3.tar.bz2)"
    echo "    3. Build and install:"
    echo "         # tar -xvjf vim-7.3.tar.bz2"
    echo "         # ./configure --enable-pythoninterp"
    echo "         # make && make install"

    echo "(If you just wish to stifle this message, set the following option:"
    echo "  let g:LycosaExplorerSuppressPythonWarning = 1)"
    echohl none
  endif
  finish
endif

if ! &hidden
  echohl WarningMsg
  echo "You are running with 'hidden' mode off.  LycosaExplorer may"
  echo "sometimes emit error messages in this mode -- you should turn"
  echo "it on, like so:\n"

  echo "   :set hidden\n"

  echo "Even better, put this in your .vimrc file."
  echohl none
endif

let g:loaded_lycosaexplorer = 1

" Commands.
command LycosaBufferExplorer :call <SID>LycosaBufferExplorerStart()
command -nargs=? LycosaFilesystemExplorer :call <SID>LycosaFilesystemExplorerStart("<args>")
command LycosaFilesystemExplorerFromHere :call <SID>LycosaFilesystemExplorerStart(expand("%:p:h"))

" Default mappings.
if !exists("g:LycosaExplorerDefaultMappings")
  let g:LycosaExplorerDefaultMappings = 1
endif

if g:LycosaExplorerDefaultMappings == 1
  nnoremap <silent> <Leader>lf :LycosaFilesystemExplorer<CR>
  nnoremap <silent> <Leader>lr :LycosaFilesystemExplorerFromHere<CR>
  nnoremap <silent> <Leader>lb :LycosaBufferExplorer<CR>
endif

" Vim-to-python function calls.
function! s:LycosaFilesystemExplorerStart(path)
  exec "python lycosa_filesystem_explorer.run_from_path(r'".escape(a:path, "'\\")."')"
endfunction

function! s:LycosaBufferExplorerStart()
  python lycosa_buffer_explorer.run()
endfunction

function! s:LycosaFilesystemExplorerCancel()
  python lycosa_filesystem_explorer.cancel()
endfunction

function! s:LycosaBufferExplorerCancel()
  python lycosa_buffer_explorer.cancel()
endfunction

function! s:LycosaFilesystemExplorerKeyPressed(code_arg)
  python lycosa_filesystem_explorer.key_pressed()
endfunction

function! s:LycosaBufferExplorerKeyPressed(code_arg)
  python lycosa_buffer_explorer.key_pressed()
endfunction

" Setup the autocommands that handle buffer MRU ordering.
augroup LycosaExplorer
  autocmd!
  autocmd BufEnter * python lycosa_buffer_stack.push()
  autocmd BufDelete * python lycosa_buffer_stack.pop()
  autocmd BufWipeout * python lycosa_buffer_stack.pop()
augroup End

execute "pyfile ".fnameescape(fnamemodify(expand("<sfile>"), ":h")."/lycosa.py")
" vim: set sts=2 sw=2:
