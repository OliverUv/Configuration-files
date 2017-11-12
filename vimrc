" Initialization {{{ "
let g:pathogen_disabled = ['ctrlp', 'ctrlp-funky', 'CoVim', 'neocomplcache', 'neocomplcache-ultisnips', 'python-mode', 'vim-niji']

if has("win32") || has("win64")
   " Required by pathogen.vim for loading plugins
   if !has("nvim")
      call pathogen#infect()
   end

   "Required by vim-latex on windows machines
   set shellslash

   "Otherwise vim will try to write temp files in sys32 folder when editing new file
   set directory=.,$TEMP
elseif !has("nvim")
   call pathogen#infect('~/.vim/bundle')
   " Unless we're in gvim, set up colors
   if !has("gui_running")
       set t_Co=256
       colorscheme liquorice-approx
   end
end

let sharedrc = expand('~/Configuration-files/vim8_nvim_rc.vim')
if filereadable(sharedrc)
    exec "source " . sharedrc
endif


" Plugin settings {{{ "

" NeoMake {{{ "
"" https://github.com/neomake/neomake
""

" Seems like NeoMake doesn't honour this when 0 or 2, when using :Neomake!
" let g:neomake_open_list = 2
let g:neomake_list_height = 7

" augroup my_neomake
"     au!
"     autocmd User NeomakeFinished silent exec "!$HOME/bin/done"
" augroup END

" Typescript {{{ "
function! neomake#makers#ft#typescript#tsc() abort
    " Copied from NeoMake source to remove the cwd set, which
    " erroneous paths to be put in the location / quickfix list
    return {
        \ 'args': [],
        \ 'append_file': 0,
        \ 'errorformat':
            \ '%E%f(%l\,%c): error TS%n: %m.,' .
            \ '%E%f %#(%l\,%c): error %m,' .
            \ '%E%f %#(%l\,%c): %m,' .
            \ '%Eerror %m,' .
            \ '%C%\s%\+%m'
        \ }
endfunction

let g:neomake_typescript_tslint_args = ['--type-check', '--project', './tsconfig.json']
" }}} Typescript "

" }}} NeoMake "

" Tagbar {{{ "
" nnoremap <silent> <leader>tt :TagbarToggle<cr>
" nnoremap <silent> <leader>tg :TagbarOpen fj<cr>
let g:tagbar_compact = 1
let g:tagbar_width = 40
" }}} Tagbar "

" Vim-latex {{{ "
" set grepprg=grep\ -nH\ $*

let g:Tex_DefaultTargetFormat = 'pdf'
let g:tex_flavor='latex'
let g:Tex_SmartKeyQuote=0
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

nnoremap <silent> <leader>,g :execute "!makeglossaries " . shellescape(expand('%:r'), 1)<CR>
" }}} Vim-latex "

" Neocomplete {{{ "
" http://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:echodoc_enable_at_startup = 1

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
"let g:jedi#completions_enabled = 0
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
let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\w*'
let g:neocomplete#force_omni_input_patterns.rust =
            \ '[^.[:digit:] *\t]\%(\.\|\::\)\%(\h\w*\)\?'

    " <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" }}} Neocomplete "

" Syntastic {{{ "
let g:syntastic_error_symbol = '✗ '
let g:syntastic_warning_symbol = '⚠ '
let g:syntastic_style_error_symbol = '✠ '
let g:syntastic_style_warning_symbol = '≈ '
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 6
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_coffee_coffeelint_args = '-f ~/.config/coffeelint.json'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_c_config_file = '.clang_complete'
let g:syntastic_cpp_config_file = '.clang_complete'
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_mode_map = { "mode": "active",
            \ "active_filetypes": ["coffee", "javascript", "python"],
            \ "passive_filetypes": ["cpp"] }
nnoremap <silent> <Leader>Jz :SyntasticReset<cr>:SyntasticCheck<cr>
" }}} Syntastic "

" misc {{{ "
let g:gutentags_exclude = ['node_modules', 'build', 'dist']
let g:gutentags_ctags_exclude = ['node_modules', 'build', 'dist']
" }}} misc "

" }}} Plugin settings "

" Machine specific settings loading {{{ "
" Load local .vimrc for machine-specific options
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }}} Machine specific settings loading "
