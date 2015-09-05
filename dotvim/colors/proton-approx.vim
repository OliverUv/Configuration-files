" This scheme was created by CSApproxSnapshot
" on Sat, 05 Sep 2015

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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=238 gui=NONE guibg=#f0f0f0 guifg=#404040
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#d0d0d0 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=254 ctermfg=241 gui=NONE guibg=#e0e0e0 guifg=#606060
    CSAHi PreProc term=underline cterm=NONE ctermbg=188 ctermfg=103 gui=italic guibg=#dcd8e0 guifg=#605080
    CSAHi Type term=underline cterm=underline ctermbg=255 ctermfg=103 gui=underline guibg=#f0f0f0 guifg=#607080
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=234 gui=underline guibg=#f0f0f0 guifg=#202020
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#f0f0f0
    CSAHi Error term=reverse cterm=bold ctermbg=234 ctermfg=220 gui=bold guibg=#191919 guifg=#f2ca03
    CSAHi Todo term=NONE cterm=underline ctermbg=252 ctermfg=125 gui=italic,underline guibg=#d0d0d0 guifg=#99004c
    CSAHi String term=NONE cterm=NONE ctermbg=231 ctermfg=138 gui=italic guibg=#f0ece8 guifg=#a07060
    CSAHi Number term=NONE cterm=NONE ctermbg=255 ctermfg=107 gui=NONE guibg=#f0f0f0 guifg=#508040
    CSAHi Exception term=NONE cterm=bold ctermbg=255 ctermfg=131 gui=bold guibg=#f0f0f0 guifg=#a03020
    CSAHi Include term=NONE cterm=NONE ctermbg=188 ctermfg=103 gui=NONE guibg=#dcd8e0 guifg=#605080
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=247 gui=NONE guibg=#e8e8e8 guifg=#a0a0a0
    CSAHi NonText term=bold cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=244 ctermfg=231 gui=bold guibg=#808080 guifg=#ffffff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=255 ctermfg=60 gui=bold guibg=#f0f0f0 guifg=#304050
    CSAHi ModeMsg term=bold cterm=bold ctermbg=255 ctermfg=60 gui=bold guibg=#f0f0f0 guifg=#304050
    CSAHi LineNr term=underline cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi cssTagName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=#008b8b
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=#ffbbff guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=255 ctermfg=238 gui=NONE guibg=#f0f0f0 guifg=#404040
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=#e0e0e0 guifg=#202020
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SneakPluginTarget term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dadada guifg=fg
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=252 ctermfg=125 gui=NONE guibg=#d0d0d0 guifg=#99004c
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=255 ctermfg=125 gui=NONE guibg=#f0f0f0 guifg=#99004c
    CSAHi TabModified term=NONE cterm=bold ctermbg=247 ctermfg=252 gui=bold guibg=#a0a0a0 guifg=#d0d0d0
    CSAHi TabModifiedSel term=NONE cterm=bold ctermbg=255 ctermfg=234 gui=bold guibg=#f0f0f0 guifg=#202020
    CSAHi Function term=NONE cterm=underline ctermbg=230 ctermfg=143 gui=underline guibg=#f0e8c0 guifg=#b08020
    CSAHi Conditional term=NONE cterm=bold ctermbg=195 ctermfg=109 gui=bold guibg=#e0e8f0 guifg=#5080b0
    CSAHi Repeat term=NONE cterm=bold ctermbg=194 ctermfg=107 gui=bold guibg=#e0e8d8 guifg=#509030
    CSAHi Label term=NONE cterm=underline ctermbg=254 ctermfg=241 gui=underline guibg=#e0e0e0 guifg=#606060
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=137 gui=NONE guibg=#f0f0f0 guifg=#a77039
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=131 gui=bold guibg=bg guifg=#a52a2a
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=244 ctermfg=255 gui=bold,italic guibg=#808080 guifg=#f0f0f0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=242 ctermfg=252 gui=italic guibg=#707070 guifg=#d0d0d0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=242 ctermfg=246 gui=NONE guibg=#707070 guifg=#909090
    CSAHi Title term=bold cterm=underline ctermbg=255 ctermfg=234 gui=underline guibg=#f0f0f0 guifg=#202020
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=#e5e5e5 guifg=fg
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownCode term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptDOMObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=#e0e0e0 guifg=#202020
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=224 ctermfg=fg gui=NONE guibg=#ffbbbb guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=238 ctermfg=247 gui=NONE guibg=#404040 guifg=#a0a0a0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=238 ctermfg=255 gui=NONE guibg=#404040 guifg=#f0f0f0
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=145 gui=NONE guibg=#f0f0f0 guifg=#9098a0
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=107 gui=NONE guibg=#f0f0f0 guifg=#508040
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=95 gui=italic guibg=#f0ece8 guifg=#603020
    CSAHi Identifier term=underline cterm=NONE ctermbg=188 ctermfg=108 gui=NONE guibg=#c0e0c0 guifg=#608050
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f0f0f0 guifg=fg
    CSAHi Define term=NONE cterm=bold ctermbg=231 ctermfg=103 gui=bold,italic guibg=#ece8f0 guifg=#605080
    CSAHi htmlH1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlLink term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=244 ctermfg=19 gui=NONE guibg=#808080 guifg=#00008b
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=106 ctermfg=149 gui=NONE guibg=#4e9a06 guifg=#8ae234
    CSAHi DiffChange term=bold cterm=NONE ctermbg=66 ctermfg=117 gui=NONE guibg=#425c78 guifg=#7fbdff
    CSAHi DiffDelete term=bold cterm=bold ctermbg=130 ctermfg=210 gui=bold guibg=#a62910 guifg=#ff7f50
    CSAHi DiffText term=reverse cterm=bold ctermbg=137 ctermfg=222 gui=bold guibg=#a67429 guifg=#ffcc7f
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=#d0d0d0 guifg=#202020
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#f02020
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=238 gui=NONE guibg=#f0f0f0 guifg=#404040
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#d0d0d0 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=254 ctermfg=241 gui=NONE guibg=#e0e0e0 guifg=#606060
    CSAHi PreProc term=underline cterm=NONE ctermbg=231 ctermfg=103 gui=italic guibg=#dcd8e0 guifg=#605080
    CSAHi Type term=underline cterm=underline ctermbg=255 ctermfg=109 gui=underline guibg=#f0f0f0 guifg=#607080
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=234 gui=underline guibg=#f0f0f0 guifg=#202020
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#f0f0f0
    CSAHi Error term=reverse cterm=bold ctermbg=234 ctermfg=226 gui=bold guibg=#191919 guifg=#f2ca03
    CSAHi Todo term=NONE cterm=underline ctermbg=252 ctermfg=162 gui=italic,underline guibg=#d0d0d0 guifg=#99004c
    CSAHi String term=NONE cterm=NONE ctermbg=231 ctermfg=180 gui=italic guibg=#f0ece8 guifg=#a07060
    CSAHi Number term=NONE cterm=NONE ctermbg=255 ctermfg=108 gui=NONE guibg=#f0f0f0 guifg=#508040
    CSAHi Exception term=NONE cterm=bold ctermbg=255 ctermfg=167 gui=bold guibg=#f0f0f0 guifg=#a03020
    CSAHi Include term=NONE cterm=NONE ctermbg=231 ctermfg=103 gui=NONE guibg=#dcd8e0 guifg=#605080
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=247 gui=NONE guibg=#e8e8e8 guifg=#a0a0a0
    CSAHi NonText term=bold cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=244 ctermfg=255 gui=bold guibg=#808080 guifg=#ffffff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=255 ctermfg=66 gui=bold guibg=#f0f0f0 guifg=#304050
    CSAHi ModeMsg term=bold cterm=bold ctermbg=255 ctermfg=66 gui=bold guibg=#f0f0f0 guifg=#304050
    CSAHi LineNr term=underline cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi cssTagName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=#008b8b
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=#ffbbff guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=255 ctermfg=238 gui=NONE guibg=#f0f0f0 guifg=#404040
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=#e0e0e0 guifg=#202020
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SneakPluginTarget term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dadada guifg=fg
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=252 ctermfg=162 gui=NONE guibg=#d0d0d0 guifg=#99004c
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=255 ctermfg=162 gui=NONE guibg=#f0f0f0 guifg=#99004c
    CSAHi TabModified term=NONE cterm=bold ctermbg=247 ctermfg=252 gui=bold guibg=#a0a0a0 guifg=#d0d0d0
    CSAHi TabModifiedSel term=NONE cterm=bold ctermbg=255 ctermfg=234 gui=bold guibg=#f0f0f0 guifg=#202020
    CSAHi Function term=NONE cterm=underline ctermbg=231 ctermfg=179 gui=underline guibg=#f0e8c0 guifg=#b08020
    CSAHi Conditional term=NONE cterm=bold ctermbg=231 ctermfg=110 gui=bold guibg=#e0e8f0 guifg=#5080b0
    CSAHi Repeat term=NONE cterm=bold ctermbg=231 ctermfg=107 gui=bold guibg=#e0e8d8 guifg=#509030
    CSAHi Label term=NONE cterm=underline ctermbg=254 ctermfg=241 gui=underline guibg=#e0e0e0 guifg=#606060
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=179 gui=NONE guibg=#f0f0f0 guifg=#a77039
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=167 gui=bold guibg=bg guifg=#a52a2a
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=244 ctermfg=255 gui=bold,italic guibg=#808080 guifg=#f0f0f0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=242 ctermfg=252 gui=italic guibg=#707070 guifg=#d0d0d0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=242 ctermfg=246 gui=NONE guibg=#707070 guifg=#909090
    CSAHi Title term=bold cterm=underline ctermbg=255 ctermfg=234 gui=underline guibg=#f0f0f0 guifg=#202020
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=#e5e5e5 guifg=fg
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownCode term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptDOMObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=#e0e0e0 guifg=#202020
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=224 ctermfg=fg gui=NONE guibg=#ffbbbb guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=238 ctermfg=247 gui=NONE guibg=#404040 guifg=#a0a0a0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=238 ctermfg=255 gui=NONE guibg=#404040 guifg=#f0f0f0
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=152 gui=NONE guibg=#f0f0f0 guifg=#9098a0
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=108 gui=NONE guibg=#f0f0f0 guifg=#508040
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=95 gui=italic guibg=#f0ece8 guifg=#603020
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=108 gui=NONE guibg=#c0e0c0 guifg=#608050
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f0f0f0 guifg=fg
    CSAHi Define term=NONE cterm=bold ctermbg=231 ctermfg=103 gui=bold,italic guibg=#ece8f0 guifg=#605080
    CSAHi htmlH1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlLink term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=241 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=244 ctermfg=19 gui=NONE guibg=#808080 guifg=#00008b
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=112 ctermfg=155 gui=NONE guibg=#4e9a06 guifg=#8ae234
    CSAHi DiffChange term=bold cterm=NONE ctermbg=103 ctermfg=153 gui=NONE guibg=#425c78 guifg=#7fbdff
    CSAHi DiffDelete term=bold cterm=bold ctermbg=166 ctermfg=216 gui=bold guibg=#a62910 guifg=#ff7f50
    CSAHi DiffText term=reverse cterm=bold ctermbg=179 ctermfg=229 gui=bold guibg=#a67429 guifg=#ffcc7f
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=#d0d0d0 guifg=#202020
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#f02020
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=238 gui=NONE guibg=#f0f0f0 guifg=#404040
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#d0d0d0 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=254 ctermfg=59 gui=NONE guibg=#e0e0e0 guifg=#606060
    CSAHi PreProc term=underline cterm=NONE ctermbg=188 ctermfg=60 gui=italic guibg=#dcd8e0 guifg=#605080
    CSAHi Type term=underline cterm=underline ctermbg=255 ctermfg=60 gui=underline guibg=#f0f0f0 guifg=#607080
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=234 gui=underline guibg=#f0f0f0 guifg=#202020
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#f0f0f0
    CSAHi Error term=reverse cterm=bold ctermbg=234 ctermfg=220 gui=bold guibg=#191919 guifg=#f2ca03
    CSAHi Todo term=NONE cterm=underline ctermbg=252 ctermfg=89 gui=italic,underline guibg=#d0d0d0 guifg=#99004c
    CSAHi String term=NONE cterm=NONE ctermbg=230 ctermfg=131 gui=italic guibg=#f0ece8 guifg=#a07060
    CSAHi Number term=NONE cterm=NONE ctermbg=255 ctermfg=65 gui=NONE guibg=#f0f0f0 guifg=#508040
    CSAHi Exception term=NONE cterm=bold ctermbg=255 ctermfg=130 gui=bold guibg=#f0f0f0 guifg=#a03020
    CSAHi Include term=NONE cterm=NONE ctermbg=188 ctermfg=60 gui=NONE guibg=#dcd8e0 guifg=#605080
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=247 gui=NONE guibg=#e8e8e8 guifg=#a0a0a0
    CSAHi NonText term=bold cterm=NONE ctermbg=252 ctermfg=59 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=244 ctermfg=231 gui=bold guibg=#808080 guifg=#ffffff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=255 ctermfg=59 gui=bold guibg=#f0f0f0 guifg=#304050
    CSAHi ModeMsg term=bold cterm=bold ctermbg=255 ctermfg=59 gui=bold guibg=#f0f0f0 guifg=#304050
    CSAHi LineNr term=underline cterm=NONE ctermbg=252 ctermfg=59 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi cssTagName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=#008b8b
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=#ffbbff guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=252 ctermfg=59 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=255 ctermfg=238 gui=NONE guibg=#f0f0f0 guifg=#404040
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=252 ctermfg=59 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=#e0e0e0 guifg=#202020
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SneakPluginTarget term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dadada guifg=fg
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=252 ctermfg=89 gui=NONE guibg=#d0d0d0 guifg=#99004c
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=255 ctermfg=89 gui=NONE guibg=#f0f0f0 guifg=#99004c
    CSAHi TabModified term=NONE cterm=bold ctermbg=247 ctermfg=252 gui=bold guibg=#a0a0a0 guifg=#d0d0d0
    CSAHi TabModifiedSel term=NONE cterm=bold ctermbg=255 ctermfg=234 gui=bold guibg=#f0f0f0 guifg=#202020
    CSAHi Function term=NONE cterm=underline ctermbg=223 ctermfg=136 gui=underline guibg=#f0e8c0 guifg=#b08020
    CSAHi Conditional term=NONE cterm=bold ctermbg=189 ctermfg=67 gui=bold guibg=#e0e8f0 guifg=#5080b0
    CSAHi Repeat term=NONE cterm=bold ctermbg=188 ctermfg=65 gui=bold guibg=#e0e8d8 guifg=#509030
    CSAHi Label term=NONE cterm=underline ctermbg=254 ctermfg=59 gui=underline guibg=#e0e0e0 guifg=#606060
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=131 gui=NONE guibg=#f0f0f0 guifg=#a77039
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=124 gui=bold guibg=bg guifg=#a52a2a
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#2e8b57
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=244 ctermfg=255 gui=bold,italic guibg=#808080 guifg=#f0f0f0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=242 ctermfg=252 gui=italic guibg=#707070 guifg=#d0d0d0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=242 ctermfg=246 gui=NONE guibg=#707070 guifg=#909090
    CSAHi Title term=bold cterm=underline ctermbg=255 ctermfg=234 gui=underline guibg=#f0f0f0 guifg=#202020
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=59 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=#e5e5e5 guifg=fg
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownCode term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptDOMObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=#e0e0e0 guifg=#202020
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=217 ctermfg=fg gui=NONE guibg=#ffbbbb guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=238 ctermfg=247 gui=NONE guibg=#404040 guifg=#a0a0a0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=238 ctermfg=255 gui=NONE guibg=#404040 guifg=#f0f0f0
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=103 gui=NONE guibg=#f0f0f0 guifg=#9098a0
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=65 gui=NONE guibg=#f0f0f0 guifg=#508040
    CSAHi Special term=bold cterm=NONE ctermbg=230 ctermfg=58 gui=italic guibg=#f0ece8 guifg=#603020
    CSAHi Identifier term=underline cterm=NONE ctermbg=151 ctermfg=65 gui=NONE guibg=#c0e0c0 guifg=#608050
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f0f0f0 guifg=fg
    CSAHi Define term=NONE cterm=bold ctermbg=225 ctermfg=60 gui=bold,italic guibg=#ece8f0 guifg=#605080
    CSAHi htmlH1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlLink term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=59 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=244 ctermfg=18 gui=NONE guibg=#808080 guifg=#00008b
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=64 ctermfg=113 gui=NONE guibg=#4e9a06 guifg=#8ae234
    CSAHi DiffChange term=bold cterm=NONE ctermbg=60 ctermfg=111 gui=NONE guibg=#425c78 guifg=#7fbdff
    CSAHi DiffDelete term=bold cterm=bold ctermbg=124 ctermfg=209 gui=bold guibg=#a62910 guifg=#ff7f50
    CSAHi DiffText term=reverse cterm=bold ctermbg=136 ctermfg=222 gui=bold guibg=#a67429 guifg=#ffcc7f
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=#d0d0d0 guifg=#202020
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#f02020
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#f0f0f0 guifg=#404040
    CSAHi UniteSelectedLine term=NONE cterm=NONE ctermbg=86 ctermfg=fg gui=NONE guibg=#d0d0d0 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LocalVariable term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxMethods term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxProperties term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptFuncName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptHtmlElemProperties term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptEventListenerKeyword term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi coffeeSpecialVar term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=87 ctermfg=81 gui=NONE guibg=#e0e0e0 guifg=#606060
    CSAHi PreProc term=underline cterm=NONE ctermbg=58 ctermfg=37 gui=italic guibg=#dcd8e0 guifg=#605080
    CSAHi Type term=underline cterm=underline ctermbg=87 ctermfg=37 gui=underline guibg=#f0f0f0 guifg=#607080
    CSAHi Underlined term=underline cterm=underline ctermbg=87 ctermfg=80 gui=underline guibg=#f0f0f0 guifg=#202020
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#f0f0f0
    CSAHi Error term=reverse cterm=bold ctermbg=80 ctermfg=72 gui=bold guibg=#191919 guifg=#f2ca03
    CSAHi Todo term=NONE cterm=underline ctermbg=86 ctermfg=33 gui=italic,underline guibg=#d0d0d0 guifg=#99004c
    CSAHi String term=NONE cterm=NONE ctermbg=87 ctermfg=37 gui=italic guibg=#f0ece8 guifg=#a07060
    CSAHi Number term=NONE cterm=NONE ctermbg=87 ctermfg=36 gui=NONE guibg=#f0f0f0 guifg=#508040
    CSAHi Exception term=NONE cterm=bold ctermbg=87 ctermfg=32 gui=bold guibg=#f0f0f0 guifg=#a03020
    CSAHi Include term=NONE cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#dcd8e0 guifg=#605080
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=87 ctermfg=84 gui=NONE guibg=#e8e8e8 guifg=#a0a0a0
    CSAHi NonText term=bold cterm=NONE ctermbg=86 ctermfg=81 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#0000ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=83 ctermfg=79 gui=bold guibg=#808080 guifg=#ffffff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=87 ctermfg=17 gui=bold guibg=#f0f0f0 guifg=#304050
    CSAHi ModeMsg term=bold cterm=bold ctermbg=87 ctermfg=17 gui=bold guibg=#f0f0f0 guifg=#304050
    CSAHi LineNr term=underline cterm=NONE ctermbg=86 ctermfg=81 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi cssTagName term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cssBoxProp term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#008b8b
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=#ffbbff guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=83 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=83 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=86 ctermfg=81 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#f0f0f0 guifg=#404040
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=86 ctermfg=81 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#e0e0e0 guifg=#202020
    CSAHi gitcommitFile term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#404040
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord2 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord3 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord4 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord5 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi InterestingWord6 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SneakPluginTarget term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Member term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=86 ctermfg=fg gui=NONE guibg=#dadada guifg=fg
    CSAHi TabNumber term=NONE cterm=NONE ctermbg=86 ctermfg=33 gui=NONE guibg=#d0d0d0 guifg=#99004c
    CSAHi TabNumberSel term=NONE cterm=NONE ctermbg=87 ctermfg=33 gui=NONE guibg=#f0f0f0 guifg=#99004c
    CSAHi TabModified term=NONE cterm=bold ctermbg=84 ctermfg=86 gui=bold guibg=#a0a0a0 guifg=#d0d0d0
    CSAHi TabModifiedSel term=NONE cterm=bold ctermbg=87 ctermfg=80 gui=bold guibg=#f0f0f0 guifg=#202020
    CSAHi Function term=NONE cterm=underline ctermbg=78 ctermfg=52 gui=underline guibg=#f0e8c0 guifg=#b08020
    CSAHi Conditional term=NONE cterm=bold ctermbg=87 ctermfg=38 gui=bold guibg=#e0e8f0 guifg=#5080b0
    CSAHi Repeat term=NONE cterm=bold ctermbg=62 ctermfg=36 gui=bold guibg=#e0e8d8 guifg=#509030
    CSAHi Label term=NONE cterm=underline ctermbg=87 ctermfg=81 gui=underline guibg=#e0e0e0 guifg=#606060
    CSAHi Operator term=NONE cterm=NONE ctermbg=87 ctermfg=36 gui=NONE guibg=#f0f0f0 guifg=#a77039
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=#a52a2a
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#2e8b57
    CSAHi StatusLine term=bold,reverse cterm=bold ctermbg=83 ctermfg=87 gui=bold,italic guibg=#808080 guifg=#f0f0f0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=82 ctermfg=86 gui=italic guibg=#707070 guifg=#d0d0d0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=82 ctermfg=83 gui=NONE guibg=#707070 guifg=#909090
    CSAHi Title term=bold cterm=underline ctermbg=87 ctermfg=80 gui=underline guibg=#f0f0f0 guifg=#202020
    CSAHi Visual term=reverse cterm=NONE ctermbg=86 ctermfg=81 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#e5e5e5 guifg=fg
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownUrl term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownCode term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi markdownCodeBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptBrowserObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptDOMObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptDOMMethods term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaScriptAjaxObjects term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#e0e0e0 guifg=#202020
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=74 ctermfg=fg gui=NONE guibg=#ffbbbb guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=80 ctermfg=84 gui=NONE guibg=#404040 guifg=#a0a0a0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#404040 guifg=#f0f0f0
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=87 ctermfg=37 gui=NONE guibg=#f0f0f0 guifg=#9098a0
    CSAHi Constant term=underline cterm=NONE ctermbg=87 ctermfg=36 gui=NONE guibg=#f0f0f0 guifg=#508040
    CSAHi Special term=bold cterm=NONE ctermbg=87 ctermfg=32 gui=italic guibg=#f0ece8 guifg=#603020
    CSAHi Identifier term=underline cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#c0e0c0 guifg=#608050
    CSAHi SneakPluginScope term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#f0f0f0 guifg=fg
    CSAHi Define term=NONE cterm=bold ctermbg=87 ctermfg=37 gui=bold,italic guibg=#ece8f0 guifg=#605080
    CSAHi htmlH1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlLink term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=81 gui=NONE guibg=#d0d0d0 guifg=#606060
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=83 ctermfg=17 gui=NONE guibg=#808080 guifg=#00008b
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=36 ctermfg=40 gui=NONE guibg=#4e9a06 guifg=#8ae234
    CSAHi DiffChange term=bold cterm=NONE ctermbg=21 ctermfg=43 gui=NONE guibg=#425c78 guifg=#7fbdff
    CSAHi DiffDelete term=bold cterm=bold ctermbg=32 ctermfg=69 gui=bold guibg=#a62910 guifg=#ff7f50
    CSAHi DiffText term=reverse cterm=bold ctermbg=36 ctermfg=73 gui=bold guibg=#a67429 guifg=#ffcc7f
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=#d0d0d0 guifg=#202020
    CSAHi Conceal term=NONE cterm=NONE ctermbg=84 ctermfg=86 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#f02020
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
endif

if 1
    delcommand CSAHi
endif
