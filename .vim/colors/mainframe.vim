" Mainframe - A fun movie hacker theme for unrealistic mainframe hacking
" Inspired by neon-drenched, Hollywood-style hacking scenes

" Base Colors
highlight Normal       guifg=#33FF33 guibg=#000000 ctermfg=82 ctermbg=0  " Neon green text on a pitch-black background
highlight Comment      guifg=#008000 gui=italic guibg=NONE ctermfg=28    " Dark green italic for comments

" Code Semantics
highlight String       guifg=#FF00FF guibg=NONE ctermfg=13           " Bold magenta for strings
highlight Keyword      guifg=#FFFF00 gui=bold guibg=NONE ctermfg=11  " Bright yellow for keywords
highlight Function     guifg=#00FFFF gui=bold guibg=NONE ctermfg=14  " Cool cyan for function names
highlight Type         guifg=#FF4500 guibg=NONE ctermfg=202          " Vibrant orange red for types
highlight Constant     guifg=#FF1493 guibg=NONE ctermfg=13           " Deep pink for constants
highlight Identifier   guifg=#33FF33 guibg=NONE gui=NONE ctermfg=82  " Identifiers retain the neon green
highlight Statement    guifg=#FFD700 guibg=NONE ctermfg=11           " Gold for statements (commands/control flow)

" Preprocessor & Special Symbols
highlight PreProc      guifg=#7FFF00 guibg=NONE ctermfg=10  " Chartreuse for preprocessor directives
highlight Special      guifg=#00FF7F guibg=NONE ctermfg=14  " Spring green for special characters
highlight Error        guifg=#FF0000 guibg=NONE ctermfg=9   " Bright red to highlight errors
highlight Todo         guifg=#FF00FF guibg=NONE ctermfg=13  " Magenta for TODO items

" UI Elements
highlight LineNr       guifg=#006400 guibg=NONE ctermfg=22  " Dark green for line numbers
highlight CursorLineNr guifg=#ADFF2F guibg=NONE ctermfg=10  " Luminous light green for current line number
highlight CursorLine   guibg=#001100 ctermbg=0              " Very dark green overlay for the current line
highlight CursorColumn guibg=#001100 ctermbg=0              " Matching current column
highlight Visual       guibg=#003300 ctermbg=22             " Dark green for visual selection

" Menus & Status Bar
highlight Pmenu        guibg=#001100 ctermbg=0                                      " Dark background for popup menus
highlight PmenuSel     guibg=#004400 ctermbg=22  " Brighter green for selected menu items
highlight StatusLine   guibg=#001100 ctermbg=0   " Status line matching the overall theme
highlight VertSplit    guifg=#003300 ctermfg=22  " Subtle green split lines

" Helper Elements
highlight NonText      guifg=#003300 guibg=NONE ctermfg=22                          " Dimmed markers for non-text characters
highlight Folded       guifg=#006400 guibg=NONE ctermfg=22                          " Folded text markers in dark green
highlight SpecialKey   guifg=#003300 guibg=NONE ctermfg=22                          " Dim special keys