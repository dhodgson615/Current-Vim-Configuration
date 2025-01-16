syntax on
set title
set number
set mouse=a
set clipboard=unnamedplus
set incsearch
set hlsearch
set autoindent
set smartindent
set linebreak
set foldmethod=indent
set foldlevel=99
set foldenable
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/undo
set laststatus=2
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set nocompatible
set smartcase
set autoread
set backup
set backupdir=~/.vim/backup
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.o,*.obj,*.swp,*.class,*.pdf,*.zip,*.jpg,*.jpeg,*.png,*.gif
set scrolloff=10
set showcmd
set showmatch
set smartcase
set smarttab


"C Snippets"

function! MainSnippet()
    call append('.', [
            \ '#include <stdio.h>',
            \ '',
            \ 'int main() {',
            \ '    ',
            \ '    return 0;',
            \ '}'
            \ ])
    gg=G
endfunction

function! ForSnippet()
    call append('.', [
            \ 'for (int i = 0; i < ; i++) {',
            \ '    ',
            \ '}'
            \ ])
    gg=G
endfunction

function! SwitchSnippet() "TODO: Add functionality for putting an argument for the number of cases"
    call append('.', [
            \ 'switch () {',
            \ '    case :',
            \ '        break;',
            \ '    default:',
            \ '}'
            \ ])
    gg=G
endfunction

function! StructSnippet()
    call append('.', [
            \ 'typedef struct  {',
            \ '    ',
            \ '}'
            \ ])
    gg=G
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
    gg=G
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
    gg=G
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
    gg=G
endfunction

"Define commands for C files"
autocmd FileType c command! Main call MainSnippet()
autocmd FileType c command! For call ForSnippet()
autocmd FileType c command! Switch call SwitchSnippet()
autocmd FileType c command! Struct call StructSnippet()
autocmd FileType c command! ReadFile call ReadFileSnippet()
autocmd FileType c command! WriteFile call WriteFileSnippet()
autocmd FileType c command! AppendFile call AppendFileSnippet()

"Java snippets"

function! MainclassSnippet()
    call append('.', [
            \ 'public class Main {',
            \ '    public static void main(String[] args) {',
            \ '        ',
            \ '    }',
            \ '}'
            \ ])
    gg=G
endfunction

function! MainmethodSnippet()
    call append('.', [
            \ 'public static void main(String[] args) {',
            \ '    ',
            \ '}'
            \ ])
    gg=G
endfunction

function! SoutSnippet()
    call append('.', 'System.out.println();')
    gg=G
endfunction

"Define commands for Java files"
autocmd FileType java command! Mainclass call MainclassSnippet()
autocmd FileType java command! Mainmethod call MainmethodSnippet()
autocmd FileType java command! Sout call SoutSnippet()

"Markdown snippets"

function! FormatMarkdownTable()
  "Get start and end lines of table"
  let start_line = line('.')
  while getline(start_line) !~ '^\\table$' && start_line > 0
    let start_line -= 1
  endwhile
    
  let end_line = line('.')
  while getline(end_line) !~ '^\\endtable$' && end_line <= line('$')
    let end_line += 1
  endwhile

  "Validate table boundaries"
  if start_line == 0 || end_line > line('$')
    echo "No valid table found!"
    return
  endif

  "Get table content"
  let lines = getline(start_line + 1, end_line - 1)
  let table = []
    
  "Process each line into columns"
  for line in lines
    "Skip empty lines"
    if line =~ '^\s*$'
      continue
    endif
    "Split line by 4 or more spaces"
    let columns = split(line, '\s\{4,\}')
    "Trim whitespace from each column"
    call map(columns, 'trim(v:val)')
    call add(table, columns)
  endfor

  "Find maximum width for each column"
  let col_count = max(map(copy(table), 'len(v:val)'))
  let col_widths = repeat([0], col_count)
    
  for row in table
    for i in range(len(row))
      let col_widths[i] = max([col_widths[i], strlen(row[i])])
    endfor
  endfor

  "Format table rows"
  let output = []
  let header_sep = '|'
    
  for i in range(len(table))
    let row = table[i]
    let formatted = '|'
        
    "Pad each column to match max width"
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

  "Replace the table content"
  call setline(start_line + 1, output)
  call deletebufline('%', start_line + len(output) + 1, end_line - 1)
  call append(start_line + len(output), '\endtable')
endfunction

"Define commands for Markdown files"
autocmd FileType markdown command! FormatTable call FormatMarkdownTable()
