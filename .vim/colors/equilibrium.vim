" Equilibrium - A scientifically optimized color scheme for clarity and comfort
" Balances contrast without harshness, using soft gradients and color theory

" Background & Base Text
highlight Normal guifg=#D8DEE9 guibg=#1C1E26 ctermfg=253 ctermbg=0  " Soft light blue-gray on deep dark blue
highlight Comment guifg=#6272A4 gui=italic ctermfg=103              " Muted periwinkle (italic for differentiation)

" Code Semantics - Optimized readability & categorization
highlight String guifg=#A3BE8C ctermfg=114               " Soft green for strings (soothing, but noticeable)
highlight Keyword guifg=#E27878 gui=bold ctermfg=167     " Warm coral red (high-contrast for readability)
highlight Function guifg=#88C0D0 gui=bold ctermfg=110    " Cool cyan-blue, distinct and bold
highlight Type guifg=#B48EAD ctermfg=139                 " Muted pink-lavender for balance
highlight Constant guifg=#D08770 ctermfg=173             " Warm orange, distinct from function/keyword
highlight Identifier guifg=#81A1C1 gui=bold ctermfg=109  " Muted blue for easy tracking of variables
highlight Statement guifg=#BF616A ctermfg=131            " Deep red-pink for control flow

" Preprocessor & Special
highlight PreProc guifg=#B48EAD ctermfg=139          " Muted pink-lavender (subtle, no bold)
highlight Special guifg=#EBCB8B ctermfg=221          " Soft gold for special symbols
highlight Error guifg=#BF616A ctermfg=131            " Deep red-pink for errors (consistent)
highlight Todo guifg=#EBCB8B guibg=NONE ctermfg=221  " Bright gold TODOs (stands out naturally)

" UI Elements - Muted for comfort
highlight LineNr guifg=#4C566A ctermfg=60         " Faded steel blue line numbers
highlight CursorLineNr guifg=#81A1C1 ctermfg=109  " Softer blue for current line
highlight CursorLine guibg=#2E3440 ctermbg=237    " Very dark blue-gray (gentle contrast)
highlight CursorColumn guibg=#2E3440 ctermbg=237  " Same as CursorLine
highlight Visual guibg=#3B4252 ctermbg=238        " Slightly brighter gray-blue for selection

" Menus & Status
highlight Pmenu guibg=#2E3440 ctermbg=237       " Dark steel blue-gray menu
highlight PmenuSel guibg=#4C566A ctermbg=60     " Brighter menu selection
highlight StatusLine guibg=#5E81AC ctermbg=110  " Muted blue for contrast
highlight VertSplit guifg=#3B4252 ctermfg=238   " Subtle split line visibility

" Helper elements - Faded for non-essential UI components
highlight NonText guifg=#4C566A ctermfg=60     " Dimmed steel blue for non-text
highlight Folded guifg=#7E8AA2 ctermfg=103     " Similar to comments for folded code
highlight SpecialKey guifg=#4C566A ctermfg=60  " Dimmed blue for special keys

" Code hierarchy - Controlled boldness for clarity
highlight! link Directory Identifier  " Bold muted blue for directories
highlight! link Title Function        " Titles use function blue (bold)