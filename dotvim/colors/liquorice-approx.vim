" This scheme was created by CSApproxSnapshot
" on Fri, 30 Mar 2018

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

function! s:old_kde()
  " Konsole only used its own palette up til KDE 4.2.0
  if executable('kde4-config') && system('kde4-config --kde-version') =~ '^4.[10].'
    return 1
  elseif executable('kde-config') && system('kde-config --version') =~# 'KDE: 3.'
    return 1
  else
    return 0
  endif
endfunction

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || (&term =~? "^konsole" && s:old_kde())
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=144 gui=NONE guibg=#181214 guifg=#b0a197
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=#e8e8e8
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=233 ctermfg=35 gui=NONE guibg=#141414 guifg=#26a938
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=#400707 guifg=#8a4d4d
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=182 ctermfg=16 gui=NONE guibg=#c6acc6 guifg=#000000
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=137 ctermfg=16 gui=NONE guibg=#b88853 guifg=#000000
    CSAHi typescriptPropertySignature term=NONE cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#9782ab
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=95 ctermfg=16 gui=NONE guibg=#994d73 guifg=#000000
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#acdd82 guifg=#000000
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#b058b0
    CSAHi MatchParen term=NONE cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#146666 guifg=#ffffff
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=233 ctermfg=219 gui=NONE guibg=#121212 guifg=#ffa8ff
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=53 ctermfg=219 gui=NONE guibg=#602040 guifg=#ffa8ff
    CSAHi TabModified term=bold cterm=bold ctermbg=233 ctermfg=219 gui=bold guibg=#121212 guifg=#ffa8ff
    CSAHi TabModifiedSel term=bold cterm=bold ctermbg=53 ctermfg=219 gui=bold guibg=#602040 guifg=#ffb0ff
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f141c guifg=fg
    CSAHi Special term=NONE cterm=NONE ctermbg=232 ctermfg=173 gui=NONE guibg=#0a0a0a guifg=#cf8f53
    CSAHi typescriptEndColons term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#475866
    CSAHi Statement term=NONE cterm=NONE ctermbg=16 ctermfg=68 gui=NONE guibg=#0f080b guifg=#6699cc
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi TermCursor term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi TermCursorNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#3c3438
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#cea662
    CSAHi IncSearch term=bold cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=bold cterm=bold ctermbg=54 ctermfg=177 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#cea662
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=italic guibg=bg guifg=#a2ddb8
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e48944
    CSAHi markdownCode term=bold cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#a7bee4
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#c5b1e4
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=italic guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMObjects term=bold cterm=bold ctermbg=bg ctermfg=182 gui=bold guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#d4fa9b
    CSAHi Constant term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#f8bef8
    CSAHi Conceal term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi SpellBad term=NONE cterm=NONE ctermbg=52 ctermfg=196 gui=NONE guibg=#400707 guifg=#b5a586 guisp=#ff0000
    CSAHi SpellCap term=undercurl cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=undercurl cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=NONE cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#071e40 guifg=#8cb586 guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=230 gui=NONE guibg=#303030 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#f6f3e8
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#8a8a8a guifg=#000000
    CSAHi TabLine term=NONE cterm=NONE ctermbg=16 ctermfg=245 gui=NONE guibg=#120c14 guifg=#8a8a8a
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=#ffa724 guifg=#000000
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00a0a0
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=109 ctermfg=16 gui=NONE guibg=#79a9a9 guifg=#000000
    CSAHi SneakPluginTarget term=bold cterm=bold ctermbg=219 ctermfg=16 gui=bold guibg=#ffa8ff guifg=#000000
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=245 ctermfg=fg gui=NONE guibg=#8a8a8a guifg=fg
    CSAHi ALEErrorLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f1117 guifg=fg
    CSAHi ALEWarningLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#11161f guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=italic guibg=bg guifg=#9ccfdd
    CSAHi htmlH1 term=underline cterm=underline ctermbg=bg ctermfg=167 gui=underline guibg=bg guifg=#de675c
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0f080b guifg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#707373
    CSAHi Error term=bold cterm=bold ctermbg=16 ctermfg=220 gui=bold guibg=#000000 guifg=#f2ca03
    CSAHi Identifier term=NONE cterm=NONE ctermbg=bg ctermfg=140 gui=NONE guibg=bg guifg=#b085e1
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#181214
    CSAHi PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=99 ctermfg=85 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=italic guibg=#0b000e guifg=#4d4347
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=89 ctermfg=233 gui=bold,italic guibg=#99004c guifg=#0e0e0e
    CSAHi Question term=bold cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=59 ctermfg=188 gui=italic guibg=#37323b guifg=#d6d6d6
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=16 ctermfg=101 gui=italic guibg=#2c272e guifg=#998b73
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=#120c14 guifg=#909090
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#d0d0d0
    CSAHi Visual term=NONE cterm=NONE ctermbg=53 ctermfg=fg gui=NONE guibg=#4d1c4d guifg=fg
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b5e4f7
    CSAHi javaScriptAjaxObjects term=underline cterm=underline ctermbg=bg ctermfg=68 gui=underline guibg=bg guifg=#5d91d3
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi typescriptVariableDeclaration term=NONE cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#b058b0
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#edc37c
    CSAHi Label term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=#0f080b guifg=#987fb0
    CSAHi typescriptObjectLabel term=NONE cterm=NONE ctermbg=bg ctermfg=103 gui=italic guibg=bg guifg=#987fb0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi typescriptIdentifierName term=NONE cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=#b08686
    CSAHi TabLineSel term=NONE cterm=NONE ctermbg=53 ctermfg=188 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#120c14 guifg=#000000
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi CursorLine term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi ColorColumn term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi NormalNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Cursor term=bold cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi AleErrorSign term=bold cterm=bold ctermbg=16 ctermfg=179 gui=bold guibg=#0b000e guifg=#cea662
    CSAHi AleWarningSign term=bold cterm=bold ctermbg=16 ctermfg=133 gui=bold guibg=#0b000e guifg=#b058b0
    CSAHi AleInfoSign term=bold cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#0b000e guifg=#587bb0
    CSAHi htmlLink term=underline cterm=underline ctermbg=bg ctermfg=177 gui=underline guibg=bg guifg=#c777ff
    CSAHi cssTagName term=bold cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#70a8dd
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#d0af76
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffd7ab
    CSAHi Repeat term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#6699cc
    CSAHi Todo term=underline cterm=underline ctermbg=bg ctermfg=212 gui=italic,underline guibg=bg guifg=#ff80d0
    CSAHi Type term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=144 gui=underline guibg=bg guifg=#b0a197
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=96 gui=NONE guibg=#231a23 guifg=#876b99
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#acdd82
    CSAHi Conditional term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#86bbee
    CSAHi VisualNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi WarningMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#cea662
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=211 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=179 gui=NONE guibg=#0b000e guifg=#cea662
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=251 gui=NONE guibg=#0b000e guifg=#c8c8c8
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#042806 guifg=fg
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=58 ctermfg=144 gui=NONE guibg=#4a3000 guifg=#b5a586
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#400707 guifg=#440606
    CSAHi DiffText term=bold cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=#1f1500 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#0b000e guifg=#f0f0f0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=144 gui=NONE guibg=#181214 guifg=#b0a197
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=#e8e8e8
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=233 ctermfg=35 gui=NONE guibg=#141414 guifg=#26a938
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=#400707 guifg=#8a4d4d
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=182 ctermfg=16 gui=NONE guibg=#c6acc6 guifg=#000000
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=137 ctermfg=16 gui=NONE guibg=#b88853 guifg=#000000
    CSAHi typescriptPropertySignature term=NONE cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#9782ab
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=95 ctermfg=16 gui=NONE guibg=#994d73 guifg=#000000
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#acdd82 guifg=#000000
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#b058b0
    CSAHi MatchParen term=NONE cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#146666 guifg=#ffffff
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=233 ctermfg=219 gui=NONE guibg=#121212 guifg=#ffa8ff
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=53 ctermfg=219 gui=NONE guibg=#602040 guifg=#ffa8ff
    CSAHi TabModified term=bold cterm=bold ctermbg=233 ctermfg=219 gui=bold guibg=#121212 guifg=#ffa8ff
    CSAHi TabModifiedSel term=bold cterm=bold ctermbg=53 ctermfg=219 gui=bold guibg=#602040 guifg=#ffb0ff
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f141c guifg=fg
    CSAHi Special term=NONE cterm=NONE ctermbg=232 ctermfg=173 gui=NONE guibg=#0a0a0a guifg=#cf8f53
    CSAHi typescriptEndColons term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#475866
    CSAHi Statement term=NONE cterm=NONE ctermbg=16 ctermfg=68 gui=NONE guibg=#0f080b guifg=#6699cc
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi TermCursor term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi TermCursorNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#3c3438
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#cea662
    CSAHi IncSearch term=bold cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=bold cterm=bold ctermbg=54 ctermfg=177 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#cea662
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=italic guibg=bg guifg=#a2ddb8
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e48944
    CSAHi markdownCode term=bold cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#a7bee4
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#c5b1e4
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=italic guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMObjects term=bold cterm=bold ctermbg=bg ctermfg=182 gui=bold guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#d4fa9b
    CSAHi Constant term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#f8bef8
    CSAHi Conceal term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi SpellBad term=NONE cterm=NONE ctermbg=52 ctermfg=196 gui=NONE guibg=#400707 guifg=#b5a586 guisp=#ff0000
    CSAHi SpellCap term=undercurl cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=undercurl cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=NONE cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#071e40 guifg=#8cb586 guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=230 gui=NONE guibg=#303030 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#f6f3e8
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#8a8a8a guifg=#000000
    CSAHi TabLine term=NONE cterm=NONE ctermbg=16 ctermfg=245 gui=NONE guibg=#120c14 guifg=#8a8a8a
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=#ffa724 guifg=#000000
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00a0a0
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=109 ctermfg=16 gui=NONE guibg=#79a9a9 guifg=#000000
    CSAHi SneakPluginTarget term=bold cterm=bold ctermbg=219 ctermfg=16 gui=bold guibg=#ffa8ff guifg=#000000
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=245 ctermfg=fg gui=NONE guibg=#8a8a8a guifg=fg
    CSAHi ALEErrorLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f1117 guifg=fg
    CSAHi ALEWarningLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#11161f guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=italic guibg=bg guifg=#9ccfdd
    CSAHi htmlH1 term=underline cterm=underline ctermbg=bg ctermfg=167 gui=underline guibg=bg guifg=#de675c
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0f080b guifg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#707373
    CSAHi Error term=bold cterm=bold ctermbg=16 ctermfg=220 gui=bold guibg=#000000 guifg=#f2ca03
    CSAHi Identifier term=NONE cterm=NONE ctermbg=bg ctermfg=140 gui=NONE guibg=bg guifg=#b085e1
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#181214
    CSAHi PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=99 ctermfg=85 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=italic guibg=#0b000e guifg=#4d4347
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=89 ctermfg=233 gui=bold,italic guibg=#99004c guifg=#0e0e0e
    CSAHi Question term=bold cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=59 ctermfg=188 gui=italic guibg=#37323b guifg=#d6d6d6
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=16 ctermfg=101 gui=italic guibg=#2c272e guifg=#998b73
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=#120c14 guifg=#909090
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#d0d0d0
    CSAHi Visual term=NONE cterm=NONE ctermbg=53 ctermfg=fg gui=NONE guibg=#4d1c4d guifg=fg
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b5e4f7
    CSAHi javaScriptAjaxObjects term=underline cterm=underline ctermbg=bg ctermfg=68 gui=underline guibg=bg guifg=#5d91d3
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi typescriptVariableDeclaration term=NONE cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#b058b0
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#edc37c
    CSAHi Label term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=#0f080b guifg=#987fb0
    CSAHi typescriptObjectLabel term=NONE cterm=NONE ctermbg=bg ctermfg=103 gui=italic guibg=bg guifg=#987fb0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi typescriptIdentifierName term=NONE cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=#b08686
    CSAHi TabLineSel term=NONE cterm=NONE ctermbg=53 ctermfg=188 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#120c14 guifg=#000000
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi CursorLine term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi ColorColumn term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi NormalNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Cursor term=bold cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi AleErrorSign term=bold cterm=bold ctermbg=16 ctermfg=179 gui=bold guibg=#0b000e guifg=#cea662
    CSAHi AleWarningSign term=bold cterm=bold ctermbg=16 ctermfg=133 gui=bold guibg=#0b000e guifg=#b058b0
    CSAHi AleInfoSign term=bold cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#0b000e guifg=#587bb0
    CSAHi htmlLink term=underline cterm=underline ctermbg=bg ctermfg=177 gui=underline guibg=bg guifg=#c777ff
    CSAHi cssTagName term=bold cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#70a8dd
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#d0af76
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffd7ab
    CSAHi Repeat term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#6699cc
    CSAHi Todo term=underline cterm=underline ctermbg=bg ctermfg=212 gui=italic,underline guibg=bg guifg=#ff80d0
    CSAHi Type term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=144 gui=underline guibg=bg guifg=#b0a197
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=96 gui=NONE guibg=#231a23 guifg=#876b99
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#acdd82
    CSAHi Conditional term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#86bbee
    CSAHi VisualNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi WarningMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#cea662
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=211 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=179 gui=NONE guibg=#0b000e guifg=#cea662
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=251 gui=NONE guibg=#0b000e guifg=#c8c8c8
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#042806 guifg=fg
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=58 ctermfg=144 gui=NONE guibg=#4a3000 guifg=#b5a586
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#400707 guifg=#440606
    CSAHi DiffText term=bold cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=#1f1500 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#0b000e guifg=#f0f0f0
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=144 gui=NONE guibg=#181214 guifg=#b0a197
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=#e8e8e8
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=233 ctermfg=35 gui=NONE guibg=#141414 guifg=#26a938
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=#400707 guifg=#8a4d4d
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=182 ctermfg=16 gui=NONE guibg=#c6acc6 guifg=#000000
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=137 ctermfg=16 gui=NONE guibg=#b88853 guifg=#000000
    CSAHi typescriptPropertySignature term=NONE cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#9782ab
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=95 ctermfg=16 gui=NONE guibg=#994d73 guifg=#000000
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#acdd82 guifg=#000000
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#b058b0
    CSAHi MatchParen term=NONE cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#146666 guifg=#ffffff
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=233 ctermfg=219 gui=NONE guibg=#121212 guifg=#ffa8ff
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=53 ctermfg=219 gui=NONE guibg=#602040 guifg=#ffa8ff
    CSAHi TabModified term=bold cterm=bold ctermbg=233 ctermfg=219 gui=bold guibg=#121212 guifg=#ffa8ff
    CSAHi TabModifiedSel term=bold cterm=bold ctermbg=53 ctermfg=219 gui=bold guibg=#602040 guifg=#ffb0ff
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f141c guifg=fg
    CSAHi Special term=NONE cterm=NONE ctermbg=232 ctermfg=173 gui=NONE guibg=#0a0a0a guifg=#cf8f53
    CSAHi typescriptEndColons term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#475866
    CSAHi Statement term=NONE cterm=NONE ctermbg=16 ctermfg=68 gui=NONE guibg=#0f080b guifg=#6699cc
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi TermCursor term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi TermCursorNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#3c3438
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#cea662
    CSAHi IncSearch term=bold cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=bold cterm=bold ctermbg=54 ctermfg=177 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#cea662
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=italic guibg=bg guifg=#a2ddb8
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e48944
    CSAHi markdownCode term=bold cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#a7bee4
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#c5b1e4
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=italic guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMObjects term=bold cterm=bold ctermbg=bg ctermfg=182 gui=bold guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#d4fa9b
    CSAHi Constant term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#f8bef8
    CSAHi Conceal term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi SpellBad term=NONE cterm=NONE ctermbg=52 ctermfg=196 gui=NONE guibg=#400707 guifg=#b5a586 guisp=#ff0000
    CSAHi SpellCap term=undercurl cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=undercurl cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=NONE cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#071e40 guifg=#8cb586 guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=230 gui=NONE guibg=#303030 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#f6f3e8
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#8a8a8a guifg=#000000
    CSAHi TabLine term=NONE cterm=NONE ctermbg=16 ctermfg=245 gui=NONE guibg=#120c14 guifg=#8a8a8a
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=#ffa724 guifg=#000000
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00a0a0
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=109 ctermfg=16 gui=NONE guibg=#79a9a9 guifg=#000000
    CSAHi SneakPluginTarget term=bold cterm=bold ctermbg=219 ctermfg=16 gui=bold guibg=#ffa8ff guifg=#000000
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=245 ctermfg=fg gui=NONE guibg=#8a8a8a guifg=fg
    CSAHi ALEErrorLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f1117 guifg=fg
    CSAHi ALEWarningLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#11161f guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=italic guibg=bg guifg=#9ccfdd
    CSAHi htmlH1 term=underline cterm=underline ctermbg=bg ctermfg=167 gui=underline guibg=bg guifg=#de675c
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0f080b guifg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#707373
    CSAHi Error term=bold cterm=bold ctermbg=16 ctermfg=220 gui=bold guibg=#000000 guifg=#f2ca03
    CSAHi Identifier term=NONE cterm=NONE ctermbg=bg ctermfg=140 gui=NONE guibg=bg guifg=#b085e1
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#181214
    CSAHi PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=99 ctermfg=85 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=italic guibg=#0b000e guifg=#4d4347
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=89 ctermfg=233 gui=bold,italic guibg=#99004c guifg=#0e0e0e
    CSAHi Question term=bold cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=59 ctermfg=188 gui=italic guibg=#37323b guifg=#d6d6d6
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=16 ctermfg=101 gui=italic guibg=#2c272e guifg=#998b73
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=#120c14 guifg=#909090
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#d0d0d0
    CSAHi Visual term=NONE cterm=NONE ctermbg=53 ctermfg=fg gui=NONE guibg=#4d1c4d guifg=fg
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b5e4f7
    CSAHi javaScriptAjaxObjects term=underline cterm=underline ctermbg=bg ctermfg=68 gui=underline guibg=bg guifg=#5d91d3
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi typescriptVariableDeclaration term=NONE cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#b058b0
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#edc37c
    CSAHi Label term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=#0f080b guifg=#987fb0
    CSAHi typescriptObjectLabel term=NONE cterm=NONE ctermbg=bg ctermfg=103 gui=italic guibg=bg guifg=#987fb0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi typescriptIdentifierName term=NONE cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=#b08686
    CSAHi TabLineSel term=NONE cterm=NONE ctermbg=53 ctermfg=188 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#120c14 guifg=#000000
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi CursorLine term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi ColorColumn term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi NormalNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Cursor term=bold cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi AleErrorSign term=bold cterm=bold ctermbg=16 ctermfg=179 gui=bold guibg=#0b000e guifg=#cea662
    CSAHi AleWarningSign term=bold cterm=bold ctermbg=16 ctermfg=133 gui=bold guibg=#0b000e guifg=#b058b0
    CSAHi AleInfoSign term=bold cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#0b000e guifg=#587bb0
    CSAHi htmlLink term=underline cterm=underline ctermbg=bg ctermfg=177 gui=underline guibg=bg guifg=#c777ff
    CSAHi cssTagName term=bold cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#70a8dd
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#d0af76
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffd7ab
    CSAHi Repeat term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#6699cc
    CSAHi Todo term=underline cterm=underline ctermbg=bg ctermfg=212 gui=italic,underline guibg=bg guifg=#ff80d0
    CSAHi Type term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=144 gui=underline guibg=bg guifg=#b0a197
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=96 gui=NONE guibg=#231a23 guifg=#876b99
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#acdd82
    CSAHi Conditional term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#86bbee
    CSAHi VisualNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi WarningMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#cea662
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=211 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=179 gui=NONE guibg=#0b000e guifg=#cea662
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=251 gui=NONE guibg=#0b000e guifg=#c8c8c8
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#042806 guifg=fg
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=58 ctermfg=144 gui=NONE guibg=#4a3000 guifg=#b5a586
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#400707 guifg=#440606
    CSAHi DiffText term=bold cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=#1f1500 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#0b000e guifg=#f0f0f0
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=144 gui=NONE guibg=#181214 guifg=#b0a197
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=#e8e8e8
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=233 ctermfg=35 gui=NONE guibg=#141414 guifg=#26a938
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=#400707 guifg=#8a4d4d
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=182 ctermfg=16 gui=NONE guibg=#c6acc6 guifg=#000000
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=137 ctermfg=16 gui=NONE guibg=#b88853 guifg=#000000
    CSAHi typescriptPropertySignature term=NONE cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#9782ab
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=95 ctermfg=16 gui=NONE guibg=#994d73 guifg=#000000
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#acdd82 guifg=#000000
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#b058b0
    CSAHi MatchParen term=NONE cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#146666 guifg=#ffffff
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=233 ctermfg=219 gui=NONE guibg=#121212 guifg=#ffa8ff
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=53 ctermfg=219 gui=NONE guibg=#602040 guifg=#ffa8ff
    CSAHi TabModified term=bold cterm=bold ctermbg=233 ctermfg=219 gui=bold guibg=#121212 guifg=#ffa8ff
    CSAHi TabModifiedSel term=bold cterm=bold ctermbg=53 ctermfg=219 gui=bold guibg=#602040 guifg=#ffb0ff
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f141c guifg=fg
    CSAHi Special term=NONE cterm=NONE ctermbg=232 ctermfg=173 gui=NONE guibg=#0a0a0a guifg=#cf8f53
    CSAHi typescriptEndColons term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#475866
    CSAHi Statement term=NONE cterm=NONE ctermbg=16 ctermfg=68 gui=NONE guibg=#0f080b guifg=#6699cc
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi TermCursor term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi TermCursorNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#3c3438
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#cea662
    CSAHi IncSearch term=bold cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=bold cterm=bold ctermbg=54 ctermfg=177 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#cea662
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=italic guibg=bg guifg=#a2ddb8
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e48944
    CSAHi markdownCode term=bold cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#a7bee4
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#c5b1e4
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=italic guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMObjects term=bold cterm=bold ctermbg=bg ctermfg=182 gui=bold guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#d4fa9b
    CSAHi Constant term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#f8bef8
    CSAHi Conceal term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi SpellBad term=NONE cterm=NONE ctermbg=52 ctermfg=196 gui=NONE guibg=#400707 guifg=#b5a586 guisp=#ff0000
    CSAHi SpellCap term=undercurl cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=undercurl cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=NONE cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#071e40 guifg=#8cb586 guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=230 gui=NONE guibg=#303030 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#f6f3e8
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#8a8a8a guifg=#000000
    CSAHi TabLine term=NONE cterm=NONE ctermbg=16 ctermfg=245 gui=NONE guibg=#120c14 guifg=#8a8a8a
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=#ffa724 guifg=#000000
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00a0a0
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=109 ctermfg=16 gui=NONE guibg=#79a9a9 guifg=#000000
    CSAHi SneakPluginTarget term=bold cterm=bold ctermbg=219 ctermfg=16 gui=bold guibg=#ffa8ff guifg=#000000
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=245 ctermfg=fg gui=NONE guibg=#8a8a8a guifg=fg
    CSAHi ALEErrorLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f1117 guifg=fg
    CSAHi ALEWarningLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#11161f guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=italic guibg=bg guifg=#9ccfdd
    CSAHi htmlH1 term=underline cterm=underline ctermbg=bg ctermfg=167 gui=underline guibg=bg guifg=#de675c
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0f080b guifg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#707373
    CSAHi Error term=bold cterm=bold ctermbg=16 ctermfg=220 gui=bold guibg=#000000 guifg=#f2ca03
    CSAHi Identifier term=NONE cterm=NONE ctermbg=bg ctermfg=140 gui=NONE guibg=bg guifg=#b085e1
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#181214
    CSAHi PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=99 ctermfg=85 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=italic guibg=#0b000e guifg=#4d4347
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=89 ctermfg=233 gui=bold,italic guibg=#99004c guifg=#0e0e0e
    CSAHi Question term=bold cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=59 ctermfg=188 gui=italic guibg=#37323b guifg=#d6d6d6
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=16 ctermfg=101 gui=italic guibg=#2c272e guifg=#998b73
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=#120c14 guifg=#909090
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#d0d0d0
    CSAHi Visual term=NONE cterm=NONE ctermbg=53 ctermfg=fg gui=NONE guibg=#4d1c4d guifg=fg
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b5e4f7
    CSAHi javaScriptAjaxObjects term=underline cterm=underline ctermbg=bg ctermfg=68 gui=underline guibg=bg guifg=#5d91d3
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi typescriptVariableDeclaration term=NONE cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#b058b0
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#edc37c
    CSAHi Label term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=#0f080b guifg=#987fb0
    CSAHi typescriptObjectLabel term=NONE cterm=NONE ctermbg=bg ctermfg=103 gui=italic guibg=bg guifg=#987fb0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi typescriptIdentifierName term=NONE cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=#b08686
    CSAHi TabLineSel term=NONE cterm=NONE ctermbg=53 ctermfg=188 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#120c14 guifg=#000000
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi CursorLine term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi ColorColumn term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi NormalNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Cursor term=bold cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi AleErrorSign term=bold cterm=bold ctermbg=16 ctermfg=179 gui=bold guibg=#0b000e guifg=#cea662
    CSAHi AleWarningSign term=bold cterm=bold ctermbg=16 ctermfg=133 gui=bold guibg=#0b000e guifg=#b058b0
    CSAHi AleInfoSign term=bold cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#0b000e guifg=#587bb0
    CSAHi htmlLink term=underline cterm=underline ctermbg=bg ctermfg=177 gui=underline guibg=bg guifg=#c777ff
    CSAHi cssTagName term=bold cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#70a8dd
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#d0af76
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffd7ab
    CSAHi Repeat term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#6699cc
    CSAHi Todo term=underline cterm=underline ctermbg=bg ctermfg=212 gui=italic,underline guibg=bg guifg=#ff80d0
    CSAHi Type term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=144 gui=underline guibg=bg guifg=#b0a197
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=96 gui=NONE guibg=#231a23 guifg=#876b99
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#acdd82
    CSAHi Conditional term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#86bbee
    CSAHi VisualNC term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi WarningMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#cea662
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=211 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=179 gui=NONE guibg=#0b000e guifg=#cea662
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=251 gui=NONE guibg=#0b000e guifg=#c8c8c8
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#042806 guifg=fg
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=58 ctermfg=144 gui=NONE guibg=#4a3000 guifg=#b5a586
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#400707 guifg=#440606
    CSAHi DiffText term=bold cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=#1f1500 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#0b000e guifg=#f0f0f0
endif

if 1
    delcommand CSAHi
endif
