""programming indent
filetype plugin indent on
filetype on

"" configuraciones varias
" set regexpengine=1
syntax enable
set autoread
set autowrite

""indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

"" I'm kind of picky about indent
function! SetIndent2()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
endfunction

"" some file extensions
autocmd BufRead,BufNewFile *.java set ft=java
autocmd BufRead,BufNewFile *.groovy set ft=groovy
autocmd BufRead,BufNewFile build.boot set ft=clojure

"" indents
autocmd BufRead,BufNewFile *.coffee call SetIndent2()
autocmd BufRead,BufNewFile *.json call SetIndent2()
autocmd BufRead,BufNewFile *.vim call SetIndent2()
autocmd BufRead,BufNewFile *.viml call SetIndent2()

"" boot files (clojure)

"" html
let g:html_indent_inctags = "html,body,head,tbody"

""search
set incsearch
set ignorecase
set smartcase
set nohlsearch

""pantalla
set nowrap
set number

"" font and color
if has('gui_running')
  " set background=light
  colorscheme desert
  set guifont=PT\ Mono:h13
else
  " set background=dark
endif

" vim window options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" backup options
set backup
set swapfile
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

" indent for xml
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
"ver como resolver esto au FileType json setlocal equalprg=python\ -m\ json.tool\ 2>/dev/null

" ignores for control-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

command! EditVimConfigFile :e ~/.vimrc
command! EditTmuxConfigFile :e ~/.tmux.conf

nmap <leader>v :EditVimConfigFile<CR>
nmap <leader>t :EditTmuxConfigFile<CR>
