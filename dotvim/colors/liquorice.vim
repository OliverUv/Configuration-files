" Maintainer: Oliver Uvman, @OliverUv
" License: Public Domain, attribution appreciated.
" Last Changed: 2013-09-04
" Based on the neon theme by Tiza. Thanks Tiza! You got taste bro.
" Also some ideas taken from the theme nazca by Jose Elera Compana,
" who also has a super nice theme called gummybears.

" Located and updated at
" http://github.com/OliverUv/Configuration-files/blob/master/dotvim/colors/liquorice.vim

" Uncomment the following or put it in your vimrc if you feel like it!

"set cursorcolumn " this theme has subtle lines, but they interfere
"set cursorline   " with diff background colors which is a tragedy.
"
" if has("autocmd")
"     " Disable foldcolumn in diff windows, because it looks bad.
"     " You probably don't want to do this unless you've got it
"     " disabled in your own vimrc.
"     au FilterWritePre * if &diff | setlocal fdc=0 | endif

"     " CursorLine and CursorColumn override DiffAdd and DiffDelete,
"     " which looks ugly. This disables cursorline and cursorcolumn
"     " when a split goes into diff mode. Haven't yet figured out how
"     " to re-enable the setting (and consider that we only want to do
"     " this if it was on in the first place!)
"     au FilterWritePre * if &diff | setlocal nocursorcolumn | endif
"     au FilterWritePre * if &diff | setlocal nocursorline | endif
" endif

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "liquorice"

" to use: CC478A - darkpink

hi Normal       guifg=#B0A197 guibg=#181214

" Search
hi IncSearch    gui=BOLD guifg=#ffffff guibg=#99004c
hi Search       gui=BOLD guifg=#cc99ff guibg=#430075

" Messages
hi ErrorMsg     gui=BOLD guifg=#0B4662 guibg=NONE
hi WarningMsg   gui=BOLD guifg=#cea662 guibg=NONE
hi ModeMsg      gui=BOLD guifg=#a0d0ff guibg=NONE
hi MoreMsg      gui=BOLD guifg=#70ffc0 guibg=#8040ff
hi Question     gui=BOLD guifg=#e8e800 guibg=NONE

" Split area
" hi StatusLine   gui=ITALIC guifg=#d6d6d6 guibg=#37323B
hi StatusLine gui=ITALIC guifg=#998B73 guibg=#2C272E
hi StatusLineNC gui=ITALIC guifg=#8B7D65 guibg=#201C21
if has('nvim')
    hi MsgArea      gui=NONE guifg=#8B7D65 guibg=#201C21
    " Doesn't seem to work??
    " hi NormalFloat  gui=NONE guifg=#CCBDA3 guibg=#3C2442
end
hi VertSplit    gui=NONE guifg=#909090 guibg=#120C14
hi WildMenu     gui=NONE guifg=#000000 guibg=#ff80c0

" Tab bar
hi TabLineFill     gui=NONE guifg=#000000 guibg=#120C14
hi TabLine         gui=NONE guifg=#8a8a8a guibg=#120C14
hi TabLineSel      gui=NONE guifg=#d6d6d6 guibg=#602040

" These are custom for tabs, see script in .vimrc
hi TabNumber       gui=NONE guifg=#ffa8ff guibg=#121212
hi TabNumberSel    gui=NONE guifg=#ffa8ff guibg=#602040
hi TabModified     gui=BOLD guifg=#ffa8ff guibg=#121212
hi TabModifiedSel  gui=BOLD guifg=#ffb0ff guibg=#602040


" Diff
hi DiffText     gui=BOLD guifg=NONE guibg=#1f1500
hi DiffChange   gui=NONE guifg=#B5A586 guibg=#4A3000
hi DiffDelete   gui=NONE guifg=#490808 guibg=#400707
hi DiffAdd      gui=NONE guifg=NONE guibg=#042806

