set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set title
set history=10000
set autoread
set autowrite
set autowriteall
set hidden
set backspace=indent,eol,start
set undolevels=10000
set undoreload=10000
set completeopt=menuone,longest,preview
syntax enable
set number
set relativenumber
set ruler
set laststatus=2
set showcmd
set showmatch
set cmdheight=2
set scrolloff=20
set sidescrolloff=15
set showmode
set showbreak=\ \ \ \ \ \ \ \ 
set list
set listchars=tab:▸.,trail:·,extends:>,precedes:<,nbsp:␣,conceal:·,
set wrap
set wrapscan
set linebreak
colorscheme darkmath
highlight Comment cterm=italic "Note: this overrides the colorscheme default
set colorcolumn=80
set cursorline
set mouse=a
set clipboard=unnamedplus
set ttyfast
set ttymouse=xterm2
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildmenu
set wildmode=longest,list,full
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set linebreak
set foldmethod=indent
set foldlevel=99
set foldenable
set foldmethod=marker
set foldmarker={,}
set undolevels=10000
set undoreload=10000
set undodir=~/.vim/undo
set undofile
set backup
set backupdir=~/.vim/backup
set writebackup
set backupcopy=yes
set backupext=.bak

" Check if the statusline is supported and either the terminal has more than 2
" colors or the GUI is running.
if has('statusline') && &t_Co > 2 || has('gui_running')
  "----------------------------------------------------------------------------
  " Define the ruler format (displayed only when the statusline is disabled).
  " The ruler displays:
  "   - A fixed width of 100 characters.
  "   - Byte count and file size.
  "   - Starting and current line numbers, and total lines.
  "   - Number of lines selected.
  "   - Current column (and virtual column).
  "   - Page numbers (current and total).
  "   - Word count.
  "   - Percentage through the file.
  "----------------------------------------------------------------------------
  let &rulerformat="%100(%=%*%)"                                                 " Set ruler width to 100 characters
  let &rulerformat.=" Byte %o/%{getfsize(expand(@%))},"                          " Current byte position and total file size
  let &rulerformat.=" Line %{line('.')}/%L,"                                     " Current line number / total lines
  let &rulerformat.=" Col %c%V,"                                                 " Current column and virtual column
  let &rulerformat.=" Pg %(%{winheight(0) ? line('.') / winheight(0) + 1 : 0}%)" " Current page number
  let &rulerformat.=" /%(%{winheight(0) ? line('$') / winheight(0) + 1 : 0}%),"  " Total pages
  let &rulerformat.=" %{wordcount().words} Words"                                " Word count from document
  let &rulerformat.=" %5.P"                                                      " Percentage through file (5 characters wide)
  let &rulerformat.=" %*"                                                        " Reset highlighting
  "----------------------------------------------------------------------------
  " Define the statusline function. This function assembles various segments
  " with different colors and content.
  "----------------------------------------------------------------------------
  func s:StatusLine()                      " Define statusline function
    set statusline=                      " Reset statusline to empty
    "--------------------------------------------------------------------------
    " Segment 1: Full file path with optional flags (User1 color)
    " - Limits filename display to ~65 characters.
    " - Note: The '%(%m%r%)' adds an extra 0-7 characters.
    "--------------------------------------------------------------------------
    let &statusline.="%*"                                                         " Switch to default color
    let &statusline.="%<"                                                         " Truncate statusbar lines here
    "let &statusline.=" d=%-6b"                                                   " Display decimal value of current character (6 width)
    "let &statusline.=" ┃"                                                        " Vertical separator character
    "let &statusline.=" h=%-6B"                                                   " Display hex value of current character (6 width)
    "let &statusline.=" ┃"                                                        " Vertical separator character
    "let &statusline.=" o=%{printf('%-6o', char2nr(getline('.')[col('.') - 1]))}" " Display octal value
    "let &statusline.=" %*"                                                       " Reset color
    "--------------------------------------------------------------------------
    " Segment 2: File format and file encoding (User2 color)
    " - Shows file format and encoding (or '(none)' if not set).
    " - (String length analysis work in progress)
    "--------------------------------------------------------------------------
    let &statusline.="%*"                                            " Switch to default highlight group
    let &statusline.=" %{&ff} > %{strlen(&fenc) ? &fenc : '(none)'}" " File format and encoding
    let &statusline.=" %*"                                           " Reset color
    "--------------------------------------------------------------------------
    " Segment 3: File type (User3 color)
    " - Displays the file type, limited to 20 characters (22 with spacers).
    " - This accounts for long filetype names like 'upstreaminstalllog'.
    "--------------------------------------------------------------------------
    let &statusline.="%*"               " Switch to default highlight group
    let &statusline.=" %.20{&filetype}" " Display filetype (max 20 chars)
    let &statusline.=" %*"              " Reset color
    "--------------------------------------------------------------------------
    " Segment 4: Character info (Default color)
    " - Shows decimal, hex, and octal values of the character under the cursor.
    " - Notes:
    "     * Maximum Unicode value is U+10FFFF (decimal 1114111).
    "     * Maximum octal is 4177777.
    "     * With octal, segment length is 34 characters (36 with spacers).
    "     * Without octal, segment length is 22 characters (24 with spacers).
    "     * Total segment length is either 34 or 56 characters (36 or 58 with
    "       spacers).
    "--------------------------------------------------------------------------
    let &statusline.="%*"                                                       " Switch to default color
    let &statusline.=" d=%-2b"                                                  " Decimal character code
    "let &statusline.=" ┃"                                                      " Vertical separator
    let &statusline.=" 0x%-2B"                                                  " Hex character code
    "let &statusline.=" ┃"                                                      " Vertical separator
    let &statusline.=" 0%{printf('%-2o', char2nr(getline('.')[col('.') - 1]))}" " Octal character code
    "let &statusline.=" %*"                                                     " Reset color
    let &statusline.="%*%=" " Right-align following content
    "--------------------------------------------------------------------------
    " Append the ruler to the statusline if it is enabled.
    "--------------------------------------------------------------------------
    if &ruler                                   " Check if ruler option is enabled
      let &statusline.=&rulerformat             " Append rulerformat to statusline
    endif
  endfunc                                       " End of StatusLine function
  call s:StatusLine()                           " Set initial statusline configuration
  if has('autocmd')                             " Check if autocommands are available
    autocmd OptionSet ruler call s:StatusLine() " Update statusline when ruler changes
  endif
