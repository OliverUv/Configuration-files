" Maintainer: Oliver Uvman
" License: Public Domain, attribution appreciated.
" Last Change: 2013-02-28
" Based on the neon theme by Tiza. Thanks Tiza! You got taste bro.
" http://github.com/OliverUv/Configuration-files/blob/master/dotvim/colors/liquorice.vim


" Uncomment this or put it in your vimrc if you feel like it!

"set cursorcolumn " this theme has subtle lines
"set cursorline
"
" if has("autocmd")
"     " Disable foldcolumn in diff windows, because it looks bad.
"     " You probably don't want to do this unless you've got that
"     " disabled in your own vimrc.
"     au FilterWritePre * if &diff | setlocal fdc=0 | endif

"     " CursorLine and CursorColumn override DiffAdd and DiffDelete,
"     " which looks ugly. This disables cursorline and cursorcolumn
"     " when a split goes into diff mode. Haven't yet figured out how
"     " to re-enable the setting (consider that we only want to do this
"     " if it was on in the first place!)
"     au FilterWritePre * if &diff | setlocal nocursorcolumn | endif
"     au FilterWritePre * if &diff | setlocal nocursorline | endif
" endif

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "liquorice"

hi Normal       guifg=#f0f0f0 guibg=#141414

" Search
hi IncSearch    gui=BOLD guifg=#ffffff guibg=#99004c
hi Search       gui=BOLD guifg=#cc99ff guibg=#430075

" Messages
hi ErrorMsg     gui=BOLD guifg=#ffa0ff guibg=NONE
hi WarningMsg   gui=BOLD guifg=#ffa0ff guibg=NONE
hi ModeMsg      gui=BOLD guifg=#a0d0ff guibg=NONE
hi MoreMsg      gui=BOLD guifg=#70ffc0 guibg=#8040ff
hi Question     gui=BOLD guifg=#e8e800 guibg=NONE

" Split area
hi StatusLine   gui=NONE guifg=#d6d6d6 guibg=#602040
hi StatusLineNC gui=NONE guifg=#000000 guibg=#909090
hi VertSplit    gui=NONE guifg=#909090 guibg=#111111
hi WildMenu     gui=NONE guifg=#000000 guibg=#ff80c0

" Diff
hi DiffText     gui=NONE guifg=NONE guibg=#1A1800
hi DiffChange   gui=NONE guifg=#f0f0f0 guibg=#714B00
hi DiffDelete   gui=NONE guifg=#701D1D guibg=#701D1D
hi DiffAdd      gui=NONE guifg=NONE guibg=#064D08

" Autocompletion menu
hi Pmenu        gui=NONE guifg=#f0f0f0 guibg=#903D3D
hi PmenuSel     gui=NONE guifg=#ffffff guibg=#BF4545
hi PmenuSbar    gui=NONE guifg=#f0f0f0 guibg=#B67171

" Cursor
hi Cursor       gui=BOLD guifg=#ffffff guibg=#99004c
hi MatchParen   gui=BOLD guifg=#ffffff guibg=#6600cc
hi lCursor      gui=NONE guifg=#ffffff guibg=#8800ff
hi CursorIM     gui=NONE guifg=#ffffff guibg=#8800ff
hi CursorLine   gui=NONE guifg=NONE    guibg=#111111
hi CursorColumn gui=NONE guifg=NONE    guibg=#111111

" Fold
hi Folded       gui=NONE guifg=#c8c8c8 guibg=#0d0d0d
hi FoldColumn   gui=NONE guifg=#c8c8c8 guibg=#212121

" vim-indent-guides
hi IndentGuidesOdd  gui=NONE guifg=NONE guibg=#0a0a0a
hi IndentGuidesEven gui=NONE guifg=NONE guibg=#0d0d0d

" Signs
hi SignColumn   gui=NONE guifg=#f0f0f0 guibg=#303030

" Spelling - SpellCap (and maybe others) also used by Syntastic
hi SpellLocal	gui=UNDERCURL guifg=NONE guibg=NONE guisp=#FF99CC
hi SpellCap	gui=UNDERCURL guifg=NONE guibg=NONE guisp=#00FF00
hi SpellBad	gui=UNDERCURL guifg=NONE guibg=NONE guisp=#FF0000

" Other
hi Directory    gui=NONE guifg=#c8c8ff guibg=NONE
hi LineNr       gui=NONE guifg=#727272 guibg=#0e0e0e
hi NonText      gui=BOLD guifg=#d84070 guibg=#0b0b0b
hi SpecialKey   gui=BOLD guifg=#8888ff guibg=NONE
hi Title        gui=BOLD guifg=fg      guibg=NONE
hi Visual       gui=NONE guifg=NONE guibg=#7C2B7C
hi VisualNOS    gui=NONE guifg=NONE guibg=#7C2B7C

" Syntax group
hi Comment      gui=NONE guifg=#c0c0c0 guibg=NONE
hi Constant     gui=NONE guifg=#92d4ff guibg=NONE
hi Error        gui=BOLD guifg=#ffffff guibg=#8000ff
hi Identifier   gui=NONE guifg=#40f8f8 guibg=NONE
hi Ignore       gui=NONE guifg=bg      guibg=NONE
hi PreProc      gui=NONE guifg=#ffa8ff guibg=NONE
hi Special      gui=NONE guifg=#ffc890 guibg=NONE
hi Statement    gui=NONE guifg=#dcdc78 guibg=NONE
hi Todo         gui=BOLD,UNDERLINE guifg=#ff80d0 guibg=NONE
hi Type         gui=NONE guifg=#60f0a8 guibg=NONE
hi Underlined   gui=UNDERLINE guifg=fg guibg=NONE
