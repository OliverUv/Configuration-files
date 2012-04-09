" slimv.vim:    The Superior Lisp Interaction Mode for VIM
" Version:      0.6.2
" Last Change:  09 Jun 2010
" Maintainer:   Tamas Kovacs <kovisoft at gmail dot com>
" License:      This file is placed in the public domain.
"               No warranty, express or implied.
"               *** ***   Use At-Your-Own-Risk!   *** ***
"
" =====================================================================
"
"  Load Once:
if &cp || exists( 'g:slimv_loaded' )
    finish
endif

let g:slimv_loaded = 1

if has( 'win32' ) || has( 'win95' ) || has( 'win64' ) || has( 'win16' )
    let g:slimv_windows = 1
else
    " This means Linux only at the moment
    let g:slimv_windows = 0
endif


" =====================================================================
"  Functions used by global variable definitions
" =====================================================================

" Flush log message buffer to logfile
function! SlimvLogFlush()
    if exists( 'g:slimv_debug' ) && exists( 'g:slimv_logfile' ) && s:debug_list != []
        " We need to make a hack: write things into a temporary file
        " then append temp file contents to the logfile
        let tmp = tempname()
        try
            call writefile( s:debug_list, tmp )
        finally
            if g:slimv_windows
                silent execute '!type ' . tmp . ' >> ' . g:slimv_logfile
            else
                silent execute '!cat ' . tmp . ' >> ' . g:slimv_logfile
            endif
            call delete(tmp)
        endtry
        " Unfortunately I know no way to tell writefile to append the text
        "call writefile( a:message, g:slimv_logfile )
        let s:debug_list = []
    endif
endfunction

" Write debug message to logfile (message must be a list)
function! SlimvLogWrite( level, message, immediate )
    if exists( 'g:slimv_debug' ) && exists( 'g:slimv_logfile' ) && g:slimv_debug >= a:level
        let s:debug_list = s:debug_list + a:message
        if len( s:debug_list ) >= g:slimv_logfreq || a:immediate
            call SlimvLogFlush()
        endif
    endif
endfunction

" Write debug message to logfile with a timestamp
function! SlimvLog( level, message )
    if exists( '*strftime' )
        let time = strftime( '%Y %b %d %X' )
    else
        let time = localtime()
    endif
    call SlimvLogWrite( a:level, ['***** ' . time] + a:message + [''], 0 )
endfunction

" Try to autodetect Python executable
function! SlimvAutodetectPython()
    if executable( 'python' )
        return 'python'
    endif

    if g:slimv_windows
        " Try to find Python on the standard installation places
        let pythons = split( globpath( 'c:/python*,c:/Program Files/python*', 'python.exe' ), '\n' )
        if len( pythons ) > 0
            return pythons[0]
        endif
        " Go deeper in subdirectories
        let pythons = split( globpath( 'c:/python*/**,c:/Program Files/python*/**', 'python.exe' ), '\n' )
        if len( pythons ) > 0
            return pythons[0]
        endif
        return ''
    else
        return ''
    endif
endfunction

" Build the command to start the client
function! SlimvMakeClientCommand()
    if g:slimv_python == '' || g:slimv_lisp == ''
        " We don't have enough information to build client command
        return ''
    endif

    " Start with the Python path
    let cmd = g:slimv_python

    " Add path of Slimv script, on Windows enclose in double quotes
    if g:slimv_windows
        let cmd = cmd . ' "' . g:slimv_path . '"'
    else
        let cmd = cmd . ' ' . g:slimv_path
    endif

    " Add port number if different from default
    if g:slimv_port != 5151
        let cmd = cmd . ' -p ' . g:slimv_port
    endif

    " Add Lisp path
    let cmd = cmd . ' -l ' . g:slimv_lisp

    return cmd
endfunction

function! SlimvClientCommand()
    if g:slimv_client == ''
        " No command to start client, we are clueless, ask user for assistance
        if g:slimv_python == ''
            let g:slimv_python = input( 'Enter Python path (or fill g:slimv_python in your vimrc): ', '', 'file' )
        endif
        if g:slimv_lisp == ''
            let g:slimv_lisp = input( 'Enter Lisp path (or fill g:slimv_lisp in your vimrc): ', '', 'file' )
        endif
        let g:slimv_client = SlimvMakeClientCommand()
    endif
endfunction

" Find slimv.py in the Vim ftplugin directory (if not given in vimrc)
if !exists( 'g:slimv_path' )
    let plugins = split( globpath( &runtimepath, 'ftplugin/**/slimv.py'), '\n' )
    if len( plugins ) > 0
        let g:slimv_path = plugins[0]
    else
        let g:slimv_path = 'slimv.py'
    endif
endif

" Get the filetype (Lisp dialect) used by Slimv
function! SlimvGetFiletype()
    if &ft != ''
        " Return Vim filetype if defined
        return &ft
    endif

    if match( tolower( g:slimv_lisp ), 'clojure' ) >= 0 || match( tolower( g:slimv_lisp ), 'clj' ) >= 0
        " Must be Clojure
        return 'clojure'
    endif

    " We have no clue, guess its lisp
    return 'lisp'
endfunction

" Log global variables to logfile (if debug log set)
function! SlimvLogGlobals()
    let info = [ 'Loaded file: ' . fnamemodify( bufname(''), ':p' ) ]

    if exists( 'g:slimv_debug' )
        call add( info,  printf( 'g:slimv_debug         = %d',    g:slimv_debug ) )
    endif
    if exists( 'g:slimv_debug_client' )
        call add( info,  printf( 'g:slimv_debug_client  = %d',    g:slimv_debug_client ) )
    endif
    if exists( 'g:slimv_logfile' )
        call add( info,  printf( 'g:slimv_logfile       = %s',    g:slimv_logfile ) )
    endif
    if exists( 'g:slimv_port' )
        call add( info,  printf( 'g:slimv_port          = %d',    g:slimv_port ) )
    endif
    if exists( 'g:slimv_python' )
        call add( info,  printf( 'g:slimv_python        = %s',    g:slimv_python ) )
    endif
    if exists( 'g:slimv_lisp' )
        call add( info,  printf( 'g:slimv_lisp          = %s',    g:slimv_lisp ) )
    endif
    if exists( 'g:slimv_client' )
        call add( info,  printf( 'g:slimv_client        = %s',    g:slimv_client ) )
    endif
    if exists( 'g:slimv_impl' )
        call add( info,  printf( 'g:slimv_impl          = %s',    g:slimv_impl ) )
    endif
    if exists( 'g:slimv_repl_open' )
        call add( info,  printf( 'g:slimv_repl_open     = %d',    g:slimv_repl_open ) )
    endif
    if exists( 'g:slimv_repl_dir' )
        call add( info,  printf( 'g:slimv_repl_dir      = %s',    g:slimv_repl_dir ) )
    endif
    if exists( 'g:slimv_repl_file' )
        call add( info,  printf( 'g:slimv_repl_file     = %s',    g:slimv_repl_file ) )
    endif
    if exists( 'g:slimv_repl_split' )
        call add( info,  printf( 'g:slimv_repl_split    = %d',    g:slimv_repl_split ) )
    endif
    if exists( 'g:slimv_repl_wait' )
        call add( info,  printf( 'g:slimv_repl_wait     = %d',    g:slimv_repl_wait ) )
    endif
    if exists( 'g:slimv_repl_wrap' )
        call add( info,  printf( 'g:slimv_repl_wrap     = %d',    g:slimv_repl_wrap ) )
    endif
    if exists( 'g:slimv_keybindings' )
        call add( info,  printf( 'g:slimv_keybindings   = %d',    g:slimv_keybindings ) )
    endif
    if exists( 'g:slimv_menu' )
        call add( info,  printf( 'g:slimv_menu          = %d',    g:slimv_menu ) )
    endif
    if exists( 'g:slimv_ctags' )
        call add( info,  printf( 'g:slimv_ctags         = %d',    g:slimv_ctags ) )
    endif
    if exists( 'g:paredit_mode' )
        call add( info,  printf( 'g:paredit_mode        = %d',    g:paredit_mode ) )
    endif
    if exists( 'g:paredit_matchlines' )
        call add( info,  printf( 'g:paredit_matchlines  = %d',    g:paredit_matchlines ) )
    endif

    call SlimvLog( 1, info )