" Autocompletion menu
hi Pmenu        guifg=#f6f3e8 guibg=#303030 gui=NONE
hi PmenuSel     guifg=#f6f3e8 guibg=#000000 gui=NONE
hi PmenuSbar    guifg=#000000 guibg=#444444 gui=NONE
hi PmenuThumb   guifg=#000000 guibg=#8a8a8a gui=NONE

" Unite selected line
hi UniteSelectedLine gui=NONE guifg=NONE guibg=#000000

" Cursor
hi Cursor       gui=BOLD guifg=#ffffff guibg=#99004c
hi MatchParen   gui=NONE guifg=#ffffff guibg=#146666
hi lCursor      gui=NONE guifg=#ffffff guibg=#8800ff
hi CursorIM     gui=NONE guifg=#ffffff guibg=#8800ff
hi CursorLine   gui=NONE guifg=NONE    guibg=#0d0d0d
hi CursorColumn gui=NONE guifg=NONE    guibg=#0d0d0d

" Fold
hi Folded       gui=NONE guifg=#cea662 guibg=#0b000e
hi FoldColumn   gui=NONE guifg=#c8c8c8 guibg=#0b000e

" vim-indent-guides
hi IndentGuidesOdd  gui=NONE guifg=NONE guibg=#1f141c
hi IndentGuidesEven gui=NONE guifg=NONE guibg=#110D0F

" Signs
hi SignColumn   gui=NONE guifg=#f0f0f0 guibg=#0b000e

" ColorColumn
hi ColorColumn   gui=NONE guifg=NONE guibg=#000000

" Spelling - SpellCap (and maybe others) also used by Syntastic
hi SpellBad	gui=NONE guifg=#B5A586 guibg=#400707
hi SpellLocal	gui=NONE guifg=#8CB586 guibg=#071E40
hi link SpellCap SpellLocal

" Other
hi Directory    gui=NONE guifg=#c8c8ff guibg=NONE
hi LineNr       gui=ITALIC guifg=#4D4347 guibg=#0b000e
hi CursorLineNr gui=ITALIC,BOLD guifg=#0e0e0e guibg=#99004c
hi NonText      gui=BOLD guifg=#3C3438 guibg=NONE
hi SpecialKey   gui=BOLD guifg=#808080 guibg=NONE
hi Title        gui=NONE guifg=#d0d0d0 guibg=NONE
hi Visual       gui=NONE guifg=NONE guibg=#4D1C4D
hi link VisualNOS Visual

" Syntax group
hi Comment      gui=NONE guifg=#7A7D7D guibg=NONE
hi Comment      gui=NONE guifg=#707373 guibg=NONE
hi Error        gui=BOLD guifg=#f2ca03 guibg=#000000
hi Identifier   gui=NONE guifg=#B085E1 guibg=NONE
hi Ignore       gui=NONE guifg=bg      guibg=NONE
hi PreProc      gui=NONE guifg=#ffa8ff guibg=NONE
hi Constant     gui=NONE guifg=#f8bef8 guibg=NONE
hi Special      gui=NONE guifg=#CF8F53 guibg=#0A0A0A
hi Statement    gui=NONE guifg=#60f0a8 guibg=#0F080B
hi Repeat       gui=BOLD guifg=#60f0a8 guibg=NONE
hi Todo         gui=UNDERLINE,ITALIC guifg=#ff80d0 guibg=NONE
hi Type         gui=NONE guifg=#6699cc guibg=NONE
hi Underlined   gui=UNDERLINE guifg=fg guibg=NONE
hi String       gui=NONE guifg=#876B99 guibg=#231A23
hi Number       gui=NONE guifg=#acdd82 guibg=NONE
hi Conditional  gui=BOLD guifg=#60f0a8 guibg=NONE
hi Boolean      gui=NONE guifg=#86bbee guibg=NONE
hi Function     gui=NONE guifg=#cea662 guibg=NONE
hi Delimiter    gui=NONE guifg=#85ADAD guibg=NONE
hi Operator     gui=NONE guifg=#86BBEE guibg=NONE

