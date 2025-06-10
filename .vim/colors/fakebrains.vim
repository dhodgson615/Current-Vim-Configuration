" JetBrains-Darcula Color Scheme – Approximates JetBrains IDE “Default/Darcula”

" Base colors ---------------------------------------------------------------
highlight Normal       guifg=#A9B7C6 guibg=#2B2B2B ctermfg=145 ctermbg=236 " Soft grey‑blue on very dark grey
highlight Comment      guifg=#808080 gui=italic        ctermfg=244         " Neutral grey comments (italic)

" Code semantics ------------------------------------------------------------
highlight String       guifg=#6A8759              ctermfg=71              " Olive‑green strings
highlight Keyword      guifg=#CC7832              ctermfg=172             " Bright orange keywords / control flow
highlight Function     guifg=#FFC66D gui=bold     ctermfg=221             " Bold light‑gold functions & methods
highlight Type         guifg=#9876AA gui=bold     ctermfg=140             " Muted purple built‑in / user types
highlight Constant     guifg=#6897BB              ctermfg=110             " Steel‑blue numeric / constant literals
highlight Identifier   guifg=#A9B7C6 gui=bold     ctermfg=145             " Bold default‑tone identifiers
highlight Statement    guifg=#D2975B              ctermfg=173             " Softer orange/brown “statements”

" Preprocessor & special ----------------------------------------------------
highlight PreProc      guifg=#9876AA              ctermfg=140             " Same purple for #defines / imports
highlight Special      guifg=#6A8759              ctermfg=71              " Greenish specials (escape chars etc.)
highlight Error        guifg=#BC3F3C              ctermfg=160             " Calm red diagnostics
highlight Todo         guifg=#FFAF00 guibg=NONE   ctermfg=214             " Amber TODO / FIXME (no bg)

" UI elements (Darcula greys) ----------------------------------------------
highlight LineNr       guifg=#606366              ctermfg=241             " Dim line numbers
highlight CursorLineNr guifg=#CED2D9              ctermfg=252             " Lighter grey for current line number
highlight CursorLine   guibg=#323232              ctermbg=237             " Very dark grey line highlight
highlight CursorColumn guibg=#323232              ctermbg=237             " Same for column
highlight Visual       guibg=#3C3F41              ctermbg=239             " Slightly lighter selection block

" Menus & status ------------------------------------------------------------
highlight Pmenu        guibg=#323232              ctermbg=237             " Popup menu background
highlight PmenuSel     guibg=#214283              ctermbg=24              " Dark blue selection
highlight StatusLine   guibg=#484A4E              ctermbg=238             " Statusline contrast bar
highlight VertSplit    guifg=#3C3F41              ctermfg=239             " Divider lines

" Helper elements -----------------------------------------------------------
highlight NonText      guifg=#4E4E4E              ctermfg=240             " Invisible‑char markers
highlight Folded       guifg=#808080              ctermfg=244             " Fold headers
highlight SpecialKey   guifg=#4E4E4E              ctermfg=240             " Tab/nbsp indicators

" Code focus hierarchy ------------------------------------------------------
highlight! link Directory Identifier   " Bold identifiers for directory names
highlight! link Title     Function     " Section titles match function color