endif                                           " End of initial if condition

" ==================================================
" Snippets
" ==================================================

" -------------------------------
" C Snippets"
" -------------------------------

function! MainSnippet()
    call append('.', [
        \ '#include <stdio.h>',
        \ '',
        \ 'int main() {',
        \ '    ',
        \ '    return 0;',
        \ '}'
        \ ])
endfunction

function! MakeCommentedFunction(type, name)
    let function_snippet = [
        \ '/*',
        \ ' * TODO: ' . a:name . '() description',
        \ ' */',
        \ '',
        \ a:type . ' ' . a:name . '( /*args*/ ) {',
        \ '  // TODO: implementation',
        \ '',
        \ '} /* ' . a:name . '() */'
        \ ]

    " Append the function snippet to the current buffer at the cursor position
    call append(line('.'), function_snippet)
endfunction

" Define a command :Func to call the function
command! -nargs=+ Func call MakeCommentedFunction(<f-args>)

function! ForSnippet()
    call append('.', [
        \ 'for (int i = 0; i < ; i++) {',
        \ '    ',
        \ '}'
        \ ])
endfunction

function! SwitchSnippet() " TODO: Add functionality for putting an argument for the number of cases"
    call append('.', [
        \ 'switch () {',
        \ '    case :',
        \ '        break;',
        \ '    default:',
        \ '}'
        \ ])
endfunction

function! StructSnippet()
    call append('.', [
        \ 'typedef struct  {',
        \ '    ',
        \ '}'
        \ ])
endfunction

function! ReadFileSnippet()
    call append('.', [
        \ 'FILE *file = fopen("", "r");',
        \ 'if (file == NULL) {',
        \ '    printf("Error opening file");',
        \ '    return 1;',
        \ '}',
        \ 'char line[100];',
        \ 'while (fgets(line, 100, file) != NULL) {',
        \ '    printf("%s", line);',
        \ '}',
        \ 'fclose(file);'
        \ ])
endfunction

function! WriteFileSnippet()
    call append('.', [
        \ 'FILE *file = fopen("", "w");',
        \ 'if (file == NULL) {',
        \ '    printf("Error opening file");',
        \ '    return 1;',
        \ '}',
        \ 'fprintf(file, "");',
        \ 'fclose(file);'
        \ ])
endfunction

function! AppendFileSnippet()
    call append('.', [
        \ 'FILE *file = fopen("", "a");',
        \ 'if (file == NULL) {',
        \ '    printf("Error opening file");',
        \ '    return 1;',
        \ '}',
        \ 'fprintf(file, "");',
        \ 'fclose(file);'
        \ ])
endfunction


" Define commands for C files
autocmd FileType c command! Main call MainSnippet()
autocmd FileType c command! For call ForSnippet()
autocmd FileType c command! Switch call SwitchSnippet()
autocmd FileType c command! Struct call StructSnippet()
autocmd FileType c command! ReadFile call ReadFileSnippet()
autocmd FileType c command! WriteFile call WriteFileSnippet()
autocmd FileType c command! AppendFile call AppendFileSnippet()

