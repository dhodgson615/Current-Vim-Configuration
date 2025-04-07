" Purplish Color Scheme - Calming purple variants with focused elements
" Maintains no highlighting (no bg colors/reverse) except UI elements
" Emphasizes code structure through color weight and boldness

" Base colors
highlight Normal       guifg=#E6E6FA guibg=#1a1a2a ctermfg=255 ctermbg=0  " Soft lavender on black background
highlight Comment      guifg=#9370DB gui=italic ctermfg=98                " Medium purple (italicized)

" Code semantics - Unique identifiable colors
highlight String       guifg=#DB7093 ctermfg=168           " Rosy pink for strings
highlight Keyword      guifg=#B0A4E3 ctermfg=146           " Muted lavender for control flow
highlight Function     guifg=#FF80FF gui=bold ctermfg=213  " Bold bright magenta for functions
highlight Type         guifg=#6A5ACD ctermfg=62            " Slate blue for types
highlight Constant     guifg=#FFB6C1 ctermfg=218           " Soft pink for constants
highlight Identifier   guifg=#8A2BE2 gui=bold ctermfg=92   " Bold blue violet for variables
highlight Statement    guifg=#C8A2C8 ctermfg=182           " Lilac for statements (less prominent)

" Preprocessor & special
highlight PreProc      guifg=#9370DB ctermfg=98              " Medium purple (no bold for #defines)
highlight Special      guifg=#DA70D6 ctermfg=170             " Orchid for special chars
highlight Error        guifg=#8B0000 ctermfg=88              " Dark red (calmer than bright red)
highlight Todo         guifg=#FF69B4 guibg=NONE ctermfg=205  " Hot pink todos (no bg)

" UI Elements (muted purples)
highlight LineNr       guifg=#7E7EB8 ctermfg=103  " Grey-purple line numbers
highlight CursorLineNr guifg=#B19CD9 ctermfg=146  " Light purple current line
highlight CursorLine   guibg=#2A2A4A ctermbg=235  " Subtle dark purple
highlight CursorColumn guibg=#2A2A4A ctermbg=235  " Subtle dark purple
highlight Visual       guibg=#3D3D5F ctermbg=237  " Darker purple for visual selection

" Menus & status
highlight Pmenu        guibg=#2A2A4A ctermbg=235  " Dark purple menu
highlight PmenuSel     guibg=#4A4A7F ctermbg=239  " Brighter selection
highlight StatusLine   guibg=#7D6A3F ctermbg=200  " Status line contrast
highlight VertSplit    guifg=#3D3D5F ctermfg=237  " Muted split lines

" Helper elements (faded)
highlight NonText      guifg=#5A5A8C ctermfg=60  " Dimmed non-text chars
highlight Folded       guifg=#7E7EB8 ctermfg=103 " Matching line nums
highlight SpecialKey   guifg=#5A5A8C ctermfg=60  " Dimmed special chars

" Code focus hierarchy - Bold for important elements
highlight! link Directory Identifier  " Bold violet for dirs
highlight! link Title Function        " Titles use function colors