endfunction

au VimEnter,BufNewFile,BufRead *.lisp call SlimvLogGlobals()
au VimEnter,BufNewFile,BufRead *.clj  call SlimvLogGlobals()
au VimLeave *.lisp call SlimvLogFlush()
au VimLeave *.clj  call SlimvLogFlush()


" =====================================================================
"  Global variable definitions
" =====================================================================

" Debug level (0 = no debug messages)
if !exists( 'g:slimv_debug' )
    let g:slimv_debug = 0
endif

" Leave client window open for debugging purposes
" (works only on Windows at the moment)
if !exists( 'g:slimv_debug_client' )
    let g:slimv_debug_client = 0
endif

" Logfile name for debug messages
if !exists( 'g:slimv_logfile' )
    let g:slimv_logfile = 'slimv.log'
endif

" Flushing frequency into debug logfile
if !exists( 'g:slimv_logfreq' )
    let g:slimv_logfreq = 1
endif

" TCP port number to use
if !exists( 'g:slimv_port' )
    let g:slimv_port = 5151
endif

" Find Python (if not given in vimrc)
if !exists( 'g:slimv_python' )
    let g:slimv_python = SlimvAutodetectPython()
endif

" Find Lisp (if not given in vimrc)
if !exists( 'g:slimv_lisp' )
    let lisp = b:SlimvAutodetect()
    let g:slimv_lisp = lisp[0]
    if !exists( 'g:slimv_impl' )
        let g:slimv_impl = lisp[1]
    endif
endif

" Try to find out the Lisp implementation
" if not autodetected and not given in vimrc
if !exists( 'g:slimv_impl' )
    let g:slimv_impl = b:SlimvImplementation()
endif

" Open a REPL buffer inside Vim?
if !exists( 'g:slimv_repl_open' )
    let g:slimv_repl_open = 1
endif

" Directory name for the REPL buffer file
if !exists( 'g:slimv_repl_dir' )
    if g:slimv_windows
        let g:slimv_repl_dir = matchstr( tempname(), '.*\\' )
    else
        let g:slimv_repl_dir = '/tmp/'
    endif
endif

" Filename for the REPL buffer file
if !exists( 'g:slimv_repl_file' )
    let g:slimv_repl_file = b:SlimvREPLFile()
endif

" Shall we open REPL buffer in split window?
if !exists( 'g:slimv_repl_split' )
    let g:slimv_repl_split = 1
endif

" How many seconds to wait for the REPL output to finish?
if !exists( 'g:slimv_repl_wait' )
    let g:slimv_repl_wait = 10
endif

" Wrap long lines in REPL buffer
if !exists( 'g:slimv_repl_wrap' )
    let g:slimv_repl_wrap = 1
endif

" Build client command (if not given in vimrc)
if !exists( 'g:slimv_client' )
    let g:slimv_client = SlimvMakeClientCommand()
endif

" Slimv keybinding set (0 = no keybindings)
if !exists( 'g:slimv_keybindings' )
    let g:slimv_keybindings = 1
endif

" Append Slimv menu to the global menu (0 = no menu)
if !exists( 'g:slimv_menu' )
    let g:slimv_menu = 1
endif

" Build the ctags command capable of generating lisp tags file
" The command can be run with execute 'silent !' . g:slimv_ctags
if !exists( 'g:slimv_ctags' )
    let ctags = split( globpath( '$vim,$vimruntime', 'ctags.exe' ), '\n' )
    if len( ctags ) > 0
        " Remove -a option to regenerate every time
        let g:slimv_ctags = '"' . ctags[0] . '" -a --language-force=lisp *.lisp *.clj'
    endif
endif


" =====================================================================
"  Template definitions
" =====================================================================

if !exists( 'g:slimv_template_pprint' )
    if SlimvGetFiletype() == 'clojure'
        let g:slimv_template_pprint = '(doseq [o %1] (println o))'
    else
        let g:slimv_template_pprint = '(dolist (o %1)(pprint o))'
    endif
endif

if !exists( 'g:slimv_template_undefine' )
    if SlimvGetFiletype() == 'clojure'
        let g:slimv_template_undefine = "(ns-unmap 'user '" . "%1)"
    else
        let g:slimv_template_undefine = '(fmakunbound (read-from-string "%1"))'
    endif
endif

if !exists( 'g:slimv_template_describe' )
    let g:slimv_template_describe = '(describe (read-from-string "%1"))'
endif

if !exists( 'g:slimv_template_trace' )
    let g:slimv_template_trace = '(trace %1)'
endif

if !exists( 'g:slimv_template_untrace' )
    let g:slimv_template_untrace = '(untrace %1)'
endif

if !exists( 'g:slimv_template_profile' )
    if b:SlimvImplementation() == 'sbcl'
        let g:slimv_template_profile = '(sb-profile:profile %1)'
    else
        let g:slimv_template_profile = '(mon:monitor %1)'
    endif
endif

if !exists( 'g:slimv_template_unprofile' )
    if b:SlimvImplementation() == 'sbcl'
        let g:slimv_template_unprofile = '(sb-profile:unprofile %1)'
    else
        let g:slimv_template_unprofile = '(mon:unmonitor %1)'
    endif
endif

if !exists( 'g:slimv_template_unprofile_all' )
    if b:SlimvImplementation() == 'sbcl'
        let g:slimv_template_unprofile_all = '(sb-profile:unprofile)'
    else
        let g:slimv_template_unprofile_all = '(mon:unmonitor)'
    endif
endif

if !exists( 'g:slimv_template_show_profiled' )
    if b:SlimvImplementation() == 'sbcl'
        let g:slimv_template_show_profiled = '(sb-profile:profile)'
    else
        let g:slimv_template_show_profiled = '(pprint mon:*monitored-functions*)'
    endif
endif

if !exists( 'g:slimv_template_profile_report' )
    if b:SlimvImplementation() == 'sbcl'
        let g:slimv_template_profile_report = '(sb-profile:report)'
    else
        let g:slimv_template_profile_report = '(mon:report-monitoring)'
    endif
endif

if !exists( 'g:slimv_template_profile_reset' )
    if b:SlimvImplementation() == 'sbcl'
        let g:slimv_template_profile_reset = '(sb-profile:reset)'
    else
        let g:slimv_template_profile_reset = '(mon:reset-all-monitoring)'
    endif
endif

if !exists( 'g:slimv_template_disassemble' )
    let g:slimv_template_disassemble = "(disassemble #'%1)"
endif

if !exists( 'g:slimv_template_inspect' )
    if SlimvGetFiletype() == 'clojure'
        let g:slimv_template_inspect = "(print-doc #'" . "%1)"
    else
        let g:slimv_template_inspect = '(inspect %1)'
    endif
endif

if !exists( 'g:slimv_template_apropos' )
    if SlimvGetFiletype() == 'clojure'
        let g:slimv_template_apropos = '(find-doc "%1")'
    else
        let g:slimv_template_apropos = '(apropos "%1")'
    endif
endif

if !exists( 'g:slimv_template_macroexpand' )
    if SlimvGetFiletype() == 'clojure'
        let g:slimv_template_macroexpand = '%1'
    else
        let g:slimv_template_macroexpand = '(pprint %1)'
    endif
endif

