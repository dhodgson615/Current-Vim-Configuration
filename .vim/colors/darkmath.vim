" Darkmath - A mathematically precise dark mode color scheme
" Only variable names (Identifier) are italicized for clarity

" Base Colors
highlight Normal       guifg=#DCDCCC guibg=#1e1e1e ctermfg=252 ctermbg=0  " Off-white text on dark background
highlight Comment      guifg=#707070 guibg=NONE ctermfg=244               " Subtle gray for comments (non-italic)

" Code Semantics
highlight String       guifg=#8FBC8F guibg=NONE ctermfg=108             " Muted green for strings
highlight Keyword      guifg=#7E9CD8 guibg=NONE ctermfg=110             " Calm blue for keywords
highlight Function     guifg=#DFAF8F guibg=NONE ctermfg=180             " Warm tone for functions (non-italic)
highlight Type         guifg=#7CB8BB guibg=NONE ctermfg=110             " Balanced cyan for types
highlight Constant     guifg=#DFAF8F guibg=NONE ctermfg=180             " Warm tone for constants
highlight Identifier   guifg=#F0DFAF guibg=NONE gui=italic ctermfg=186  " Variables: exclusively italicized
highlight Statement    guifg=#C6DEC1 guibg=NONE ctermfg=152             " Soft cyan for statements

" Preprocessor & Special Symbols
highlight PreProc      guifg=#7E9CD8 guibg=NONE ctermfg=110  " Matching keyword tone
highlight Special      guifg=#D0BF8F guibg=NONE ctermfg=180  " Subtle special characters
highlight Error        guifg=#FF5F5F guibg=NONE ctermfg=203  " Noticeable error highlighting
highlight Todo         guifg=#FF00FF guibg=NONE ctermfg=201  " Bright magenta for TODO items

" UI Elements
highlight LineNr       guifg=#505050 guibg=NONE ctermfg=244  " Faded line numbers
highlight CursorLineNr guifg=#DCDCCC guibg=NONE ctermfg=252  " Highlighted current line number
highlight CursorLine   guibg=#2a2a2a ctermbg=236             " Slightly lighter background for current line
highlight CursorColumn guibg=#2a2a2a ctermbg=236             " Same for current column
highlight Visual       guibg=#444444 ctermbg=238             " Subtle visual selection

" Menus & Status Bar
highlight Pmenu        guibg=#2a2a2a ctermbg=236  " Popup menu background
highlight PmenuSel     guibg=#505050 ctermbg=244  " Selected menu item
highlight StatusLine   guibg=#3a3a3a ctermbg=238  " Status line with moderate contrast
highlight VertSplit    guifg=#3a3a3a ctermfg=238  " Subtle split line

" Helper Elements
highlight NonText      guifg=#404040 guibg=NONE ctermfg=239  " Non-text characters
highlight Folded       guifg=#707070 guibg=NONE ctermfg=244  " Folded text markers
highlight SpecialKey   guifg=#404040 guibg=NONE ctermfg=239  " Dimmed special keys

" Code Hierarchy Linking (for consistency)
highlight! link Directory Identifier  " Directories styled like variables (italicized)
highlight! link Title Function        " Titles inherit function styling