" -------------------------------
" Java snippets"
" -------------------------------

function! MainclassSnippet()
    call append('.', [
        \ 'public class Main {',
        \ '    public static void main(String[] args) {',
        \ '        ',
        \ '    }',
        \ '}'
        \ ])
endfunction

function! MainmethodSnippet()
    call append('.', [
        \ 'public static void main(String[] args) {',
        \ '    ',
        \ '}'
        \ ])
endfunction

function! SoutSnippet()
    call append('.', 'System.out.println();')
endfunction


" Define commands for Java files
autocmd FileType java command! Mainclass call MainclassSnippet()
autocmd FileType java command! Mainmethod call MainmethodSnippet()
autocmd FileType java command! Sout call SoutSnippet()

" -------------------------------
" Markdown snippets"
" -------------------------------

function! FormatMarkdownTable()

  " Get start and end lines of table
  let start_line = line('.')
  while getline(start_line) !~ '^\\table$' && start_line > 0
    let start_line -= 1
  endwhile
  let end_line = line('.')
  while getline(end_line) !~ '^\\endtable$' && end_line <= line('$')
    let end_line += 1
  endwhile

  " Validate table boundaries
  if start_line == 0 || end_line > line('$')
    echo "No valid table found!"
    return
  endif

  " Get table content
  let lines = getline(start_line + 1, end_line - 1)
  let table = []

  " Process each line into columns
  for line in lines

    "" Skip empty lines
    "if line =~ '^\s*$'
    "  continue
    "endif

    " Split line by 4 or more spaces
    let columns = split(line, '\s\{4,\}')

    " Trim whitespace from each column
    call map(columns, 'trim(v:val)')
    call add(table, columns)
  endfor

  " Find maximum width for each column
  let col_count = max(map(copy(table), 'len(v:val)'))
  let col_widths = repeat([0], col_count)

  for row in table
    for i in range(len(row))
      let col_widths[i] = max([col_widths[i], strlen(row[i])])
    endfor
  endfor

  " Format table rows
  let output = []
  let header_sep = '|'
  for i in range(len(table))
    let row = table[i]
    let formatted = '|'

    " Pad each column to match max width
    for j in range(col_count)
      let content = get(row, j, '')
      let formatted .= ' ' . printf('%-*s', col_widths[j], content) . ' |'
      if i == 0
        let header_sep .= '-' . repeat('-', col_widths[j]) . '-|'
      endif
    endfor
    call add(output, formatted)
    if i == 0
      call add(output, header_sep)
    endif
  endfor

  " Replace the table content
  call setline(start_line + 1, output)
  call deletebufline('%', start_line + len(output) + 1, end_line - 1)
  call append(start_line + len(output), '\endtable')
endfunction

" Autoformat markdown tables when using :Reformat (not working)
function! ReformatMarkdownTables()

  " Save cursor position
  let l:save_cursor = getpos(".")

  " Move to the start of the file
  normal! gg

  " Search for tables using a regex pattern and format them
  let l:start = 0
  let l:end = 0
  let l:lines = []
  while search('^|.*|$', 'W')
    if l:start == 0
      let l:start = line('.')
    endif
    let l:end = line('.')
    let l:lines += [getline('.')]
    if getline(line('.') + 1) !~ '^|.*|$'
      call ReformatTable(l:start, l:end, l:lines)
      let l:start = 0
      let l:end = 0
      let l:lines = []
    endif
  endwhile

  " Restore cursor position
  call setpos(".", l:save_cursor)
endfunction

function! ReformatTable(start, end, lines)

  " Split lines into columns
  let l:rows = map(copy(a:lines), 'split(v:val, "\s*|\s*")')
  let l:rows = map(l:rows, 'filter(v:val, "v:val != \"\"")')

  " Compute column widths
  let l:col_widths = []
  for l:row in l:rows
    for l:i in range(len(l:row))
      let l:col_widths[l:i] = max([get(l:col_widths, l:i, 0), strdisplaywidth(l:row[l:i])])
    endfor
  endfor

  " Format the table
  let l:formatted = []
  for l:row in l:rows
    let l:formatted += ['| ' . join(map(copy(l:row), 'printf("%-" . l:col_widths[v:key] . "s", v:val)'), ' | ') . ' |']
  endfor

  " Replace original table in buffer
  call setline(a:start, l:formatted)
endfunction

" Define commands for Markdown files
autocmd FileType markdown command! FormatTable call FormatMarkdownTable()
"autocmd FileType markdown command! Reformat call ReformatMarkdownTables() " Down for maintenance