if !exists( 'g:slimv_template_macroexpand_all' )
    if SlimvGetFiletype() == 'clojure'
        let g:slimv_template_macroexpand_all = '%1'
    else
        let g:slimv_template_macroexpand_all = '(pprint %1)'
    endif
endif

if !exists( 'g:slimv_template_compile_file' )
"    let g:slimv_template_compile_file = '(compile-file "%1")'
    let g:slimv_template_compile_file =
    \ '(let ((fasl-file (compile-file "%1")))' .
    \ '  (when (and %2 fasl-file) (load fasl-file)))'
endif

if !exists( 'g:slimv_template_compile_string' )
    let g:slimv_template_compile_string = 
    \ '(funcall (compile nil (read-from-string (format nil "(~S () ~A)" ' . "'" . 'lambda "%1"))))'
endif

if !exists( 'mapleader' )
    let mapleader = '\'
endif


" =====================================================================
"  Other non-global script variables
" =====================================================================

" Name of the REPL buffer inside Vim
let s:repl_name = g:slimv_repl_dir . g:slimv_repl_file

" Lisp prompt in the last line
let s:prompt = ''

" The current mode when REPL refresh was started
let s:insertmode = 0

" The last refresh time of the REPL buffer
let s:last_refresh = 0

" Debug log buffer
let s:debug_list = []


" =====================================================================
"  General utility functions
" =====================================================================

" Display an error message
function SlimvError( msg )
    echohl ErrorMsg
    echo a:msg
    echohl None
endfunction 

" Display an error message and wait for ENTER
function SlimvErrorWait( msg )
    echohl ErrorMsg
    let dummy = input( a:msg . " Press ENTER to continue." )
    echo ""
    echohl None
endfunction 

" Position the cursor at the end of the REPL buffer
" Optionally mark this position in Vim mark 's'
function! SlimvEndOfReplBuffer( markit, insert )
    if !g:slimv_repl_open
        " User does not want to display REPL in Vim
        return
    endif
    normal! G$
    if a:markit
        " Remember the end of the buffer: user may enter commands here
        " Also remember the prompt, because the user may overwrite it
        call setpos( "'s", [0, line('$'), col('$'), 0] )
        let s:prompt = getline( "'s" )
        if a:insert
            " We are in insert mode, so we end up appending to the last line
            startinsert!
        endif
    endif
    set nomodified
endfunction

" Reload the contents of the REPL buffer from the output file immediately
function! SlimvRefreshReplBufferNow()
    let s:last_refresh = localtime()
    if !g:slimv_repl_open
        " User does not want to display REPL in Vim
        return
    endif

    if bufnr( s:repl_name ) != bufnr( "%" )
        " REPL is not the actual buffer
        return
    endif

    try
        execute "silent edit! " . s:repl_name
    catch /.*/
        " Oops, something went wrong, the buffer will not be refreshed this time
    endtry
    syntax on
    "TODO: use :read instead and keep only the delta in the readout file
    let insert = 0
    if mode() == 'i' || mode() == 'I'
        let insert = 1
    endif
    call SlimvEndOfReplBuffer( 1, insert )
endfunction

function! SlimvFileChangedShell()
    call SlimvRefreshReplBufferNow()
endfunction

function! SlimvFocusGained()
    if s:last_refresh < localtime()
        call SlimvRefreshReplBufferNow()
    endif
endfunction

" Send interrupt command to REPL
function! SlimvInterrupt()
    call SlimvSend( ['SLIMV::INTERRUPT'], 0 )
    sleep 200m
    call SlimvRefreshReplBufferNow()
    startinsert!
endfunction

" Refresh REPL buffer continuously until no change is detected
function! SlimvRefreshReplBuffer()
    if !g:slimv_repl_open
        " User does not want to display REPL in Vim
        return
    endif

    " Refresh REPL buffer for a while until no change is detected
    let ftime = getftime( s:repl_name )
    let lastftime = ftime
    sleep 100m
    call SlimvRefreshReplBufferNow()

    if s:insertmode
        " We are in insert mode, let's fake a movement to the right
        " in order to display the cursor at the right place.
        " For this we need to set the virtualedit=all option temporarily
        echon '-- INSERT --'
        set nomodified
    else
        " Inform user that we are in running mode (waiting for REPL output)
        echon '-- RUNNING --'
    endif

    " For some reason sometimes a getchar comes with 128 followed by 0.
    " This is meant to swallow it.
    while getchar(1) == 128
        let c = getchar(0)
    endwhile

    let m = '/\%#/'
    let interrupt = 0
    let wait = g:slimv_repl_wait * 10   " number of cycles to wait for refreshing the REPL buffer
    while wait > 0 || g:slimv_repl_wait == 0
        try
            silent! execute 'match SlimvCursor ' . m
            redraw
            if getchar(1)
                break
            endif
            sleep 100m
            let lastftime = ftime
            let ftime = getftime( s:repl_name )
            if ftime != lastftime || ftime == localtime() || ftime == localtime()-1
                " REPL buffer file changed recently, reload it
                call SlimvRefreshReplBufferNow()
            endif
            if g:slimv_repl_wait != 0
                let wait = wait - 1
            endif
        catch /^Vim:Interrupt$/
            if getchar(1)
                " Swallow interrupt key
                let c = getchar(0)
                if c == 3
                    " Yes, this was the Ctrl-C, propagate it to the server
                    " but only if it has not yet been done in this turn
                    if interrupt == 0
                        let interrupt = 1
                        call SlimvHandleInterrupt()
                        " We override the wait time here to 2 secs
                        let wait = 20
                    endif
                endif
            endif
        endtry
    endwhile

    " Restore everything
    if synIDattr( synIDtrans( hlID( 'Normal' ) ), 'bg' ) != ''
        silent! execute 'match Normal ' . m
    else
        silent! execute 'match SlimvNormal ' . m
    endif
    echon '            '

    if wait == 0 && ftime != lastftime
        " Time is up and Lisp REPL still did not finish output
        " Inform user about this and about the non-blocking and blocking refresh keys
        if g:slimv_keybindings == 1
            let refresh = "<Leader>z or <Leader>Z"
        elseif g:slimv_keybindings == 2
            let refresh = "<Leader>rw or <Leader>rr"
        else
            let refresh = ":call SlimvRefreshReplBuffer()"
        endif
        call append( '$', "Slimv warning: REPL is busy, refresh display with " . refresh )
        call SlimvEndOfReplBuffer( 1, s:insertmode )
    endif
    if s:insertmode
        startinsert!
        let s:insertmode = 0
    endif
endfunction

" Called when entering REPL buffer
function! SlimvReplEnter()
    call SlimvAddReplMenu()
    if s:last_refresh < localtime()
        call SlimvRefreshReplBufferNow()
    endif
endfunction

" Called when leaving REPL buffer
function! SlimvReplLeave()
    try
        " Check if REPL menu exists, then remove it
        aunmenu REPL
        unmap <Leader>\
    catch /.*/
        " REPL menu not found, we cannot remove it
    endtry
endfunction