" TagHighlight plugin colors ( https://github.com/abudden/taghighlight-automirror )
" hi link to from
hi! link Conceal Operator
hi link Class Type
hi link DefinedName PreProc
hi link Enumerator Constant
hi link EnumerationName String
hi link Union Constant
hi link GlobalConstant Constant
hi link GlobalVariable Special
hi Member gui=NONE guifg=#ffd7ab guibg=NONE

" Not a real vim syntax group, used by some ftplugins
hi LocalVariable gui=NONE guifg=#B058B0 guibg=NONE


" Dependent syntax groups
hi link Character       String
hi link Float           Number
hi Label     gui=NONE guifg=#987FB0 guibg=#0F080B
hi link Exception       Statement
hi link Keyword         Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" TypeScript
" defined by yats.vim
hi typescriptVariableDeclaration gui=NONE guifg=#B058B0 guibg=NONE
hi link typescriptVariableDeclaration LocalVariable
hi typescriptObjectLabel gui=ITALIC guifg=#987FB0 guibg=NONE
hi typescriptEndColons gui=NONE guifg=#475866 guibg=NONE
hi typescriptIdentifierName gui=NONE guifg=#B08686 guibg=NONE
hi typescriptPropertySignature gui=NONE guifg=#9782AB guibg=NONE

hi link typescriptBraces Statement

hi link typescriptRestOrSpread Operator
hi link typescriptObjectSpread Operator
hi link typescriptDotNotation Operator
hi link typescriptOpSymbols Operator
hi link typescriptLogicSymbols Operator
hi link typescriptOperator Operator
hi link typescriptOptionalMark Operator

" Rust
" defined by rust.vim
hi link rustIdentifier typescriptIdentifierName

" Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier 
hi link javaCommentTitle      javaDocSeeTag 
hi link javaDocTags           javaDocSeeTag 
hi link javaDocParam          javaDocSeeTag 
hi link javaDocSeeTagParam    javaDocSeeTag 

hi  javaDocSeeTag guifg=#CCCCCC guibg=NONE gui=NONE
hi  javaDocSeeTag guifg=#CCCCCC guibg=NONE gui=NONE
"hi javaClassDecl guifg=#CCFFCC guibg=NONE gui=NONE

" XML
hi link xmlTag          Keyword 
hi link xmlTagName      Conditional 
hi link xmlEndTag       Identifier 

" HTML
hi htmlH1 guifg=#de675c   gui=underline
hi htmlLink guifg=#c777ff gui=underline
hi link htmlTag         Keyword
hi link htmlEndTag      Keyword 
hi link htmlTagName     Conditional 
hi link htmlH2          htmlH1
hi link htmlH3          htmlH1
hi link htmlH4          htmlH1

" CSS
hi cssTagName guifg=#70a8dd gui=BOLD
hi cssBoxProp guifg=#d0af76  gui=NONE
hi link cssColorProp cssBoxProp
hi link cssFontProp cssBoxProp
hi link cssTextProp cssBoxProp
hi cssPseudoClassId guifg=#9ccfdd gui=italic
hi cssIdentifier    guifg=#a2ddb8 gui=italic

" Markdown
hi markdownUrl guifg=#e48944
hi markdownCode guifg=#a7bee4 gui=BOLD
hi markdownCodeBlock guifg=#c5b1e4

" Javascript
hi javaScriptBrowserObjects       guifg=#DBB6D2      gui=italic

hi javaScriptDOMObjects           guifg=#DBB6D2      gui=BOLD
hi javaScriptDOMMethods           guifg=#D4FA9B
hi link javaScriptDOMProperties Keyword

hi javaScriptAjaxObjects          guifg=#5d91d3      gui=underline
hi javaScriptAjaxMethods          guifg=#6699CC
hi javaScriptAjaxProperties       guifg=#FF9494

hi javaScriptFuncName             guifg=#B5E4F7
hi javaScriptHtmlElemProperties   guifg=#FF9494
hi javaScriptEventListenerKeyword guifg=#6699CC

hi link javaScriptNumber      Number 
hi link javaScriptPropietaryObjects javaScriptAjaxObjects

" CoffeeScript
hi coffeeSpecialVar gui=NONE guifg=#edc37c guibg=NONE

