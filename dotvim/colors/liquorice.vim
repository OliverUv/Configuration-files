" Maintainer: Oliver Uvman, @OliverUv
" License: Public Domain, attribution appreciated.
" Last Changed: 2013-09-04
" Based on the neon theme by Tiza. Thanks Tiza! You got taste bro.
" Also some ideas taken from the theme nazca by Jose Elera Compana,
" who also has a super nice theme called gummybears.

" Located and updated at
" http://github.com/OliverUv/Configuration-files/blob/master/dotvim/colors/liquorice.vim

" I recommend using the following colors, in order, if you're using a
" rainbow parens plugin:
" '#A77990', '#8DC4C4', '#C6ACC6', '#ADBCA0', '#A2B1C1', '#C6A0B3',
" '#'#98A7B7', 7B907C', '#B7AB9B', '#96C1AC', '#79A9A9', '#96838D',
" '#'#C6A890'
"
" (I personally recommend https://github.com/luochen1990/rainbow)
" TODO: Figure out a way to get these colors, to work in 256-color
" terminals using CSApprox.

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

let colors_name = "liquorice"

hi Normal       guifg=#eaeaea guibg=#141414

" Search
hi IncSearch    gui=BOLD guifg=#ffffff guibg=#99004c
hi Search       gui=BOLD guifg=#cc99ff guibg=#430075

" Messages
hi ErrorMsg     gui=BOLD guifg=#ff80c0 guibg=NONE
hi WarningMsg   gui=BOLD guifg=#ff80c0 guibg=NONE
hi ModeMsg      gui=BOLD guifg=#a0d0ff guibg=NONE
hi MoreMsg      gui=BOLD guifg=#70ffc0 guibg=#8040ff
hi Question     gui=BOLD guifg=#e8e800 guibg=NONE

" Split area
hi StatusLine   gui=NONE guifg=#d6d6d6 guibg=#602040
hi StatusLineNC gui=NONE guifg=#000000 guibg=#808080
hi VertSplit    gui=NONE guifg=#909090 guibg=#111111
hi WildMenu     gui=NONE guifg=#000000 guibg=#ff80c0

" Tab bar
hi TabLineFill  gui=NONE guifg=#000000 guibg=#111111
hi TabLine      gui=NONE guifg=#8a8a8a guibg=#121212
hi TabLineSel   gui=NONE guifg=#d6d6d6 guibg=#602040
" These are custom colors, for tab numbers used with the gt command
hi TabNumber    gui=NONE guifg=#ffa8ff guibg=#121212
hi TabNumberSel gui=NONE guifg=#ffa8ff guibg=#602040

" Diff
hi DiffText     gui=BOLD guifg=NONE guibg=#1f1500
hi DiffChange   gui=NONE guifg=#f0f0f0 guibg=#573700
hi DiffDelete   gui=NONE guifg=#701D1D guibg=#701D1D
hi DiffAdd      gui=NONE guifg=NONE guibg=#064D08

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
hi CursorLine   gui=NONE guifg=NONE    guibg=#0f0f0f
hi CursorColumn gui=NONE guifg=NONE    guibg=#0f0f0f

" Fold
hi Folded       gui=NONE guifg=#c8c8c8 guibg=#0c0c0c
hi FoldColumn   gui=NONE guifg=#c8c8c8 guibg=#212121

" vim-indent-guides
hi IndentGuidesOdd  gui=NONE guifg=NONE guibg=#0a0a0a
hi IndentGuidesEven gui=NONE guifg=NONE guibg=#0d0d0d

" Signs
hi SignColumn   gui=NONE guifg=#f0f0f0 guibg=#0e0e0e

" ColorColumn
hi ColorColumn   gui=NONE guifg=NONE guibg=#000000

" Spelling - SpellCap (and maybe others) also used by Syntastic
hi SpellLocal	gui=UNDERCURL guifg=NONE guibg=NONE guisp=#FF99CC
hi SpellCap	gui=UNDERCURL guifg=NONE guibg=NONE guisp=#00FF00
hi SpellBad	gui=UNDERCURL guifg=NONE guibg=NONE guisp=#FF0000