" Open a new REPL buffer or switch to the existing one
function! SlimvOpenReplBuffer()
    "TODO: check if this works without 'set hidden'
    let repl_buf = bufnr( s:repl_name )
    if repl_buf == -1
        " Create a new REPL buffer
        if g:slimv_repl_split
            execute "split " . s:repl_name
        else
            execute "edit " . s:repl_name
        endif
    else
        if g:slimv_repl_split
            " REPL buffer is already created. Check if it is open in a window
            let repl_win = bufwinnr( repl_buf )
            if repl_win == -1
                " Create windows
                execute "split +buffer " . repl_buf
            else
                " Switch to the REPL window
                if winnr() != repl_win
                    execute repl_win . "wincmd w"
                endif
            endif
        else
            execute "buffer " . repl_buf
        endif
    endif

    " Add keybindings valid only for the REPL buffer
    inoremap <buffer> <silent>        <CR>   <End><CR><C-O>:call SlimvSendCommand(1,0)<CR>
    inoremap <buffer> <silent>        <C-CR> <End><CR><C-O>:call SlimvSendCommand(1,1)<CR>
    inoremap <buffer> <silent>        <Up>   <C-O>:call SlimvHandleUp()<CR>
    inoremap <buffer> <silent>        <Down> <C-O>:call SlimvHandleDown()<CR>

    if exists( 'g:paredit_loaded' )
        inoremap <buffer> <silent> <expr> <BS>   PareditBackspace(1)
    else
        inoremap <buffer> <silent> <expr> <BS>   SlimvHandleBS()
    endif

    if g:slimv_keybindings == 1
        noremap <buffer> <silent> <Leader>.      :call SlimvSendCommand(0,0)<CR>
        noremap <buffer> <silent> <Leader>/      :call SlimvSendCommand(0,1)<CR>
        noremap <buffer> <silent> <Leader><Up>   :call SlimvPreviousCommand()<CR>
        noremap <buffer> <silent> <Leader><Down> :call SlimvNextCommand()<CR>
        noremap <buffer> <silent> <Leader>z      :call SlimvRefresh()<CR>
        noremap <buffer> <silent> <Leader>Z      :call SlimvRefreshNow()<CR>
    elseif g:slimv_keybindings == 2
        noremap <buffer> <silent> <Leader>rs     :call SlimvSendCommand(0,0)<CR>
        noremap <buffer> <silent> <Leader>ro     :call SlimvSendCommand(0,1)<CR>
        noremap <buffer> <silent> <Leader>rp     :call SlimvPreviousCommand()<CR>
        noremap <buffer> <silent> <Leader>rn     :call SlimvNextCommand()<CR>
        noremap <buffer> <silent> <Leader>rr     :call SlimvRefresh()<CR>
        noremap <buffer> <silent> <Leader>rw     :call SlimvRefreshNow()<CR>
    endif

    if g:slimv_repl_wrap
        inoremap <buffer> <silent>        <Home> <C-O>g<Home>
        inoremap <buffer> <silent>        <End>  <C-O>g<End>
        noremap  <buffer> <silent>        <Up>   gk
        noremap  <buffer> <silent>        <Down> gj
        noremap  <buffer> <silent>        <Home> g<Home>
        noremap  <buffer> <silent>        <End>  g<End>
        noremap  <buffer> <silent>        k      gk
        noremap  <buffer> <silent>        j      gj
        noremap  <buffer> <silent>        0      g0
        noremap  <buffer> <silent>        $      g$
        set wrap
    endif

    hi SlimvNormal term=none cterm=none gui=none
    hi SlimvCursor term=reverse cterm=reverse gui=reverse

    " Add autocommands specific to the REPL buffer
    execute "au FileChangedShell " . g:slimv_repl_file . " :call SlimvFileChangedShell()"
    execute "au FocusGained "      . g:slimv_repl_file . " :call SlimvFocusGained()"
    execute "au BufEnter "         . g:slimv_repl_file . " :call SlimvReplEnter()"
    execute "au BufLeave "         . g:slimv_repl_file . " :call SlimvReplLeave()"

    filetype on
    redraw

    call SlimvSend( ['SLIMV::OUTPUT::' . s:repl_name ], 0 )
    call SlimvEndOfReplBuffer( 0, 0 )
endfunction

" Select symbol under cursor and copy it to register 's'
function! SlimvSelectSymbol()
    "TODO: can we use expand('<cWORD>') here?
    normal! viw"sy
endfunction

" Select extended symbol under cursor and copy it to register 's'
function! SlimvSelectSymbolExt()
    let oldkw = &iskeyword
    if SlimvGetFiletype() == 'clojure'
        let &iskeyword = oldkw . ',~,#,&,|,{,}'
    else
        let &iskeyword = oldkw . ',~,#,&,|,{,},[,]'
    endif
    normal! viw"sy
    let &iskeyword = oldkw
endfunction