" fugitive (via vim-git plugin)
hi link gitcommitSummary Conditional
hi link gitcommitOverflow Error
hi gitcommitFile guifg=#e8e8e8 guibg=NONE

" hi diffAdded     gui=NONE guifg=#dadada guibg=#063408
hi diffAdded     gui=NONE guifg=#26a938 guibg=#141414
hi diffRemoved   gui=NONE guifg=#8A4D4D guibg=#400707

" Highlights for interesting words, see
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
" TODO all of these need to be changed
hi def InterestingWord1 guifg=#000000 guibg=#C6ACC6
hi def InterestingWord2 guifg=#000000 guibg=#b88853
hi def InterestingWord3 guifg=#000000 guibg=#ffa724
hi def InterestingWord4 guifg=#000000 guibg=#994D73
hi def InterestingWord5 guifg=#000000 guibg=#acdd82
hi def InterestingWord6 guifg=#000000 guibg=#79A9A9

" Highlights for vim-sneak
hi SneakPluginTarget gui=BOLD guifg=#000000 guibg=#ffa8ff
hi SneakPluginScope  guifg=NONE guibg=#8a8a8a

" Highlights for NeoMake
hi link NeomakeWarningSign WarningMsg
hi link NeomakeErrorSign ErrorMsg

" Highlights for ALE
" hi ALEErrorLine gui=NONE guifg=NONE guibg=#1C1015
hi ALEErrorLine gui=NONE guifg=NONE guibg=#1F1117
hi ALEWarningLine gui=NONE guifg=NONE guibg=#11161F
hi link ALEError SpellBad
hi link ALEWarning SpellLocal
hi link ALEInfo SpellLocal

hi AleErrorSign gui=BOLD guifg=#cea662 guibg=#0b000e
hi AleWarningSign gui=BOLD guifg=#B058B0 guibg=#0b000e
hi AleInfoSign gui=BOLD guifg=#587BB0 guibg=#0b000e

" Highlights for fidget.nvim
hi link FidgetTitle Variable

" Highlights for nvim-lspconfig

hi LspDefault gui=ITALIC guifg=#4D4347 guibg=#181214
hi LspWarn gui=ITALIC guifg=#997A45 guibg=#181214
hi LspError gui=ITALIC guifg=#9B4662 guibg=#181214

hi LspDefaultSign gui=ITALIC guifg=#4D4347 guibg=#0b000e
hi LspWarnSign gui=ITALIC guifg=#997A45 guibg=#0b000e
hi LspErrorSign gui=ITALIC guifg=#9B4662 guibg=#0b000e

hi link DiagnosticError LspError
hi link DiagnosticWarn LspWarn
hi link DiagnosticInfo LspDefault
hi link DiagnosticHint LspDefault

hi link DiagnosticVirtualTextError LspError
hi link DiagnosticVirtualTextWarn LspWarn
hi link DiagnosticVirtualTextInfo LspDefault
hi link DiagnosticVirtualTextHint LspDefault

hi link DiagnosticVirtualLinesError LspError
hi link DiagnosticVirtualLinesWarn LspWarn
hi link DiagnosticVirtualLinesInfo LspDefault
hi link DiagnosticVirtualLinesHint LspDefault

hi link DiagnosticsDefaultUnderlineError LspError
hi link DiagnosticsDefaultUnderlineWarning LspWarn
hi link DiagnosticsDefaultUnderlineInformation LspDefault
hi link DiagnosticsDefaultUnderlineHint LspDefault

hi link DiagnosticsDefaultFloatingError LspError
hi link DiagnosticsDefaultFloatingWarning LspWarn
hi link DiagnosticsDefaultFloatingInformation LspDefault
hi link DiagnosticsDefaultFloatingHint LspDefault

hi link DiagnosticsDefaultSignError LspErrorSign
hi link DiagnosticsDefaultSignWarning LspWarnSign
hi link DiagnosticsDefaultSignInformation LspDefaultSign
hi link DiagnosticsDefaultSignHint LspDefaultSign