" Other
hi Directory    gui=NONE guifg=#c8c8ff guibg=NONE
hi LineNr       gui=ITALIC guifg=#727272 guibg=#0e0e0e
hi CursorLineNr gui=ITALIC,BOLD guifg=#0e0e0e guibg=#99004c
"hi NonText      gui=BOLD guifg=#d84070 guibg=#0b0b0b
"hi SpecialKey   gui=BOLD guifg=#8888ff guibg=NONE
hi NonText      gui=BOLD guifg=#808080 guibg=NONE
hi SpecialKey   gui=BOLD guifg=#808080 guibg=NONE
hi Title        gui=NONE guifg=#d0d0d0 guibg=NONE
hi Visual       gui=NONE guifg=NONE guibg=#7C2B7C
hi VisualNOS    gui=NONE guifg=NONE guibg=#7C2B7C

" Syntax group
hi Comment      gui=NONE guifg=#8a8a8a guibg=NONE
hi Error        gui=BOLD guifg=#f2ca03 guibg=#000000
hi Identifier   gui=NONE guifg=#40f8f8 guibg=NONE
hi Ignore       gui=NONE guifg=bg      guibg=NONE
hi PreProc      gui=NONE guifg=#ffa8ff guibg=NONE
hi Constant     gui=NONE guifg=#f8bef8 guibg=NONE
hi Special      gui=NONE guifg=#ff9a4c guibg=#0f0f0f
hi Statement    gui=NONE guifg=#6699cc guibg=NONE
hi Repeat       gui=BOLD guifg=#6699cc guibg=NONE
hi Todo         gui=UNDERLINE,ITALIC guifg=#ff80d0 guibg=NONE
hi Type         gui=NONE guifg=#60f0a8 guibg=NONE
hi Underlined   gui=UNDERLINE guifg=fg guibg=NONE
hi String       gui=NONE guifg=#bccf72 guibg=#0f0f0f
hi Number       gui=NONE guifg=#acdd82 guibg=NONE
hi Conditional  gui=BOLD guifg=#86bbee guibg=NONE
hi Boolean      gui=NONE guifg=#86bbee guibg=NONE
hi Function     gui=NONE guifg=#CCA670 guibg=NONE
hi Delimiter    gui=NONE guifg=#00a0a0 guibg=NONE
hi Operator     gui=NONE guifg=#86bbee guibg=NONE

" TagHighlight plugin colors ( https://github.com/abudden/taghighlight-automirror )
" hi link to from
hi link Class Type
hi link DefinedName PreProc
hi link Enumerator Constant
hi link EnumerationName String
hi link Union Constant
hi link GlobalConstant Constant
hi link GlobalVariable Special
hi Member gui=NONE guifg=#ffd7ab guibg=NONE
hi LocalVariable gui=NONE guifg=#ff0000 guibg=NONE


" Dependent syntax groups
hi link Character       String
hi link Float           Number
hi link Label           Statement
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

" Special for Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier 
hi link javaCommentTitle      javaDocSeeTag 
hi link javaDocTags           javaDocSeeTag 
hi link javaDocParam          javaDocSeeTag 
hi link javaDocSeeTagParam    javaDocSeeTag 

hi  javaDocSeeTag guifg=#CCCCCC guibg=NONE gui=NONE
hi  javaDocSeeTag guifg=#CCCCCC guibg=NONE gui=NONE
"hi javaClassDecl guifg=#CCFFCC guibg=NONE gui=NONE

" Special for XML
hi link xmlTag          Keyword 
hi link xmlTagName      Conditional 
hi link xmlEndTag       Identifier 

" Special for HTML
hi htmlH1 guifg=#de675c   gui=underline
hi htmlLink guifg=#c777ff gui=underline
hi link htmlTag         Keyword
hi link htmlEndTag      Keyword 
hi link htmlTagName     Conditional 
hi link htmlH2          htmlH1
hi link htmlH3          htmlH1
hi link htmlH4          htmlH1

