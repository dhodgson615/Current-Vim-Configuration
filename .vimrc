
" ==================================================
" Vim Configuration File (.vimrc)
" ==================================================

        " -------------------------------
        " 1. Basic Settings
        " -------------------------------

                set nocompatible                         " Use Vim defaults
                set encoding=utf-8                       " Set default encoding to UTF-8
                set fileencoding=utf-8                   " Set file encoding to UTF-8
                set title                                " Show filename in terminal title bar
                set history=10000                        " Increase command history size
                set autoread                             " Reload file automatically if changed outside Vim
                set autowrite                            " Automatically save when switching buffers
                set autowriteall                         " Write all buffers when quitting
                set hidden                               " Allow switching buffers without saving
                set backspace=indent,eol,start           " Allow backspacing over autoindent, line breaks, etc.
                set undolevels=10000                     " Maximum number of changes that can be undone
                set undoreload=10000                     " Maximum number of lines to save for undo on reload
                set completeopt=menuone,longest,preview  " Set completion options

        " -------------------------------
        " 2. User Interface Enhancements
        " -------------------------------

                syntax enable                                                       " Enable syntax highlighting
                set number                                                          " Show absolute line numbers
                set relativenumber                                                  " Show relative line numbers for navigation
                set ruler                                                           " Always display the cursor position
                set laststatus=2                                                    " Always show the status line
                set showcmd                                                         " Display incomplete commands in the status line
                set showmatch                                                       " Highlight matching brackets/parentheses
                set cmdheight=2                                                     " Increase command-line height to 2 lines
                set scrolloff=20                                                    " Keep 20 lines visible above/below the cursor
                set sidescrolloff=15                                                " Keep 15 columns visible to the left/right of the cursor
                set showmode                                                        " Show current mode (e.g., -- INSERT --)
                set showbreak=++                                                    " Display ++ at the end of the window when lines wrap
                set list                                                            " Show invisible characters
                set listchars=tab:▸.,trail:·,extends:>,precedes:<,nbsp:␣,conceal:·, " Customize invisible characters
                set wrap                                                            " Visually wrap long lines
                set wrapscan                                                        " Allow searches to wrap around the file
                set linebreak                                                       " Break lines at word boundaries
                colorscheme desert                                                  " Set preferred color scheme
                highlight Comment cterm=italic                                      " Display comments in italic
                set colorcolumn=80                                                  " Highlight the 80th column as a guide
                set cursorline                                                      " Highlight the current line

        " -------------------------------
        " 3. Mouse, Clipboard & Terminal
        " -------------------------------

                set mouse=a               " Enable mouse in all modes
                set clipboard=unnamedplus " Use system clipboard for copy-paste
                set ttyfast               " Optimize for fast terminal connections
                set ttymouse=xterm2       " Enable mouse support in terminal

        " -------------------------------
        " 4. Search and Command Options
        " -------------------------------

                set ignorecase                 " Case-insensitive searching
                set smartcase                  " Enable case-sensitive search if uppercase is used
                set incsearch                  " Show incremental search matches as you type
                set hlsearch                   " Highlight all search matches
                set wildmenu                   " Enable the enhanced command-line completion
                set wildmode=longest,list,full " Configure wildmenu behavior

        " -------------------------------
        " 5. Indentation and Formatting
        " -------------------------------

                set autoindent   " Continue indentation on new lines
                set smartindent  " Intelligent indentation for code
                set smarttab     " Make tab operations smarter
                set expandtab    " Convert tabs to spaces
                set tabstop=2    " A tab is displayed as 2 spaces
                set shiftwidth=2 " Indentation level for autoindent is 2 spaces
                set linebreak    " Break lines at word boundaries

        " -------------------------------
        " 6. Code Folding
        " -------------------------------

                set foldmethod=indent " Fold code based on indentation level
                set foldlevel=99      " Open most folds by default (reduce for more folding)
                set foldenable        " Enable folding
                set foldmethod=marker " Fold based on markers (e.g., { and })
                set foldmarker={,}    " Custom fold markers for code folding

        " -------------------------------
        " 7. Undo, Backup, and Swap Files
        " -------------------------------

                set undolevels=1000         " Increase number of undo levels
                set undoreload=10000        " Preserve undo history on reload
                set undodir=~/.vim/undo     " Directory to store undo history
                set undofile                " Save undo history to a file
                set backup                  " Enable backup files
                set backupdir=~/.vim/backup " Directory for backup files
                set writebackup             " Write backups before overwriting files
                set backupcopy=yes          " Copy files to backup directory instead of renaming
                set backupext=.bak          " Set backup file extension

        " -------------------------------
        " 8. Custom Status Line
        " -------------------------------

                if has('statusline') && &t_Co > 2 || has('gui_running')

                    " Define the ruler (only shows up when the status line is disabled)
                    " Ruler contents: byte, line, lines selected, column
                    "                 page number, words, and percentage
                    let &rulerformat="%100(%=%*%)" " Set ruler width to 100 characters
                    let &rulerformat.=" Byte %o/%{getfsize(expand(@%))},"
                    let &rulerformat.=" Line %{line('v')}-%{line('.')}/%L,"
                    let &rulerformat.=" L.Sel. %{abs(line('.') - line('v')) + 1},"
                    let &rulerformat.=" Col %c%V,"
                    let &rulerformat.=" Pg %(%{winheight(0) ? line('.') / winheight(0) + 1 : 0}%)"
                    let &rulerformat.=" /%(%{winheight(0) ? line('$') / winheight(0) + 1 : 0}%),"
                    let &rulerformat.=" %{wordcount().words} Words"
                    let &rulerformat.=" %5.P"
                    let &rulerformat.=" %*"

                    " Define the statusline
                    func s:StatusLine()

                        " Clear current status line
                        set statusline=

                        " Set color to User1, add full file path with optional flags.
                        " An arbitrary length of 65 characters for the filename is good
                        " enough. Most filesystem filenames support 255 ASCII characters.
                        " Note that technically the filename includes the file extension string.
                        " The part `%(%m%r%)` takes up an extra 0-7 characters.
                        " The segment totals 65-72 characters (67-74 with spacers included).
                        let &statusline.="%*"
                        let &statusline.="%<" " Truncate statusbar lines here.
                        let &statusline.=" d=%-7b"
                        let &statusline.=" ┃"
                        let &statusline.=" h=%-6B"
                        let &statusline.=" ┃"
                        let &statusline.=" o=%{printf('%-7o', char2nr(getline('.')[col('.') - 1]))}"
                        let &statusline.=" %*"

                        " Set color to User2, add file format, then file encoding
                        " (String length analysis WIP)
                        let &statusline.="%2*"
                        let &statusline.=" %{&ff} > %{strlen(&fenc) ? &fenc : '(none)'}"
                        let &statusline.=" %*"

                        " Set color to User3, add file type if available
                        " Because the longest filetype name is `upstreaminstalllog`, it seems
                        " like the string limit and segment length should be 20 characters
                        " (22 with spacers included).
                        let &statusline.="%3*"
                        let &statusline.=" %.20{&filetype}"
                        let &statusline.=" %*"

                        " Set color to Default, add dec, hex and octal of selected character. Note
                        " that U+10FFFF (or dec 1114111) is the maximum range of Unicode. And for
                        " octal it is 4177777. Those measure 34 fixed characters long. With octal
                        " off, it measures 22 fixed characters long. Total segment length is either
                        " 34 or 56 fixed characters long. (36 or 58 with spacers included).
                        let &statusline.="%*"
                        let &statusline.=" d=%-7b"
                        let &statusline.=" ┃"
                        let &statusline.=" h=%-6B"
                        let &statusline.=" ┃"
                        let &statusline.=" o=%{printf('%-7o', char2nr(getline('.')[col('.') - 1]))}"
                        let &statusline.=" %*"

                        " Set color to User4, add show keymap
                        let &statusline.="%4*"
                        let &statusline.=" <%k>"
                        let &statusline.=" %*"

                        " Separation point for right aligned items (using user3 colors)
                        let &statusline.="%*%="

                        " Add the ruler to the status bar when the ruler is enabled
                        if &ruler
                            let &statusline.=&rulerformat
                        endif
                    endfunc

                    " Initialize the status line
                    call s:StatusLine()

                    " Update the statusline when the ruler variable is toggled
                    if has('autocmd')
                        autocmd OptionSet ruler call s:StatusLine()
                    endif
                endif

" ==================================================
" End of Settings
" ==================================================

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

    " Skip empty lines
    if line =~ '^\s*$'
      continue
    endif

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
"autocmd FileType markdown command! Reformat call ReformatMarkdownTables()
