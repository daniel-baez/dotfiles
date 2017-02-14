""programming indent
filetype plugin indent on
filetype on

"" configuraciones varias
" set regexpengine=1
syntax enable
set autoread
set autowrite
set paste

"" cursor
set nocursorline
set nocursorcolumn

""indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
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
au FileType crontab setlocal bkc=yes

"" indents
autocmd BufRead,BufNewFile *.coffee call SetIndent2()
autocmd BufRead,BufNewFile *.json call SetIndent2()
autocmd BufRead,BufNewFile *.vim call SetIndent2()
autocmd BufRead,BufNewFile *.viml call SetIndent2()

" ignores for control-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_root_markers = ['run', 'pom.xml']

"" Split and follow (create target wiki page if needed).  
nmap <Leader>we <Plug>VimwikiSplitLink
"" Vertical split and follow (create target wiki page if needed).
nmap <Leader>wq <Plug>VimwikiVSplitLink

" Clojure
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au BufEnter *.clj,build.boot RainbowParenthesesActivate
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

"" NERDTree
autocmd vimenter * NERDTree

" tagbar provides taskwiki file navigation.
nmap <F7> :TagbarToggle<CR>

"" html
let g:html_indent_inctags = "html,body,head,tbody"

function! FormatprgLocal(filter)
if !empty(v:char)
  return 1
else
  let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
  echo l:command
  execute l:command
endif
endfunction

if has("autocmd")
  let pandoc_pipeline  = "pandoc --from=html --to=markdown"
  let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
  autocmd FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
endif

""search
set incsearch
set ignorecase
set smartcase
set incsearch
set hlsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

""pantalla
set nowrap
set ruler
set nonumber
set norelativenumber

"" font and color
colorscheme desert

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

command! PiggieBackClojureScript :Piggieback (adzerk.boot-cljs-repl/repl-env)
command! EditVimConfigFile :e ~/.vimrc
command! EditVimConfigFileTab :tabnew | :e ~/.vimrc
command! EditTmuxConfigFile :e ~/.tmux.conf
command! EditTmuxConfigFileTab tabnew | :e ~/.tmux.conf
command! ReloadConfig :source ~/.vimrc | :echo 'Configuration reloaded :)'
command! DaplayToggleNumbers :setlocal nu! | :setlocal rnu!

nmap <leader>dn :DaplayToggleNumbers<CR>
nmap <leader>dv :EditVimConfigFile<CR>
nmap <leader>dV :EditVimConfigFileTab<CR>
nmap <leader>dt :EditTmuxConfigFile<CR>
nmap <leader>dT :EditTmuxConfigFileTab<CR>
nmap <leader>dr :ReloadConfig<CR>