" Special for CSS
hi cssTagName guifg=#70a8dd gui=BOLD
hi cssBoxProp guifg=#d0af76  gui=NONE
hi link cssColorProp cssBoxProp
hi link cssFontProp cssBoxProp
hi link cssTextProp cssBoxProp
hi cssPseudoClassId guifg=#9ccfdd gui=italic
hi cssIdentifier    guifg=#a2ddb8 gui=italic

" Special for Markdown
hi markdownUrl guifg=#e48944
hi markdownCode guifg=#a7bee4 gui=BOLD
hi markdownCodeBlock guifg=#c5b1e4

" Special for Javascript
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

" Special for CoffeeScript
hi coffeeSpecialVar gui=NONE guifg=#edc37c guibg=NONE

" Special for fugitive (via vim-git plugin)
hi link gitcommitSummary Conditional
hi link gitcommitOverflow Error
hi gitcommitFile guifg=#e8e8e8 guibg=NONE

" Highlights for interesting words, see
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
hi def InterestingWord1 guifg=#000000 guibg=#C6ACC6
hi def InterestingWord2 guifg=#000000 guibg=#b88853
hi def InterestingWord3 guifg=#000000 guibg=#ffa724
hi def InterestingWord4 guifg=#000000 guibg=#A77990
hi def InterestingWord5 guifg=#000000 guibg=#acdd82
hi def InterestingWord6 guifg=#000000 guibg=#79A9A9

" Highlights for vim-sneak
hi SneakPluginTarget gui=BOLD guifg=#000000 guibg=#ffa8ff
hi SneakPluginScope  guifg=NONE guibg=#8a8a8a

" lots more tiwddling available here:
" https://github.com/altercation/vim-colors-solarized/commit/7a7e5c8818d717084730133ed6b84a3ffc9d0447

" Tabline setting to make use of the TabNumber[Sel] highlights above:
" function! MyTabLine()
"   let s = '' " complete tabline goes here
"   " loop through each tab page
"   for t in range(tabpagenr('$'))
" 
"     " select the highlighting for the buffer names
"     if t + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
"     
"     " empty space
"     let s .= ' '
" 
"     " set the tab page number (for mouse clicks)
"     let s .= '%' . (t + 1) . 'T'
" 
"     " set page number string, with color
"     if t + 1 == tabpagenr()
"       let s .= '%#TabNumberSel#'
"     else
"       let s .= '%#TabNumber#'
"     endif
"     let s .= t + 1
"     
"     " select the highlighting for the buffer names again
"     if t + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
" 
"     " get buffer names and statuses
"     let n = ''  "temp string for buffer names while we loop and check buftype
"     let m = 0 " &modified counter
"     let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
"     " loop through each buffer in a tab
"     for b in tabpagebuflist(t + 1)[:0] " Actually just the first buffer in it
"       " buffer types: quickfix gets a [Q], help gets [H]{base fname}
"       " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
"       if getbufvar( b, "&buftype" ) == 'help'
"         let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
"       elseif getbufvar( b, "&buftype" ) == 'quickfix'
"         let n .= '[Q]'
"       else
"         let n .= pathshorten(bufname(b))
"         "let n .= bufname(b)
"       endif
"       " check and ++ tab's &modified count
"       if getbufvar( b, "&modified" )
"         let m += 1
"       endif
"       " no final ' ' added...formatting looks better done later
"       if bc > 1
"         let n .= ' '
"       endif
"       let bc -= 1
"     endfor
"     " add modified label [n+] where n pages in tab are modified
"     if m > 0
"       "let s .= '[' . m . '+]'
"       let s.= '+ '
"     endif
"     " add buffer names
"     if n == ''
"       let s .= '[No Name]'
"     else
"       let s .= n
"     endif
"     " switch to no underlining and add final space to buffer list
"     "let s .= '%#TabLineSel#' . ' '
"     let s .= ' '
"   endfor
"   " after the last tab fill with TabLineFill and reset tab page nr
"   let s .= '%#TabLineFill#%T'
"   " right-align the label to close the current tab page
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLine#%999XX'
"   endif
"   return s
" endfunction
" set tabline=%!MyTabLine()