hi! link @variable Identifier
hi! link @diff.plus DiffAdd
hi! link @diff.minus DiffDelete
hi! link @diff.delta DiffChange

" hi link LspCodeLens LspDefault

" Rainbow Delimiters colors.
hi RainbowDelimiterRed     guifg=#A77990 guibg=NONE
hi RainbowDelimiterYellow  guifg=#8DC4C4 guibg=NONE
hi RainbowDelimiterBlue    guifg=#C6ACC6 guibg=NONE
hi RainbowDelimiterOrange  guifg=#ADBCA0 guibg=NONE
hi RainbowDelimiterGreen   guifg=#A2B1C1 guibg=NONE
hi RainbowDelimiterViolet  guifg=#C6A0B3 guibg=NONE
hi RainbowDelimiterCyan    guifg=#98A7B7 guibg=NONE
hi RainbowDelimiterOne     guifg=#7B907C guibg=NONE
hi RainbowDelimiterTwo     guifg=#B7AB9B guibg=NONE
hi RainbowDelimiterThree   guifg=#96C1AC guibg=NONE
hi RainbowDelimiterFour    guifg=#79A9A9 guibg=NONE
hi RainbowDelimiterFive    guifg=#96838D guibg=NONE
hi RainbowDelimiterSix     guifg=#C6A890 guibg=NONE

" Neovim Terminal Colors
" Defaults, useful when modifying colors
" let g:terminal_color_0 = "#000000" " black
" let g:terminal_color_1 = "#800000" " d red
" let g:terminal_color_2 = "#008000" " d green
" let g:terminal_color_3 = "#808000" " d yellow
" let g:terminal_color_4 = "#000080" " d blue
" let g:terminal_color_5 = "#800080" " d magenta
" let g:terminal_color_6 = "#008080" " d cyan
" let g:terminal_color_7 = "#c0c0c0" " d white
" let g:terminal_color_8 = "#808080" " gray
" let g:terminal_color_9 = "#ff0000" " red
" let g:terminal_color_10 = "#00ff00" " green
" let g:terminal_color_11 = "#ffff00" " yellow
" let g:terminal_color_12 = "#0000ff" " blue
" let g:terminal_color_13 = "#ff00ff" " magenta
" let g:terminal_color_14 = "#00ffff" " cyan
" let g:terminal_color_15 = "#ffffff" " white

let g:terminal_color_0 = "#0b000e" " black
let g:terminal_color_1 = "#400707" " d red
let g:terminal_color_2 = "#00a0a0" " d green
let g:terminal_color_3 = "#cf8f53" " d yellow
" let g:terminal_color_4 = "#47007D" " d blue
" let g:terminal_color_4 = "#b058b0" " d blue
let g:terminal_color_4 = "#876b99" " d blue
let g:terminal_color_5 = "#b058b0" " d magenta
let g:terminal_color_6 = "#6699cc" " d cyan
let g:terminal_color_7 = "#d8d8d8" " d white
let g:terminal_color_8 = "#707373" " gray
let g:terminal_color_9 = "#B00058" " red
let g:terminal_color_10 = "#60f0a8" " green
let g:terminal_color_11 = "#f2ca03" " yellow
let g:terminal_color_12 = "#cc99ff" " blue
let g:terminal_color_13 = "#ff80d0" " magenta
let g:terminal_color_14 = "#86bbee" " cyan
let g:terminal_color_15 = "#e8e8e8" " white

" let g:terminal_color_16 = "#"
" let g:terminal_color_17 = "#"
" let g:terminal_color_18 = "#"
" let g:terminal_color_19 = "#"
" let g:terminal_color_20 = "#"
" let g:terminal_color_21 = "#"
" let g:terminal_color_22 = "#"
" let g:terminal_color_23 = "#"
" let g:terminal_color_24 = "#"
" let g:terminal_color_25 = "#"
" let g:terminal_color_26 = "#"
" let g:terminal_color_27 = "#"

" lots more tiwddling available here:
" https://github.com/altercation/vim-colors-solarized/commit/7a7e5c8818d717084730133ed6b84a3ffc9d0447
