" This scheme was created by CSApproxSnapshot
" on Wed, 08 May 2013

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
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#141414 guifg=#f0f0f0
    CSAHi lv2c term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#43cd80
    CSAHi op_lv3 term=NONE cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#cd6600
    CSAHi lv3c term=NONE cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#cd6600
    CSAHi op_lv4 term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#3a5fcd
    CSAHi lv4c term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#3a5fcd
    CSAHi lv1c term=NONE cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=#b22222
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#dcdc78
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=#f0f0f0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi Error term=reverse cterm=bold ctermbg=129 ctermfg=231 gui=bold guibg=#8000ff guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=218 gui=bold,underline guibg=bg guifg=#ff80d0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=147 gui=bold guibg=bg guifg=#8888ff
    CSAHi NonText term=bold cterm=bold ctermbg=232 ctermfg=168 gui=bold guibg=#0b0b0b guifg=#d84070
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=125 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=54 ctermfg=183 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=135 ctermfg=122 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=243 gui=NONE guibg=#0e0e0e guifg=#727272
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0a0a0a guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=218 gui=undercurl guibg=bg guifg=fg guisp=#ff99cc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=131 ctermfg=255 gui=NONE guibg=#903d3d guifg=#f0f0f0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=#bf4545 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=174 ctermfg=255 gui=NONE guibg=#b67171 guifg=#f0f0f0
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#111111 guifg=fg
    CSAHi helpNormal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi helpGraphic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=95 ctermfg=253 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#909090 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=233 ctermfg=246 gui=NONE guibg=#111111 guifg=#909090
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f0f0f0
    CSAHi Visual term=reverse cterm=NONE ctermbg=96 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=96 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=218 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi CtrlPLinePre term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi lv1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi op_lv1 term=NONE cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=#b22222
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv2 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv3 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv4 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi op_lv2 term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#43cd80
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#111111 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=125 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=bold ctermbg=92 ctermfg=231 gui=bold guibg=#6600cc guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=#c0c0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#92d4ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffc890
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40f8f8
    CSAHi helpLeadBlank term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=232 ctermfg=251 gui=NONE guibg=#0d0d0d guifg=#c8c8c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=251 gui=NONE guibg=#212121 guifg=#c8c8c8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=#064d08 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=94 ctermfg=255 gui=NONE guibg=#714b00 guifg=#f0f0f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=95 ctermfg=95 gui=NONE guibg=#701d1d guifg=#701d1d
    CSAHi DiffText term=reverse cterm=NONE ctermbg=52 ctermfg=fg gui=NONE guibg=#1a1800 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#303030 guifg=#f0f0f0
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#141414 guifg=#f0f0f0
    CSAHi lv2c term=NONE cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#43cd80
    CSAHi op_lv3 term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#cd6600
    CSAHi lv3c term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#cd6600
    CSAHi op_lv4 term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#3a5fcd
    CSAHi lv4c term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#3a5fcd
    CSAHi lv1c term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#b22222
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#dcdc78
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=#f0f0f0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi Error term=reverse cterm=bold ctermbg=129 ctermfg=255 gui=bold guibg=#8000ff guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=219 gui=bold,underline guibg=bg guifg=#ff80d0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=147 gui=bold guibg=bg guifg=#8888ff
    CSAHi NonText term=bold cterm=bold ctermbg=232 ctermfg=211 gui=bold guibg=#0b0b0b guifg=#d84070
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=162 ctermfg=255 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=91 ctermfg=225 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=141 ctermfg=159 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=243 gui=NONE guibg=#0e0e0e guifg=#727272
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0a0a0a guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=225 gui=undercurl guibg=bg guifg=fg guisp=#ff99cc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=131 ctermfg=255 gui=NONE guibg=#903d3d guifg=#f0f0f0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=174 ctermfg=255 gui=NONE guibg=#bf4545 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=181 ctermfg=255 gui=NONE guibg=#b67171 guifg=#f0f0f0
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#111111 guifg=fg
    CSAHi helpNormal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi helpGraphic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=96 ctermfg=231 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#909090 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=233 ctermfg=246 gui=NONE guibg=#111111 guifg=#909090
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f0f0f0
    CSAHi Visual term=reverse cterm=NONE ctermbg=133 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=133 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=219 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi CtrlPLinePre term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi lv1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi op_lv1 term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#b22222
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv2 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv3 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv4 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi op_lv2 term=NONE cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#43cd80
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#111111 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=162 ctermfg=255 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=bold ctermbg=93 ctermfg=255 gui=bold guibg=#6600cc guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=#c0c0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#92d4ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#ffc890
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#40f8f8
    CSAHi helpLeadBlank term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=232 ctermfg=251 gui=NONE guibg=#0d0d0d guifg=#c8c8c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=251 gui=NONE guibg=#212121 guifg=#c8c8c8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=#064d08 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=136 ctermfg=255 gui=NONE guibg=#714b00 guifg=#f0f0f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=131 ctermfg=131 gui=NONE guibg=#701d1d guifg=#701d1d
    CSAHi DiffText term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#1a1800 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#303030 guifg=#f0f0f0
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#141414 guifg=#f0f0f0
    CSAHi lv2c term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#43cd80
    CSAHi op_lv3 term=NONE cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#cd6600
    CSAHi lv3c term=NONE cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#cd6600
    CSAHi op_lv4 term=NONE cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=#3a5fcd
    CSAHi lv4c term=NONE cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=#3a5fcd
    CSAHi lv1c term=NONE cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=#b22222
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#dcdc78
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=#f0f0f0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi Error term=reverse cterm=bold ctermbg=93 ctermfg=231 gui=bold guibg=#8000ff guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=212 gui=bold,underline guibg=bg guifg=#ff80d0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=105 gui=bold guibg=bg guifg=#8888ff
    CSAHi NonText term=bold cterm=bold ctermbg=232 ctermfg=167 gui=bold guibg=#0b0b0b guifg=#d84070
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=54 ctermfg=177 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=99 ctermfg=85 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=243 gui=NONE guibg=#0e0e0e guifg=#727272
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0a0a0a guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=212 gui=undercurl guibg=bg guifg=fg guisp=#ff99cc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=95 ctermfg=255 gui=NONE guibg=#903d3d guifg=#f0f0f0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=131 ctermfg=231 gui=NONE guibg=#bf4545 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=131 ctermfg=255 gui=NONE guibg=#b67171 guifg=#f0f0f0
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#111111 guifg=fg
    CSAHi helpNormal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi helpGraphic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=53 ctermfg=188 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#909090 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=233 ctermfg=246 gui=NONE guibg=#111111 guifg=#909090
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f0f0f0
    CSAHi Visual term=reverse cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=211 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi CtrlPLinePre term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=#141414
    CSAHi lv1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi op_lv1 term=NONE cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=#b22222
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv2 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv3 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv4 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi op_lv2 term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#43cd80
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#111111 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=89 ctermfg=231 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=bold ctermbg=56 ctermfg=231 gui=bold guibg=#6600cc guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=#c0c0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#92d4ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#ffc890
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40f8f8
    CSAHi helpLeadBlank term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=232 ctermfg=251 gui=NONE guibg=#0d0d0d guifg=#c8c8c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=251 gui=NONE guibg=#212121 guifg=#c8c8c8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#064d08 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=58 ctermfg=255 gui=NONE guibg=#714b00 guifg=#f0f0f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#701d1d guifg=#701d1d
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1a1800 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#303030 guifg=#f0f0f0
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=#141414 guifg=#f0f0f0
    CSAHi lv2c term=NONE cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#43cd80
    CSAHi op_lv3 term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#cd6600
    CSAHi lv3c term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#cd6600
    CSAHi op_lv4 term=NONE cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#3a5fcd
    CSAHi lv4c term=NONE cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#3a5fcd
    CSAHi lv1c term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#b22222
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#dcdc78
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#ffa8ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=87 gui=underline guibg=bg guifg=#f0f0f0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#141414
    CSAHi Error term=reverse cterm=bold ctermbg=35 ctermfg=79 gui=bold guibg=#8000ff guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=70 gui=bold,underline guibg=bg guifg=#ff80d0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=#8888ff
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=49 gui=bold guibg=#0b0b0b guifg=#d84070
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#c8c8ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=33 ctermfg=79 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=17 ctermfg=55 gui=bold guibg=#430075 guifg=#cc99ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=35 ctermfg=46 gui=bold guibg=#8040ff guifg=#70ffc0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=43 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=82 gui=NONE guibg=#0e0e0e guifg=#727272
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi IndentGuidesOdd term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0a0a0a guifg=fg
    CSAHi IndentGuidesEven term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0d0d0d guifg=fg
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=70 gui=undercurl guibg=bg guifg=fg guisp=#ff99cc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=32 ctermfg=87 gui=NONE guibg=#903d3d guifg=#f0f0f0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#bf4545 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=53 ctermfg=87 gui=NONE guibg=#b67171 guifg=#f0f0f0
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=84 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#111111 guifg=fg
    CSAHi helpNormal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi helpGraphic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=bold,reverse cterm=NONE ctermbg=32 ctermfg=86 gui=NONE guibg=#602040 guifg=#d6d6d6
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#909090 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#111111 guifg=#909090
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=87 gui=bold guibg=bg guifg=#f0f0f0
    CSAHi Visual term=reverse cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#7c2b7c guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=70 ctermfg=16 gui=NONE guibg=#ff80c0 guifg=#000000
    CSAHi CtrlPLinePre term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#141414
    CSAHi lv1 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi op_lv1 term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#b22222
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv2 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv3 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lv4 term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi op_lv2 term=NONE cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#43cd80
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#111111 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=33 ctermfg=79 gui=bold guibg=#99004c guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=bold ctermbg=34 ctermfg=79 gui=bold guibg=#6600cc guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#c0c0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#92d4ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffc890
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#40f8f8
    CSAHi helpLeadBlank term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=58 gui=NONE guibg=#0d0d0d guifg=#c8c8c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#212121 guifg=#c8c8c8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=fg gui=NONE guibg=#064d08 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=36 ctermfg=87 gui=NONE guibg=#714b00 guifg=#f0f0f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=32 ctermfg=32 gui=NONE guibg=#701d1d guifg=#701d1d
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1a1800 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#303030 guifg=#f0f0f0
    CSAHi Conceal term=NONE cterm=NONE ctermbg=84 ctermfg=86 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=28 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
endif

if 1
    delcommand CSAHi
endif