" Select bottom level form the cursor is inside and copy it to register 's'
function! SlimvSelectForm()
    normal! va(o
    " Handle '() or #'() etc. type special syntax forms
    " TODO: what to do with ` operator?
    let c = col( '.' ) - 2
    while c > 0 && match( ' \t()', getline( '.' )[c] ) < 0
        normal! h
        let c = c - 1
    endwhile
    normal! "sy
endfunction

" Select top level form the cursor is inside and copy it to register 's'
function! SlimvSelectToplevelForm()
    normal! 99[(
    call SlimvSelectForm()
endfunction

" Return the contents of register 's'
function! SlimvGetSelection()
    return getreg( '"s' )
endfunction

" Send argument to Lisp server for evaluation
function! SlimvSend( args, open_buffer )
    call SlimvClientCommand()
    if g:slimv_client == ''
        return
    endif

    if a:open_buffer
        call SlimvOpenReplBuffer()
    endif

    " Build a temporary file from the form to be evaluated
    let ar = []
    let i = 0
    while i < len( a:args )
        call extend( ar, split( a:args[i], '\n' ) )
        let i = i + 1
    endwhile

    let tmp = tempname()
    try
        call SlimvLog( 2, a:args )
        call writefile( ar, tmp )

        " Send the file to the client for evaluation
        if g:slimv_debug_client == 0
	    "echo input(g:slimv_client . ' -f ' . tmp)
            let result = system( g:slimv_client . ' -f ' . tmp )
        else
            execute '!' . g:slimv_client . ' -f ' . tmp
        endif
    finally
        call delete(tmp)
    endtry

    if a:open_buffer
        call SlimvRefreshReplBuffer()
    endif
endfunction

" Eval arguments in Lisp REPL
function! SlimvEval( args )
    call SlimvSend( a:args, g:slimv_repl_open )
endfunction

" Set command line after the prompt
function! SlimvSetCommandLine( cmd )
    let line = getline( "." )
    if line( "." ) == line( "'s" )
        " The prompt is in the line marked with 's
        let promptlen = len( s:prompt )
    else
        let promptlen = 0
    endif
    if len( line ) > promptlen
        let line = strpart( line, 0, promptlen )
    endif
    let line = line . a:cmd
    call setline( ".", line )
    call SlimvEndOfReplBuffer( 0, 0 )
endfunction

" Add command list to the command history
function! SlimvAddHistory( cmd )
    if !exists( 'g:slimv_cmdhistory' )
        let g:slimv_cmdhistory = []
    endif
    let i = 0
    while i < len( a:cmd )
        " Trim trailing whitespaces from the command
        let command = substitute( a:cmd[i], "\\(.*[^ ]\\)\\s*", "\\1", "g" )
        call add( g:slimv_cmdhistory, command )
        let i = i + 1
    endwhile
    let g:slimv_cmdhistorypos = len( g:slimv_cmdhistory )
endfunction

" Recall command from the command history at the marked position
function! SlimvRecallHistory()
    if g:slimv_cmdhistorypos >= 0 && g:slimv_cmdhistorypos < len( g:slimv_cmdhistory )
        call SlimvSetCommandLine( g:slimv_cmdhistory[g:slimv_cmdhistorypos] )
    else
        call SlimvSetCommandLine( "" )
    endif
endfunction

" Count the opening and closing parens or brackets to determine if they match
function! s:GetParenCount( lines )
    let paren = 0
    let inside_string = 0
    let i = 0
    while i < len( a:lines )
        let inside_comment = 0
        let j = 0
        while j < len( a:lines[i] )
            if inside_string
                " We are inside a string, skip parens, wait for closing '"'
                if a:lines[i][j] == '"'
                    let inside_string = 0
                endif
            elseif inside_comment
                " We are inside a comment, skip parens, wait for end of line
            else
                " We are outside of strings and comments, now we shall count parens
                if a:lines[i][j] == '"'
                    let inside_string = 1
                endif
                if a:lines[i][j] == ';'
                    let inside_comment = 1
                endif
                if a:lines[i][j] == '(' || a:lines[i][j] == '['
                    let paren = paren + 1
                endif
                if a:lines[i][j] == ')' || a:lines[i][j] == ']'
                    let paren = paren - 1
                    if paren < 0
                        " Oops, too many closing parens in the middle
                        return paren
                    endif
                endif
            endif
            let j = j + 1
        endwhile
        let i = i + 1
    endwhile
    return paren
endfunction

" Send command line to REPL buffer
" Arguments: insert = we are in insertmode, close = add missing closing parens
function! SlimvSendCommand( insert, close )
    let lastline = line( "'s" )
    let lastcol  =  col( "'s" )
    if lastline > 0
        if line( "." ) >= lastline
            " Trim the prompt from the beginning of the command line
            " The user might have overwritten some parts of the prompt
            let cmdline = getline( lastline )
            let c = 0
            while c < lastcol - 1 && cmdline[c] == s:prompt[c]
                let c = c + 1
            endwhile
            let cmd = [ strpart( getline( lastline ), c ) ]

            " Build a possible multi-line command
            let l = lastline + 1
            while l <= line("$") - 1
                call add( cmd, strpart( getline( l ), 0) )
                let l = l + 1
            endwhile

            " Count the number of opening and closing braces
            let paren = s:GetParenCount( cmd )
            if paren > 0 && a:close
                " Expression is not finished yet, add missing parens and evaluate it
                while paren > 0
                    let cmd[len(cmd)-1] = cmd[len(cmd)-1] . ')'
                    let paren = paren - 1
                endwhile
            endif
            if paren == 0
                " Expression finished, let's evaluate it
                " but first add it to the history
                let s:insertmode = a:insert
                call SlimvAddHistory( cmd )
                call SlimvEval( cmd )
            elseif paren < 0
                " Too many closing braces
                call SlimvErrorWait( "Too many closing parens found." )
            else
                " Expression is not finished yet, indent properly and wait for completion
                " Indentation works only if lisp indentation is switched on
                let indent = ''
                let i = lispindent( '.' )
                while i > 0
                    let indent = indent . ' '
                    let i = i - 1
                endwhile
                call setline( ".", indent )
                call SlimvEndOfReplBuffer( 0, 0 )
            endif
        endif
    else
        call append( '$', "Slimv error: previous EOF mark not found, re-enter last form:" )
        call append( '$', "" )
        call SlimvEndOfReplBuffer( 1, 0 )
    endif
endfunction

" Close current top level form by adding the missing parens
function! SlimvCloseForm()
    let l2 = line( '.' )
    normal! 99[(
    let l1 = line( '.' )
    let form = []
    let l = l1
    while l <= l2
        call add( form, getline( l ) )
        let l = l + 1
    endwhile
    let paren = s:GetParenCount( form )
    if paren < 0
        " Too many closing braces
        call SlimvErrorWait( "Too many closing parens found." )
    elseif paren > 0
        " Add missing parens
        let lastline = getline( l2 )
        while paren > 0
            let lastline = lastline . ')'
            let paren = paren - 1
        endwhile
        call setline( l2, lastline )
    endif
    normal! %
endfunction

" Handle insert mode 'Backspace' keypress in the REPL buffer
function! SlimvHandleBS()
    if line( "." ) == line( "'s" ) && col( "." ) <= col( "'s" )
        " No BS allowed before the previous EOF mark
        return ""
    else
        return "\<BS>"
    endif
endfunction

" Recall previous command from command history
function! s:PreviousCommand()
    if exists( 'g:slimv_cmdhistory' ) && g:slimv_cmdhistorypos > 0
        let g:slimv_cmdhistorypos = g:slimv_cmdhistorypos - 1
        call SlimvRecallHistory()
    endif
endfunction

" Recall next command from command history
function! s:NextCommand()
    if exists( 'g:slimv_cmdhistory' ) && g:slimv_cmdhistorypos < len( g:slimv_cmdhistory )
        let g:slimv_cmdhistorypos = g:slimv_cmdhistorypos + 1
        call SlimvRecallHistory()
    else
        call SlimvSetCommandLine( "" )
    endif
endfunction

" Handle insert mode 'Up' keypress in the REPL buffer
function! SlimvHandleUp()
    if line( "." ) >= line( "'s" )
        call s:PreviousCommand()
    else
        normal! gk
    endif
endfunction

" Handle insert mode 'Down' keypress in the REPL buffer
function! SlimvHandleDown()
    if line( "." ) >= line( "'s" )
        call s:NextCommand()
    else
        normal! gj
    endif
endfunction

" Go to command line and recall previous command from command history
function! SlimvPreviousCommand()
    call SlimvEndOfReplBuffer( 0, 0 )
    if line( "." ) >= line( "'s" )
        call s:PreviousCommand()
    endif
endfunction

" Go to command line and recall next command from command history
function! SlimvNextCommand()
    call SlimvEndOfReplBuffer( 0, 0 )
    if line( "." ) >= line( "'s" )
        call s:NextCommand()
    endif
endfunction

" Handle interrupt (Ctrl-C) keypress in the REPL buffer
function! SlimvHandleInterrupt()
    call SlimvSend( ['SLIMV::INTERRUPT'], 0 )
    sleep 200m
    call SlimvRefreshReplBufferNow()
endfunction

" Start and connect slimv server
" This is a quite dummy function that just evaluates the empty string
function! SlimvConnectServer()
    call SlimvEval( [''] )
endfunction

" Refresh REPL buffer continuously
function! SlimvRefresh()
    if bufnr( s:repl_name ) == -1
        " REPL not opened, no need to refresh
        return
    endif
    if bufnr( s:repl_name ) != bufnr( "%" )
        " REPL is not the current window, activate it
        call SlimvOpenReplBuffer()
    endif
    call SlimvRefreshReplBuffer()
endfunction

" Refresh REPL buffer continuously
function! SlimvRefreshNow()
    if bufnr( s:repl_name ) == -1
        " REPL not opened, no need to refresh
        return
    endif
    if bufnr( s:repl_name ) != bufnr( "%" )
        " REPL is not the current window, activate it
        call SlimvOpenReplBuffer()
    endif
    call SlimvRefreshReplBufferNow()
endfunction

" Get the last region (visual block)
function! SlimvGetRegion() range
    if mode() == 'v' || mode() == 'V'
        let lines = getline( a:firstline, a:lastline )
        let firstcol = col( a:firstline ) - 1
        let lastcol  = col( a:lastline  ) - 2
    else
        let lines = getline( "'<", "'>" )
        let firstcol = col( "'<" ) - 1
        let lastcol  = col( "'>" ) - 2
    endif
    if lastcol >= 0
        let lines[len(lines)-1] = lines[len(lines)-1][ : lastcol]
    else
        let lines[len(lines)-1] = ''
    endif
    let lines[0] = lines[0][firstcol : ]
    return lines
endfunction

" Eval buffer lines in the given range
function! SlimvEvalRegion() range
    let lines = SlimvGetRegion()
    call SlimvEval( lines )
endfunction

" Eval contents of the 's' register
function! SlimvEvalSelection()
    let lines = [SlimvGetSelection()]
    call SlimvEval( lines )
endfunction

" Eval Lisp form.
" Form given in the template is passed to Lisp without modification.
function! SlimvEvalForm( template )
    let lines = [a:template]
    call SlimvEval( lines )
endfunction

" Eval Lisp form, with the given parameter substituted in the template.
" %1 string is substituted with par1
function! SlimvEvalForm1( template, par1 )
    let p1 = escape( a:par1, '&' )
    let temp1 = substitute( a:template, '%1', p1, 'g' )
    let lines = [temp1]
    call SlimvEval( lines )
endfunction

" Eval Lisp form, with the given parameters substituted in the template.
" %1 string is substituted with par1
" %2 string is substituted with par2
function! SlimvEvalForm2( template, par1, par2 )
    let p1 = escape( a:par1, '&' )
    let p2 = escape( a:par2, '&' )
    let temp1 = substitute( a:template, '%1', p1, 'g' )
    let temp2 = substitute( temp1,      '%2', p2, 'g' )
    let lines = [temp2]
    call SlimvEval( lines )
endfunction


" =====================================================================
"  Special functions
" =====================================================================

" Evaluate top level form at the cursor pos
function! SlimvEvalDefun()
    call SlimvSelectToplevelForm()
    call SlimvEvalSelection()
endfunction

" Evaluate the whole buffer
function! SlimvEvalBuffer()
    let lines = getline( 1, '$' )
    call SlimvEval( lines )
endfunction

" Evaluate last expression
function! SlimvEvalLastExp()
    call SlimvSelectForm()
    call SlimvEvalSelection()
endfunction

" Evaluate and pretty print last expression
function! SlimvPprintEvalLastExp()
    call SlimvSelectForm()
    call SlimvEvalForm1( g:slimv_template_pprint, SlimvGetSelection() )
endfunction

" Evaluate expression entered interactively
function! SlimvInteractiveEval()
    let e = input( 'Eval: ' )
    if e != ''
        call SlimvEval([e])
    endif
endfunction

" Undefine function
function! SlimvUndefineFunction()
    call SlimvSelectSymbol()
    call SlimvEvalForm1( g:slimv_template_undefine, SlimvGetSelection() )
endfunction

" ---------------------------------------------------------------------

" General part of the various macroexpand functions
function! SlimvMacroexpandGeneral( command )
    normal! 99[(
    let line = getline( "." )
    if match( line, 'defmacro' ) < 0
        " The form does not contain 'defmacro', put it in a macroexpand block
        call SlimvSelectForm()
        let m = "(" . a:command . " '" . SlimvGetSelection() . ")"
    else
        " The form is a 'defmacro', so do a macroexpand from the macro name and parameters
        if SlimvGetFiletype() == 'clojure'
            " Some Vim configs (e.g. matchit.vim) include the trailing ']' after '%' in Visual mode
            normal! vt[%ht]"sy
        else
            normal! vt(])"sy
        endif
        let m = SlimvGetSelection() . '))'
        let m = substitute( m, "defmacro\\s*", a:command . " '(", 'g' )
        if SlimvGetFiletype() == 'clojure'
            " Remove opening bracket from the parameter list
            " TODO: fix this for multi-line macro header
            let m = substitute( m, "\\[\\(.*\\)", "\\1", 'g' )
        else
            " Remove opening brace from the parameter list
            " The nice regular expression below says: remove the third '('
            " ( + something + ( + something + ( + something -> ( + something + ( + something + something
            " TODO: fix this for multi-line macro header
            let m = substitute( m, "\\(([^()]*([^()]*\\)(\\(.*\\)", "\\1\\2", 'g' )
        endif
    endif
    return m
endfunction

" Macroexpand-1 the current top level form
function! SlimvMacroexpand()
    let m = SlimvMacroexpandGeneral( "macroexpand-1" )
    call SlimvEvalForm1( g:slimv_template_macroexpand, m )
endfunction

" Macroexpand the current top level form
function! SlimvMacroexpandAll()
    let m = SlimvMacroexpandGeneral( "macroexpand" )
    call SlimvEvalForm1( g:slimv_template_macroexpand_all, m )
endfunction

" Switch trace on for the selected function
function! SlimvTrace()
    call SlimvSelectSymbol()
    let s = input( 'Trace: ', SlimvGetSelection() )
    echo s
    if s != ''
        call SlimvEvalForm1( g:slimv_template_trace, s )
    endif
endfunction

" Switch trace off for the selected function
function! SlimvUntrace()
    call SlimvSelectSymbol()
    let s = input( 'Untrace: ', SlimvGetSelection() )
    if s != ''
        call SlimvEvalForm1( g:slimv_template_untrace, s )
    endif
endfunction

" Disassemble the selected function
function! SlimvDisassemble()
    call SlimvSelectSymbol()
    let s = input( 'Disassemble: ', SlimvGetSelection() )
    if s != ''
        call SlimvEvalForm1( g:slimv_template_disassemble, s )
    endif
endfunction

" Inspect symbol
function! SlimvInspect()
    call SlimvSelectSymbol()
    let s = input( 'Inspect: ', SlimvGetSelection() )
    if s != ''
        call SlimvEvalForm1( g:slimv_template_inspect, s )
    endif
endfunction

" ---------------------------------------------------------------------

" Compile and load profiler
function! SlimvLoadProfiler()
    if SlimvGetFiletype() == 'clojure'
        call SlimvError( "No profiler support for Clojure." )
    elseif b:SlimvImplementation() == 'sbcl'
        call SlimvError( "SBCL has a built-in profiler, no need to load it." )
    else
        let profiler = split( globpath( &runtimepath, 'ftplugin/**/metering.lisp'), '\n' )
        if len( profiler ) > 0
            let filename = profiler[0]
            let filename = substitute( filename, '\\', '/', 'g' )
            call SlimvEvalForm2( g:slimv_template_compile_file, filename, 'T' )
        else
            call SlimvError( "metering.lisp is not found in the Vim ftplugin directory or below." )
        endif
    endif
endfunction

" Switch profiling on for the selected function
function! SlimvProfile()
    if SlimvGetFiletype() == 'clojure'
        call SlimvError( "No profiler support for Clojure." )
    else
        call SlimvSelectSymbol()
        let s = input( 'Profile: ', SlimvGetSelection() )
        if s != ''
            call SlimvEvalForm1( g:slimv_template_profile, s )
        endif
    endif
endfunction

" Switch profiling off for the selected function
function! SlimvUnprofile()
    if SlimvGetFiletype() == 'clojure'
        call SlimvError( "No profiler support for Clojure." )
    else
        call SlimvSelectSymbol()
        let s = input( 'Unprofile: ', SlimvGetSelection() )
        if s != ''
            call SlimvEvalForm1( g:slimv_template_unprofile, s )
        endif
    endif
endfunction

" Switch profiling completely off
function! SlimvUnprofileAll()
    if SlimvGetFiletype() == 'clojure'
        call SlimvError( "No profiler support for Clojure." )
    else
        call SlimvEvalForm( g:slimv_template_unprofile_all )
    endif
endfunction

" Display list of profiled functions
function! SlimvShowProfiled()
    if SlimvGetFiletype() == 'clojure'
        call SlimvError( "No profiler support for Clojure." )
    else
        call SlimvEvalForm( g:slimv_template_show_profiled )
    endif
endfunction

" Report profiling results
function! SlimvProfileReport()
    if SlimvGetFiletype() == 'clojure'
        call SlimvError( "No profiler support for Clojure." )
    else
        call SlimvEvalForm( g:slimv_template_profile_report )
    endif
endfunction

" Reset profiling counters
function! SlimvProfileReset()
    if SlimvGetFiletype() == 'clojure'
        call SlimvError( "No profiler support for Clojure." )
    else
        call SlimvEvalForm( g:slimv_template_profile_reset )
    endif
endfunction

" ---------------------------------------------------------------------

" Compile the current top-level form
function! SlimvCompileDefun()
    "TODO: handle double quote characters in form
    call SlimvSelectToplevelForm()
    call SlimvEvalForm1( g:slimv_template_compile_string, SlimvGetSelection() )
endfunction

" Compile and load whole file
function! SlimvCompileLoadFile()
    let filename = fnamemodify( bufname(''), ':p' )
    let filename = substitute( filename, '\\', '/', 'g' )
    call SlimvEvalForm2( g:slimv_template_compile_file, filename, 'T' )
endfunction

" Compile whole file
function! SlimvCompileFile()
    let filename = fnamemodify( bufname(''), ':p' )
    let filename = substitute( filename, '\\', '/', 'g' )
    call SlimvEvalForm2( g:slimv_template_compile_file, filename, 'NIL' )
endfunction

function! SlimvCompileRegion() range
    "TODO: handle double quote characters in form
    let lines = SlimvGetRegion()
    let region = join( lines, ' ' )
    call SlimvEvalForm1( g:slimv_template_compile_string, region )
endfunction

" ---------------------------------------------------------------------

" Describe the selected symbol
function! SlimvDescribeSymbol()
    call SlimvSelectSymbol()
    call SlimvEvalForm1( g:slimv_template_describe, SlimvGetSelection() )
endfunction

" Apropos of the selected symbol
function! SlimvApropos()
    call SlimvSelectSymbol()
    call SlimvEvalForm1( g:slimv_template_apropos, SlimvGetSelection() )
endfunction

" Generate tags file using ctags
function! SlimvGenerateTags()
    if exists( 'g:slimv_ctags' ) && g:slimv_ctags != ''
        execute 'silent !' . g:slimv_ctags
    else
        call SlimvError( "Copy ctags to the Vim path or define g:slimv_ctags." )
    endif
endfunction

" ---------------------------------------------------------------------

" Find word in the CLHS symbol database, with exact or partial match.
" Return either the first symbol found with the associated URL,
" or the list of all symbols found without the associated URL.
function! SlimvFindSymbol( word, exact, all, db, root, init )
    if a:word == ''
        return []
    endif
    if !a:all && a:init != []
        " Found something already at a previous db lookup, no need to search this db
        return a:init
    endif
    let lst = a:init
    let i = 0
    let w = tolower( a:word )
    if a:exact
        while i < len( a:db )
            " Try to find an exact match
            if a:db[i][0] == w
                " No reason to check a:all here
                return [a:db[i][0], a:root . a:db[i][1]]
            endif
            let i = i + 1
        endwhile
    else
        while i < len( a:db )
            " Try to find the symbol starting with the given word
            let w2 = escape( w, '~' )
            if match( a:db[i][0], w2 ) == 0
                if a:all
                    call add( lst, a:db[i][0] )
                else
                    return [a:db[i][0], a:root . a:db[i][1]]
                endif
            endif
            let i = i + 1
        endwhile
    endif

    " Return whatever found so far
    return lst
endfunction

" Lookup word in Common Lisp Hyperspec
function! SlimvLookup( word )
    " First try an exact match
    let w = a:word
    let symbol = []
    while symbol == []
        let symbol = b:SlimvHyperspecLookup( w, 1, 0 )
        if symbol == []
            " Symbol not found, try a match on beginning of symbol name
            let symbol = b:SlimvHyperspecLookup( w, 0, 0 )
            if symbol == []
                " We are out of luck, can't find anything
                let msg = 'Symbol ' . w . ' not found. Hyperspec lookup word: '
                let val = ''
            else
                let msg = 'Hyperspec lookup word: '
                let val = symbol[0]
            endif
            " Ask user if this is that he/she meant
            let w = input( msg, val )
            if w == ''
                " OK, user does not want to continue
                return
            endif
            let symbol = []
        endif
    endwhile
    if symbol != []
        " Symbol found, open HS page in browser
        if match( symbol[1], ':' ) < 0
            let page = g:slimv_hs_root . symbol[1]
        else
            " URL is already a fully qualified address
            let page = symbol[1]
        endif
        if g:slimv_windows
            silent execute '! start ' . page
        else
            " On Linux it's not easy to determine the default browser
            " Ask help from Python webbrowser package
            let pycmd = "import webbrowser; webbrowser.open('" . page . "')"
            silent execute '! ' . g:slimv_python . ' -c "' . pycmd . '"'
        endif
    endif
endfunction

" Lookup current symbol in the Common Lisp Hyperspec
function! SlimvHyperspec()
    call SlimvSelectSymbolExt()
    call SlimvLookup( SlimvGetSelection() )
endfunction

" Complete function that uses the Hyperspec database
function! SlimvComplete( findstart, base )
    if a:findstart
        " Locate the start of the symbol name
        let line = getline( '.' )
        let start = col( '.' ) - 1
        while start > 0 && ( line[start - 1] =~ '\a' || match( '\*&', line[start - 1] ) >= 0 )
            let start -= 1
        endwhile
        return start
    else
        " Find all symbols starting with "a:base"
        let res = []
        let symbol = b:SlimvHyperspecLookup( a:base, 0, 1 )
        call sort( symbol )
        for m in symbol
            if m =~ '^' . a:base
                call add( res, m )
            endif
        endfor
        return res
    endif
endfunction

" Define complete function only if none is defined yet
if &omnifunc == ''
    set omnifunc=SlimvComplete
endif

" =====================================================================
"  Slimv keybindings
" =====================================================================

" <Leader> can be set in .vimrc, it defaults here to ','
" <Leader> timeouts in 1000 msec by default, if this is too short,
" then increase 'timeoutlen'

if g:slimv_keybindings == 1
    " Short (one-key) keybinding set

    noremap <Leader>)  :<C-U>call SlimvCloseForm()<CR>
    inoremap <C-X>0    <C-O>:call SlimvCloseForm()<CR>
    noremap <Leader>(  :<C-U>call PareditToggle()<CR>

    noremap <Leader>d  :<C-U>call SlimvEvalDefun()<CR>
    noremap <Leader>e  :<C-U>call SlimvEvalLastExp()<CR>
    noremap <Leader>E  :<C-U>call SlimvPprintEvalLastExp()<CR>
    noremap <Leader>r  :call SlimvEvalRegion()<CR>
    noremap <Leader>b  :<C-U>call SlimvEvalBuffer()<CR>
    noremap <Leader>v  :call SlimvInteractiveEval()<CR>
    noremap <Leader>u  :call SlimvUndefineFunction()<CR>

    noremap <Leader>1  :<C-U>call SlimvMacroexpand()<CR>
    noremap <Leader>m  :<C-U>call SlimvMacroexpandAll()<CR>
    noremap <Leader>t  :call SlimvTrace()<CR>
    noremap <Leader>T  :call SlimvUntrace()<CR>
    noremap <Leader>l  :call SlimvDisassemble()<CR>
    noremap <Leader>i  :call SlimvInspect()<CR>

    noremap <Leader>D  :<C-U>call SlimvCompileDefun()<CR>
    noremap <Leader>L  :<C-U>call SlimvCompileLoadFile()<CR>
    noremap <Leader>F  :<C-U>call SlimvCompileFile()<CR>
    noremap <Leader>R  :call SlimvCompileRegion()<CR>

    noremap <Leader>O  :call SlimvLoadProfiler()<CR>
    noremap <Leader>p  :call SlimvProfile()<CR>
    noremap <Leader>P  :call SlimvUnprofile()<CR>
    noremap <Leader>U  :call SlimvUnprofileAll()<CR>
    noremap <Leader>?  :call SlimvShowProfiled()<CR>
    noremap <Leader>o  :call SlimvProfileReport()<CR>
    noremap <Leader>x  :call SlimvProfileReset()<CR>

    noremap <Leader>s  :call SlimvDescribeSymbol()<CR>
    noremap <Leader>a  :call SlimvApropos()<CR>
    noremap <Leader>h  :call SlimvHyperspec()<CR>
    noremap <Leader>]  :call SlimvGenerateTags()<CR>

    noremap <Leader>c  :call SlimvConnectServer()<CR>

elseif g:slimv_keybindings == 2
    " Easy to remember (two-key) keybinding set

    " Edit commands
    noremap <Leader>tc  :<C-U>call SlimvCloseForm()<CR>
    inoremap <C-X>0     <C-O>:call SlimvCloseForm()<CR>
    noremap <Leader>(t  :<C-U>call PareditToggle()<CR>

    " Evaluation commands
    noremap <Leader>ed  :<C-U>call SlimvEvalDefun()<CR>
    noremap <Leader>ee  :<C-U>call SlimvEvalLastExp()<CR>
    noremap <Leader>ep  :<C-U>call SlimvPprintEvalLastExp()<CR>
    noremap <Leader>er  :call SlimvEvalRegion()<CR>
    noremap <Leader>eb  :<C-U>call SlimvEvalBuffer()<CR>
    noremap <Leader>ei  :call SlimvInteractiveEval()<CR>
    noremap <Leader>eu  :call SlimvUndefineFunction()<CR>

    " Debug commands
    noremap <Leader>m1  :<C-U>call SlimvMacroexpand()<CR>
    noremap <Leader>ma  :<C-U>call SlimvMacroexpandAll()<CR>
    noremap <Leader>dt  :call SlimvTrace()<CR>
    noremap <Leader>du  :call SlimvUntrace()<CR>
    noremap <Leader>dd  :call SlimvDisassemble()<CR>
    noremap <Leader>di  :call SlimvInspect()<CR>

    " Compile commands
    noremap <Leader>cd  :<C-U>call SlimvCompileDefun()<CR>
    noremap <Leader>cl  :<C-U>call SlimvCompileLoadFile()<CR>
    noremap <Leader>cf  :<C-U>call SlimvCompileFile()<CR>
    noremap <Leader>cr  :call SlimvCompileRegion()<CR>

    " Profile commands
    noremap <Leader>pl  :call SlimvLoadProfiler()<CR>
    noremap <Leader>pp  :call SlimvProfile()<CR>
    noremap <Leader>pu  :call SlimvUnprofile()<CR>
    noremap <Leader>pa  :call SlimvUnprofileAll()<CR>
    noremap <Leader>ps  :call SlimvShowProfiled()<CR>
    noremap <Leader>pr  :call SlimvProfileReport()<CR>
    noremap <Leader>px  :call SlimvProfileReset()<CR>

    " Documentation commands
    noremap <Leader>ds  :call SlimvDescribeSymbol()<CR>
    noremap <Leader>da  :call SlimvApropos()<CR>
    noremap <Leader>dh  :call SlimvHyperspec()<CR>
    noremap <Leader>dt  :call SlimvGenerateTags()<CR>

    " REPL commands
    noremap <Leader>rc  :call SlimvConnectServer()<CR>

endif

" =====================================================================
"  Slimv menu
" =====================================================================

if g:slimv_menu == 1
    " Works only if 'wildcharm' is <Tab>
    ":map <Leader>, :emenu Slimv.<Tab>
    if &wildcharm == 0
        set wildcharm=<Tab>
    endif
    if &wildcharm != 0
        execute ':map <Leader>, :emenu Slimv.' . nr2char( &wildcharm )
    endif

    amenu &Slimv.Edi&t.Close-&Form                     :<C-U>call SlimvCloseForm()<CR>
    imenu &Slimv.Edi&t.&Complete-Symbol                <C-X><C-O>
    amenu &Slimv.Edi&t.&Paredit-Toggle                 :<C-U>call PareditToggle()<CR>

    amenu &Slimv.&Evaluation.Eval-&Defun               :<C-U>call SlimvEvalDefun()<CR>
    amenu &Slimv.&Evaluation.Eval-Last-&Exp            :<C-U>call SlimvEvalLastExp()<CR>
    amenu &Slimv.&Evaluation.&Pprint-Eval-Last         :<C-U>call SlimvPprintEvalLastExp()<CR>
    amenu &Slimv.&Evaluation.Eval-&Region              :call SlimvEvalRegion()<CR>
    amenu &Slimv.&Evaluation.Eval-&Buffer              :<C-U>call SlimvEvalBuffer()<CR>
    amenu &Slimv.&Evaluation.Interacti&ve-Eval\.\.\.   :call SlimvInteractiveEval()<CR>
    amenu &Slimv.&Evaluation.&Undefine-Function        :call SlimvUndefineFunction()<CR>

    amenu &Slimv.De&bugging.Macroexpand-&1             :<C-U>call SlimvMacroexpand()<CR>
    amenu &Slimv.De&bugging.&Macroexpand-All           :<C-U>call SlimvMacroexpandAll()<CR>
    amenu &Slimv.De&bugging.&Trace\.\.\.               :call SlimvTrace()<CR>
    amenu &Slimv.De&bugging.U&ntrace\.\.\.             :call SlimvUntrace()<CR>
    amenu &Slimv.De&bugging.Disassemb&le\.\.\.         :call SlimvDisassemble()<CR>
    amenu &Slimv.De&bugging.&Inspect\.\.\.             :call SlimvInspect()<CR>

    amenu &Slimv.&Compilation.Compile-&Defun           :<C-U>call SlimvCompileDefun()<CR>
    amenu &Slimv.&Compilation.Compile-&Load-File       :<C-U>call SlimvCompileLoadFile()<CR>
    amenu &Slimv.&Compilation.Compile-&File            :<C-U>call SlimvCompileFile()<CR>
    amenu &Slimv.&Compilation.Compile-&Region          :call SlimvCompileRegion()<CR>

    amenu &Slimv.&Profiling.&Load-Profiler             :call SlimvLoadProfiler()<CR>
    amenu &Slimv.&Profiling.&Profile\.\.\.             :call SlimvProfile()<CR>
    amenu &Slimv.&Profiling.&Unprofile\.\.\.           :call SlimvUnprofile()<CR>
    amenu &Slimv.&Profiling.Unprofile-&All             :call SlimvUnprofileAll()<CR>
    amenu &Slimv.&Profiling.&Show-Profiled             :call SlimvShowProfiled()<CR>
    amenu &Slimv.&Profiling.-ProfilingSep-             :
    amenu &Slimv.&Profiling.Profile-Rep&ort            :call SlimvProfileReport()<CR>
    amenu &Slimv.&Profiling.Profile-&Reset             :call SlimvProfileReset()<CR>

    amenu &Slimv.&Documentation.Describe-&Symbol       :call SlimvDescribeSymbol()<CR>
    amenu &Slimv.&Documentation.&Apropos               :call SlimvApropos()<CR>
    amenu &Slimv.&Documentation.&Hyperspec             :call SlimvHyperspec()<CR>
    imenu &Slimv.&Documentation.&Complete-Symbol       <C-X><C-O>
    amenu &Slimv.&Documentation.Generate-&Tags         :call SlimvGenerateTags()<CR>

    amenu &Slimv.&Repl.&Connect-Server                 :call SlimvConnectServer()<CR>
endif

" Add REPL menu. This menu exist only for the REPL buffer.
function SlimvAddReplMenu()
    if &wildcharm != 0
        execute ':map <Leader>\ :emenu REPL.' . nr2char( &wildcharm )
    endif

    amenu &REPL.Send-&Input                            :call SlimvSendCommand(0,0)<CR>
    amenu &REPL.Cl&ose-Send-Input                      :call SlimvSendCommand(0,1)<CR>
    amenu &REPL.Interrup&t-Lisp-Process                <Esc>:<C-U>call SlimvInterrupt()<CR>
    amenu &REPL.-REPLSep-                              :
    amenu &REPL.&Previous-Input                        :call SlimvPreviousCommand()<CR>
    amenu &REPL.&Next-Input                            :call SlimvNextCommand()<CR>
    menu  &REPL.&Refresh                               :call SlimvRefresh()<CR>
    amenu &REPL.Refresh-No&w                           :call SlimvRefreshNow()<CR>
endfunction

