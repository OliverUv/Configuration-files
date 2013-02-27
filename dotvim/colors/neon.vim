" Vim color file
"  Maintainer: OliverUv
" Last Change: 2013-02-22
" This color scheme uses a dark background.
" Based on neon by somedude

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "neon"

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
hi DiffDelete   gui=NONE guifg=#903D3D guibg=#903D3D
hi DiffAdd      gui=NONE guifg=#f0f0f0 guibg=#165D18

" Autocompletion menu
hi Pmenu        gui=NONE guifg=#f0f0f0 guibg=#903D3D
hi PmenuSel     gui=NONE guifg=#ffffff guibg=#BF4545
hi PmenuSbar    gui=NONE guifg=#f0f0f0 guibg=#B67171

" Cursor
hi Cursor       gui=NONE guifg=#70ffc0 guibg=#8040ff
hi lCursor      gui=NONE guifg=#ffffff guibg=#8800ff
hi CursorIM     gui=NONE guifg=#ffffff guibg=#8800ff

" Fold
hi Folded       gui=NONE guifg=#c8c8c8 guibg=#0d0d0d
hi FoldColumn   gui=NONE guifg=#c8c8c8 guibg=#212121

" Signs
hi SignColumn   gui=NONE guifg=#f0f0f0 guibg=#303030

"ShowMarks - plugin
hi ShowMarksHLl gui=NONE guifg=#40c0ff guibg=#272727
hi ShowMarksHLu gui=NONE guifg=#40c0ff guibg=#272727
hi ShowMarksHLo gui=NONE guifg=#40c0ff guibg=#272727
hi ShowMarksHLm gui=NONE guifg=#ff9040 guibg=#272727

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
