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

"" indent for java
autocmd BufRead,BufNewFile *.java set ft=java
autocmd BufRead,BufNewFile *.groovy set ft=groovy

"" boot files (clojure)
au BufRead,BufNewFile build.boot set filetype=clojure

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

" ignores for control-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

nmap <leader>v :e ~/.vimrc<CR>
