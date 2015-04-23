" Theme based on proton by Henning Hasemann

" I only source this after having first sourced liquorice.vim, during
" daytime when the sun shines. Not tested without the liquorice colors.


hi Normal guibg=#f0f0f0 guifg=#404040 gui=none
hi Comment guibg=#f0f0f0 guifg=#9098a0 gui=none
"hi ToDo guibg=#f0f0f0 guifg=#9098a0 gui=bold
hi Todo gui=UNDERLINE,ITALIC guifg=#99004C guibg=#d0d0d0

hi Cursor guibg=#404040 guifg=#a0a0a0
hi CursorColumn guibg=#e0e0e0 guifg=#202020
hi CursorLine guibg=#e0e0e0 guifg=#202020

hi TabLineFill  gui=NONE guifg=#606060 guibg=#d0d0d0
hi TabLine      gui=NONE guifg=#606060 guibg=#d0d0d0
hi TabLineSel   gui=NONE guifg=#404040 guibg=#f0f0f0
" These are custom colors, for tab numbers used with the gt command see
" the vimrc for tabline code that uses them.
hi TabNumber    gui=NONE guifg=#99004C guibg=#d0d0d0
hi TabNumberSel gui=NONE guifg=#99004C guibg=#f0f0f0
hi TabModified     gui=BOLD guifg=#d0d0d0 guibg=#a0a0a0
hi TabModifiedSel  gui=BOLD guifg=#202020 guibg=#f0f0f0

hi NonText guibg=#d0d0d0 guifg=#606060 gui=none
hi Visual guibg=#d0d0d0 guifg=#606060 gui=none
hi Folded guibg=#d0d0d0 guifg=#606060 gui=none
hi SpecialKey guibg=#e8e8e8 guifg=#a0a0a0 gui=none
hi Search guibg=#808080 guifg=#ffffff gui=bold

hi ModeMsg guibg=#f0f0f0 guifg=#304050 gui=bold
hi MoreMsg guibg=#f0f0f0 guifg=#304050 gui=bold

hi StatusLine guibg=#808080 guifg=#f0f0f0 gui=bold,italic
hi StatusLineNC guibg=#707070 guifg=#d0d0d0 gui=italic
hi VertSplit guibg=#707070 guifg=#909090 gui=none

hi LineNr guibg=#d0d0d0 guifg=#606060 gui=none

hi Underlined guifg=#202020 guibg=#f0f0f0 gui=underline

hi Statement guibg=#e0e0e0 guifg=#606060 gui=none
hi Label guibg=#e0e0e0 guifg=#606060 gui=underline
hi Operator guifg=#a77039 guibg=#f0f0f0 gui=none

hi Title guibg=#f0f0f0 guifg=#202020 gui=underline

" Python: @ in front of decorators
"hi Define guifg=#906000 guibg=#f0e8c0 gui=bold
hi Define guifg=#605080 guibg=#ece8f0 gui=italic,bold
hi Include guifg=#605080 guibg=#dcd8e0 gui=none

hi Function guifg=#b08020 guibg=#f0e8c0 gui=underline

hi Conditional guibg=#e0e8f0 guifg=#5080b0 gui=bold
hi Repeat guibg=#e0e8d8 guifg=#509030 gui=bold
hi Exception guibg=#f0f0f0 guifg=#a03020 gui=bold

hi Type guifg=#607080 guibg=#f0f0f0 gui=underline
hi PreProc guifg=#605080 guibg=#dcd8e0 gui=italic
hi Identifier guifg=#608050 guibg=#c0e0c0 gui=none


hi Constant guifg=#508040 guibg=#f0f0f0
hi Number guifg=#508040 guibg=#f0f0f0
hi String guifg=#a07060 guibg=#f0ece8 gui=italic
hi Special guifg=#603020 guibg=#f0ece8 gui=italic

hi Error gui=BOLD guifg=#f2ca03 guibg=#191919
hi SyntasticWarningLine guibg=#f0f0f0

hi DiffText guifg=#ffcc7f guibg=#a67429
hi DiffDelete guifg=#ff7f50 guibg=#a62910
hi DiffChange guifg=#7fbdff guibg=#425c78
hi DiffAdd guifg=#8ae234 guibg=#4e9a06

hi SpellBad gui=undercurl guisp=#f02020

hi UniteSelectedLine gui=NONE guifg=NONE guibg=#d0d0d0

hi gitcommitFile guifg=#404040 guibg=NONE

hi IndentGuidesOdd  gui=NONE guifg=NONE guibg=#e5e5e5
hi IndentGuidesEven gui=NONE guifg=NONE guibg=#dadada

hi SignColumn   gui=NONE guifg=#202020 guibg=#d0d0d0
