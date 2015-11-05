" This scheme was created by CSApproxSnapshot
" on Thu, 05 Nov 2015

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
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#141414 guifg=#eaeaea
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#6699cc
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#b5e4f7
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#6699cc
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#edc37c
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#6699cc
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=#eaeaea
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi Error term=reverse cterm=bold ctermbg=16 ctermfg=220 gui=bold guibg=#000000 guifg=#f2ca03
    CSAHi Todo term=NONE cterm=underline ctermbg=bg ctermfg=218 gui=italic,underline guibg=bg guifg=#ff80d0
    CSAHi String term=NONE cterm=NONE ctermbg=233 ctermfg=186 gui=NONE guibg=#0f0f0f guifg=#bccf72
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#acdd82
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=218 gui=bold guibg=bg guifg=#ff80c0
    CSAHi IncSearch term=reverse cterm=bold ctermbg=125 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=54 ctermfg=183 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=135 ctermfg=122 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=243 gui=italic guibg=#0e0e0e guifg=#727272
    CSAHi cssTagName term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#70a8dd
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#d0af76
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=218 gui=undercurl guibg=bg guifg=fg guisp=#ff99cc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#303030 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#f6f3e8
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#8a8a8a guifg=#000000
    CSAHi TabLine term=underline cterm=NONE ctermbg=233 ctermfg=245 gui=NONE guibg=#121212 guifg=#8a8a8a
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=95 ctermfg=253 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=233 ctermfg=16 gui=NONE guibg=#111111 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=#e8e8e8
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=233 ctermfg=71 gui=NONE guibg=#141414 guifg=#26a938
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=52 ctermfg=138 gui=NONE guibg=#400707 guifg=#8a4d4d
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=182 ctermfg=16 gui=NONE guibg=#c6acc6 guifg=#000000
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=180 ctermfg=16 gui=NONE guibg=#b88853 guifg=#000000
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=215 ctermfg=16 gui=NONE guibg=#ffa724 guifg=#000000
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=139 ctermfg=16 gui=NONE guibg=#a77990 guifg=#000000
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=151 ctermfg=16 gui=NONE guibg=#acdd82 guifg=#000000
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=109 ctermfg=16 gui=NONE guibg=#79a9a9 guifg=#000000
    CSAHi SneakPluginTarget term=NONE cterm=bold ctermbg=219 ctermfg=16 gui=bold guibg=#ffa8ff guifg=#000000
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffd7ab
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=233 ctermfg=219 gui=NONE guibg=#121212 guifg=#ffa8ff
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=95 ctermfg=219 gui=NONE guibg=#602040 guifg=#ffa8ff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#86bbee
    CSAHi TabModifiedSel term=NONE cterm=bold ctermbg=95 ctermfg=219 gui=bold guibg=#602040 guifg=#ffb0ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#cca670
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#86bbee
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#6699cc
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00a0a0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#86bbee
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=125 ctermfg=233 gui=bold,italic guibg=#99004c guifg=#0e0e0e
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=95 ctermfg=253 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=244 ctermfg=16 gui=NONE guibg=#808080 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=233 ctermfg=246 gui=NONE guibg=#111111 guifg=#909090
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#d0d0d0
    CSAHi Visual term=reverse cterm=NONE ctermbg=96 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=96 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=218 gui=bold guibg=bg guifg=#ff80c0
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=218 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0a0a0a guifg=fg
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=italic guibg=bg guifg=#9ccfdd
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=italic guibg=bg guifg=#a2ddb8
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#e48944
    CSAHi markdownCode term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=bold guibg=bg guifg=#a7bee4
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#c5b1e4
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=italic guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMObjects term=NONE cterm=bold ctermbg=bg ctermfg=188 gui=bold guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#d4fa9b
    CSAHi javaScriptAjaxObjects term=NONE cterm=underline ctermbg=bg ctermfg=110 gui=underline guibg=bg guifg=#5d91d3
    CSAHi CursorLine term=underline cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=125 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=30 ctermfg=231 gui=NONE guibg=#146666 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#f8bef8
    CSAHi Special term=bold cterm=NONE ctermbg=233 ctermfg=215 gui=NONE guibg=#0f0f0f guifg=#ff9a4c
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40f8f8
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=245 ctermfg=fg gui=NONE guibg=#8a8a8a guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#cccccc
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlH1 term=NONE cterm=underline ctermbg=bg ctermfg=174 gui=underline guibg=bg guifg=#de675c
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=177 gui=underline guibg=bg guifg=#c777ff
    CSAHi Folded term=NONE cterm=NONE ctermbg=232 ctermfg=251 gui=NONE guibg=#0c0c0c guifg=#c8c8c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=251 gui=NONE guibg=#212121 guifg=#c8c8c8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#042806 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=58 ctermfg=181 gui=NONE guibg=#4a3000 guifg=#b5a586
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#400707 guifg=#440606
    CSAHi DiffText term=reverse cterm=bold ctermbg=52 ctermfg=fg gui=bold guibg=#1f1500 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#0e0e0e guifg=#f0f0f0
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
    CSAHi TabModified term=NONE cterm=bold ctermbg=233 ctermfg=219 gui=bold guibg=#121212 guifg=#ffa8ff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#141414 guifg=#eaeaea
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#6699cc
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#b5e4f7
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#6699cc
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#edc37c
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#6699cc
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=#eaeaea
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi Error term=reverse cterm=bold ctermbg=16 ctermfg=226 gui=bold guibg=#000000 guifg=#f2ca03
    CSAHi Todo term=NONE cterm=underline ctermbg=bg ctermfg=219 gui=italic,underline guibg=bg guifg=#ff80d0
    CSAHi String term=NONE cterm=NONE ctermbg=233 ctermfg=193 gui=NONE guibg=#0f0f0f guifg=#bccf72
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#acdd82
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ff80c0
    CSAHi IncSearch term=reverse cterm=bold ctermbg=162 ctermfg=255 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=91 ctermfg=225 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=141 ctermfg=159 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=243 gui=italic guibg=#0e0e0e guifg=#727272
    CSAHi cssTagName term=NONE cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#70a8dd
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#d0af76
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=225 gui=undercurl guibg=bg guifg=fg guisp=#ff99cc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#303030 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#f6f3e8
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#8a8a8a guifg=#000000
    CSAHi TabLine term=underline cterm=NONE ctermbg=233 ctermfg=245 gui=NONE guibg=#121212 guifg=#8a8a8a
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=96 ctermfg=231 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=233 ctermfg=16 gui=NONE guibg=#111111 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=#e8e8e8
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=233 ctermfg=77 gui=NONE guibg=#141414 guifg=#26a938
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=88 ctermfg=138 gui=NONE guibg=#400707 guifg=#8a4d4d
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=225 ctermfg=16 gui=NONE guibg=#c6acc6 guifg=#000000
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=180 ctermfg=16 gui=NONE guibg=#b88853 guifg=#000000
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=221 ctermfg=16 gui=NONE guibg=#ffa724 guifg=#000000
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=181 ctermfg=16 gui=NONE guibg=#a77990 guifg=#000000
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=193 ctermfg=16 gui=NONE guibg=#acdd82 guifg=#000000
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=152 ctermfg=16 gui=NONE guibg=#79a9a9 guifg=#000000
    CSAHi SneakPluginTarget term=NONE cterm=bold ctermbg=225 ctermfg=16 gui=bold guibg=#ffa8ff guifg=#000000
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffd7ab
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=233 ctermfg=225 gui=NONE guibg=#121212 guifg=#ffa8ff
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=96 ctermfg=225 gui=NONE guibg=#602040 guifg=#ffa8ff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#86bbee
    CSAHi TabModifiedSel term=NONE cterm=bold ctermbg=96 ctermfg=225 gui=bold guibg=#602040 guifg=#ffb0ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#cca670
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#86bbee
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=#6699cc
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00a0a0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#86bbee
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=162 ctermfg=233 gui=bold,italic guibg=#99004c guifg=#0e0e0e
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=96 ctermfg=231 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=244 ctermfg=16 gui=NONE guibg=#808080 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=233 ctermfg=246 gui=NONE guibg=#111111 guifg=#909090
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#d0d0d0
    CSAHi Visual term=reverse cterm=NONE ctermbg=133 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=133 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ff80c0
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=219 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0a0a0a guifg=fg
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=italic guibg=bg guifg=#9ccfdd
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=194 gui=italic guibg=bg guifg=#a2ddb8
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#e48944
    CSAHi markdownCode term=NONE cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#a7bee4
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#c5b1e4
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=225 gui=italic guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMObjects term=NONE cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#d4fa9b
    CSAHi javaScriptAjaxObjects term=NONE cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#5d91d3
    CSAHi CursorLine term=underline cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=162 ctermfg=255 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=30 ctermfg=255 gui=NONE guibg=#146666 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#f8bef8
    CSAHi Special term=bold cterm=NONE ctermbg=233 ctermfg=222 gui=NONE guibg=#0f0f0f guifg=#ff9a4c
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#40f8f8
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=245 ctermfg=fg gui=NONE guibg=#8a8a8a guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlH1 term=NONE cterm=underline ctermbg=bg ctermfg=210 gui=underline guibg=bg guifg=#de675c
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=219 gui=underline guibg=bg guifg=#c777ff
    CSAHi Folded term=NONE cterm=NONE ctermbg=232 ctermfg=251 gui=NONE guibg=#0c0c0c guifg=#c8c8c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=251 gui=NONE guibg=#212121 guifg=#c8c8c8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#042806 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=94 ctermfg=187 gui=NONE guibg=#4a3000 guifg=#b5a586
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=88 ctermfg=88 gui=NONE guibg=#400707 guifg=#440606
    CSAHi DiffText term=reverse cterm=bold ctermbg=52 ctermfg=fg gui=bold guibg=#1f1500 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#0e0e0e guifg=#f0f0f0
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
    CSAHi TabModified term=NONE cterm=bold ctermbg=233 ctermfg=225 gui=bold guibg=#121212 guifg=#ffa8ff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#141414 guifg=#eaeaea
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b5e4f7
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#edc37c
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699cc
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=#eaeaea
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi Error term=reverse cterm=bold ctermbg=16 ctermfg=220 gui=bold guibg=#000000 guifg=#f2ca03
    CSAHi Todo term=NONE cterm=underline ctermbg=bg ctermfg=212 gui=italic,underline guibg=bg guifg=#ff80d0
    CSAHi String term=NONE cterm=NONE ctermbg=233 ctermfg=149 gui=NONE guibg=#0f0f0f guifg=#bccf72
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#acdd82
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=211 gui=bold guibg=bg guifg=#ff80c0
    CSAHi IncSearch term=reverse cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=54 ctermfg=177 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=99 ctermfg=85 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=243 gui=italic guibg=#0e0e0e guifg=#727272
    CSAHi cssTagName term=NONE cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#70a8dd
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#d0af76
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=212 gui=undercurl guibg=bg guifg=fg guisp=#ff99cc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=230 gui=NONE guibg=#303030 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#f6f3e8
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#8a8a8a guifg=#000000
    CSAHi TabLine term=underline cterm=NONE ctermbg=233 ctermfg=245 gui=NONE guibg=#121212 guifg=#8a8a8a
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=53 ctermfg=188 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=233 ctermfg=16 gui=NONE guibg=#111111 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=#e8e8e8
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=233 ctermfg=35 gui=NONE guibg=#141414 guifg=#26a938
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=#400707 guifg=#8a4d4d
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=182 ctermfg=16 gui=NONE guibg=#c6acc6 guifg=#000000
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=137 ctermfg=16 gui=NONE guibg=#b88853 guifg=#000000
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=#ffa724 guifg=#000000
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=138 ctermfg=16 gui=NONE guibg=#a77990 guifg=#000000
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#acdd82 guifg=#000000
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=109 ctermfg=16 gui=NONE guibg=#79a9a9 guifg=#000000
    CSAHi SneakPluginTarget term=NONE cterm=bold ctermbg=219 ctermfg=16 gui=bold guibg=#ffa8ff guifg=#000000
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffd7ab
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=233 ctermfg=219 gui=NONE guibg=#121212 guifg=#ffa8ff
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=53 ctermfg=219 gui=NONE guibg=#602040 guifg=#ffa8ff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi TabModifiedSel term=NONE cterm=bold ctermbg=53 ctermfg=219 gui=bold guibg=#602040 guifg=#ffb0ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#cca670
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#86bbee
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#6699cc
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00a0a0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#86bbee
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=89 ctermfg=233 gui=bold,italic guibg=#99004c guifg=#0e0e0e
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=53 ctermfg=188 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=244 ctermfg=16 gui=NONE guibg=#808080 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=233 ctermfg=246 gui=NONE guibg=#111111 guifg=#909090
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#d0d0d0
    CSAHi Visual term=reverse cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=211 gui=bold guibg=bg guifg=#ff80c0
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=211 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0a0a0a guifg=fg
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=italic guibg=bg guifg=#9ccfdd
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=italic guibg=bg guifg=#a2ddb8
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e48944
    CSAHi markdownCode term=NONE cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#a7bee4
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#c5b1e4
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=italic guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMObjects term=NONE cterm=bold ctermbg=bg ctermfg=182 gui=bold guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#d4fa9b
    CSAHi javaScriptAjaxObjects term=NONE cterm=underline ctermbg=bg ctermfg=68 gui=underline guibg=bg guifg=#5d91d3
    CSAHi CursorLine term=underline cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#146666 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#f8bef8
    CSAHi Special term=bold cterm=NONE ctermbg=233 ctermfg=209 gui=NONE guibg=#0f0f0f guifg=#ff9a4c
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40f8f8
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=245 ctermfg=fg gui=NONE guibg=#8a8a8a guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#cccccc
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlH1 term=NONE cterm=underline ctermbg=bg ctermfg=167 gui=underline guibg=bg guifg=#de675c
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=177 gui=underline guibg=bg guifg=#c777ff
    CSAHi Folded term=NONE cterm=NONE ctermbg=232 ctermfg=251 gui=NONE guibg=#0c0c0c guifg=#c8c8c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=251 gui=NONE guibg=#212121 guifg=#c8c8c8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#042806 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=58 ctermfg=144 gui=NONE guibg=#4a3000 guifg=#b5a586
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#400707 guifg=#440606
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=#1f1500 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#0e0e0e guifg=#f0f0f0
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
    CSAHi TabModified term=NONE cterm=bold ctermbg=233 ctermfg=219 gui=bold guibg=#121212 guifg=#ffa8ff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=#141414 guifg=#eaeaea
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#6699cc
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#b5e4f7
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff9494
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#6699cc
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#edc37c
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#6699cc
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=87 gui=underline guibg=bg guifg=#eaeaea
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#141414
    CSAHi Error term=reverse cterm=bold ctermbg=16 ctermfg=72 gui=bold guibg=#000000 guifg=#f2ca03
    CSAHi Todo term=NONE cterm=underline ctermbg=bg ctermfg=70 gui=italic,underline guibg=bg guifg=#ff80d0
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=#0f0f0f guifg=#bccf72
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#acdd82
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#808080
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=70 gui=bold guibg=bg guifg=#ff80c0
    CSAHi IncSearch term=reverse cterm=bold ctermbg=33 ctermfg=79 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=17 ctermfg=55 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=35 ctermfg=46 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=43 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=82 gui=italic guibg=#0e0e0e guifg=#727272
    CSAHi cssTagName term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#70a8dd
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#d0af76
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=70 gui=undercurl guibg=bg guifg=fg guisp=#ff99cc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#303030 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#f6f3e8
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=80 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#8a8a8a guifg=#000000
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#121212 guifg=#8a8a8a
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=32 ctermfg=86 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#111111 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#e8e8e8
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=16 ctermfg=20 gui=NONE guibg=#141414 guifg=#26a938
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#400707 guifg=#8a4d4d
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=54 ctermfg=16 gui=NONE guibg=#c6acc6 guifg=#000000
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=53 ctermfg=16 gui=NONE guibg=#b88853 guifg=#000000
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=#ffa724 guifg=#000000
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#a77990 guifg=#000000
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=41 ctermfg=16 gui=NONE guibg=#acdd82 guifg=#000000
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#79a9a9 guifg=#000000
    CSAHi SneakPluginTarget term=NONE cterm=bold ctermbg=71 ctermfg=16 gui=bold guibg=#ffa8ff guifg=#000000
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffd7ab
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=16 ctermfg=71 gui=NONE guibg=#121212 guifg=#ffa8ff
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=32 ctermfg=71 gui=NONE guibg=#602040 guifg=#ffa8ff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#86bbee
    CSAHi TabModifiedSel term=NONE cterm=bold ctermbg=32 ctermfg=75 gui=bold guibg=#602040 guifg=#ffb0ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#cca670
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=43 gui=bold guibg=bg guifg=#86bbee
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#6699cc
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#00a0a0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#86bbee
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=33 ctermfg=16 gui=bold,italic guibg=#99004c guifg=#0e0e0e
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=32 ctermfg=86 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#808080 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#111111 guifg=#909090
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#d0d0d0
    CSAHi Visual term=reverse cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=70 gui=bold guibg=bg guifg=#ff80c0
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=70 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0a0a0a guifg=fg
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=italic guibg=bg guifg=#9ccfdd
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=italic guibg=bg guifg=#a2ddb8
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#e48944
    CSAHi markdownCode term=NONE cterm=bold ctermbg=bg ctermfg=42 gui=bold guibg=bg guifg=#a7bee4
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#c5b1e4
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=italic guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMObjects term=NONE cterm=bold ctermbg=bg ctermfg=58 gui=bold guibg=bg guifg=#dbb6d2
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=#d4fa9b
    CSAHi javaScriptAjaxObjects term=NONE cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=#5d91d3
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=33 ctermfg=79 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#146666 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#f8bef8
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=69 gui=NONE guibg=#0f0f0f guifg=#ff9a4c
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#40f8f8
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=83 ctermfg=fg gui=NONE guibg=#8a8a8a guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#cccccc
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlH1 term=NONE cterm=underline ctermbg=bg ctermfg=53 gui=underline guibg=bg guifg=#de675c
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=55 gui=underline guibg=bg guifg=#c777ff
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=58 gui=NONE guibg=#0c0c0c guifg=#c8c8c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#212121 guifg=#c8c8c8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#042806 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=32 ctermfg=53 gui=NONE guibg=#4a3000 guifg=#b5a586
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#400707 guifg=#440606
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=#1f1500 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=#0e0e0e guifg=#f0f0f0
    CSAHi Conceal term=NONE cterm=NONE ctermbg=84 ctermfg=86 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=28 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
    CSAHi TabModified term=NONE cterm=bold ctermbg=16 ctermfg=71 gui=bold guibg=#121212 guifg=#ffa8ff
endif

if 1
    delcommand CSAHi
endif
