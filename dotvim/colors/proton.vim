" Theme based on proton by Henning Hasemann

" I only source this after having first sourced liquorice.vim, during
" daytime when the sun shines. Not tested without the liquorice colors.

set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif
let g:colors_name = "proton"

hi Normal guibg=#F7EDDF guifg=#4A4A4A gui=none
hi Comment guibg=NONE guifg=#9098a0 gui=NONE
hi Todo gui=UNDERLINE guifg=#99004C guibg=#d8d1c8

hi Cursor guibg=#404040 guifg=#a0a0a0
hi CursorColumn guibg=#FFEBCC guifg=NONE
hi CursorLine guibg=#FFEBCC guifg=NONE

hi TabLineFill  gui=NONE guifg=#606060 guibg=#d8d1c8
hi TabLine      gui=NONE guifg=#606060 guibg=#d8d1c8
hi TabLineSel   gui=NONE guifg=#404040 guibg=#F7EDDF
" These are custom colors, for tab numbers used with the gt command see
" the vimrc for tabline code that uses them.
hi TabNumber    gui=NONE guifg=#99004C guibg=#d8d1c8
hi TabNumberSel gui=NONE guifg=#99004C guibg=#F7EDDF
hi TabModified     gui=BOLD guifg=#d0d0d0 guibg=#a0a0a0
hi TabModifiedSel  gui=BOLD guifg=#202020 guibg=#F7EDDF

hi NonText guibg=#d8d1c8 guifg=#606060 gui=none
hi Visual guibg=#d8d1c8 guifg=#606060 gui=none
hi Folded guibg=#d8d1c8 guifg=#606060 gui=none
hi SpecialKey guibg=#e8e8e8 guifg=#a0a0a0 gui=none
hi Search guibg=#B3FFD0 guifg=NONE gui=bold

hi ModeMsg guibg=#f8f1e8 guifg=#304050 gui=bold
hi MoreMsg guibg=#f8f1e8 guifg=#304050 gui=bold

hi StatusLine guibg=#808080 guifg=#f8f1e8 gui=bold,italic
hi StatusLineNC guibg=#707070 guifg=#d0d0d0 gui=italic
hi VertSplit guibg=#D1CAC2 guifg=#909090 gui=none

hi LineNr guibg=#d8d1c8 guifg=#707070 gui=none

hi Underlined guifg=#202020 guibg=#f8f1e8 gui=underline

hi Statement guibg=#EDE6E4 guifg=#994726 gui=none
hi Label guibg=#e8e1d8 guifg=#000000 gui=none
hi Operator guifg=#a77039 guibg=#f8f1e8 gui=none
hi! link Conceal NONE
hi Conceal guifg=#AF4631 guibg=#F7EDDF gui=none

hi Title guibg=#f8f1e8 guifg=#202020 gui=underline

" Python: @ in front of decorators
hi Define guifg=#605080 guibg=#ece8f0 gui=italic,bold
hi Include guifg=#605080 guibg=#dcd8e0 gui=none

hi Function guifg=#b08020 guibg=#f0e8c0 gui=underline

hi Conditional guibg=#e0e8f0 guifg=#5080b0 gui=bold
hi Repeat guibg=#e0e8f0 guifg=#5080b0 gui=bold
hi Exception guibg=#f8f1e8 guifg=#a03020 gui=bold

hi Type guifg=#607080 guibg=#f8f1e8 gui=underline
" typescript func parameters
hi PreProc guifg=#504d83 guibg=#e8e1d8 gui=italic
hi Identifier guifg=#608050 guibg=#c0e0c0 gui=none

hi Constant guifg=#508040 guibg=#f8f1e8
hi Number guifg=#508040 guibg=#f8f1e8
hi String guifg=#a07060 guibg=#F5E6DC gui=italic
hi Special guifg=#693020 guibg=#EDDDD1 gui=italic

hi Error gui=BOLD guifg=#f2ca03 guibg=#191919
hi SyntasticWarningLine guibg=#f8f1e8

hi DiffText guifg=NONE guibg=#E3D6F5
hi DiffDelete guifg=#F3C4D3 guibg=#F4DCD7
hi DiffChange guifg=NONE guibg=#D7E8F9
hi DiffAdd guifg=NONE guibg=#E3F6D0

" hi SpellBad gui=undercurl guisp=#f02020
hi SpellBad gui=NONE guifg=NONE guibg=#FF8C8C
" hi SpellLocal	gui=NONE guifg=#8CB586 guibg=#071E40

hi UniteSelectedLine gui=NONE guifg=NONE guibg=#d8d1c8

hi gitcommitFile guifg=#404040 guibg=NONE

hi IndentGuidesOdd  gui=NONE guifg=NONE guibg=#FBEADF
hi IndentGuidesEven gui=NONE guifg=NONE guibg=#EDE6E4

hi SignColumn   gui=NONE guifg=#202020 guibg=#d8d1c8

" Highlights for ALE
hi ALEErrorLine gui=NONE guifg=NONE guibg=#F8E2E2
hi ALEWarningLine gui=NONE guifg=NONE guibg=#FFF8C2

" Typescript
hi typescriptVariableDeclaration gui=NONE guifg=#432843 guibg=#F8DDF8
hi typescriptObjectLabel gui=ITALIC guifg=#371559 guibg=#EDE6E4
" not sure why it works
" hi typescriptEndColons gui=NONE guifg=#FF0000 guibg=NONE

" Highlights for interesting words, see
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
hi def InterestingWord1 guifg=#000000 guibg=#CC99CC
hi def InterestingWord2 guifg=#000000 guibg=#EBB78E
hi def InterestingWord3 guifg=#000000 guibg=#ffB764
hi def InterestingWord4 guifg=#000000 guibg=#CC7A8B
hi def InterestingWord5 guifg=#000000 guibg=#CBFF9F
hi def InterestingWord6 guifg=#000000 guibg=#99C9C9
