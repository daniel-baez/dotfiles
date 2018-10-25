""programming indent
filetype plugin indent on
filetype on

"" configuraciones varias
" set regexpengine=1
syntax enable
set autoread
set autowrite
set nopaste " it's a terrible idea to leave this on see: 'help pastetoggle'

set clipboard=unnamed " http://stackoverflow.com/questions/39645253/clipboard-failure-in-tmux-vim-after-upgrading-to-macos-sierra

" NERDTree Bookmards
let g:NERDTreeBookmarksFile = expand('$DOTFILES') . '/environment/config/vim/NERDTreeBookmarks'

"" cursor
set nocursorline
set nocursorcolumn

""indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

" save on change for *.wiki files
autocmd TextChanged,TextChangedI *.wiki silent write

"" some file extensions
autocmd BufRead,BufNewFile *.java set ft=java
autocmd BufRead,BufNewFile *.groovy set ft=groovy
autocmd BufRead,BufNewFile *.gradle set ft=groovy
autocmd BufRead,BufNewFile *.pipeline set ft=groovy
autocmd BufRead,BufNewFile build.boot,*.hl set ft=clojure
"" au BufRead,BufNewFile *.hl setfiletype clojure
au FileType crontab setlocal bkc=yes


" esto necesita instalar `npm install -g prettier`
autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

"" indents
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.wiki setlocal textwidth=80

" ignores for control-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*,*.pyc,*.pyo
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
"""autocmd vimenter * NERDTree

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
set number
" set norelativenumber

"" font and color
colorscheme desert
" colorscheme zenburn

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

command! DclojurescriptPiggieback :Piggieback (adzerk.boot-cljs-repl/repl-env)

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" comandos que abren archivos

command! DvimrcReload :source ~/.vimrc | :echo 'Configuration reloaded :)'
command! DvimrcOpen :e ~/.vimrc
command! DvimrcTabOpen :tabnew | :e ~/.vimrc
command! DtmuxconfigOpen :e ~/.tmux.conf
command! DtmuxconfigTabOpen tabnew | :e ~/.tmux.conf
command! DbashrcOpen :e ~/.bashrc
command! DbashrcTabOpen :tabnew | :e ~/.bashrc
command! DbashprofileOpen :e ~/.bash_profile
command! DbashprofileTabOpen :tabnew | :e ~/.bash_profile

command! DtoggleNumbers :setlocal nu!

" mappings that open files
nmap ,dn :DtoggleNumbers<CR>
nmap ,dR :DvimrcReload<CR>
nmap ,dt :NERDTreeToggle<CR>
nmap ,dT :NERDTreeFind<CR>
nmap ,dov :DvimrcOpen<CR>
nmap ,doV :DvimrcTabOpen<CR>
nmap ,dot :DtmuxconfigOpen<CR>
nmap ,doT :DtmuxconfigTabOpen<CR>
nmap ,dobb :DbashrcOpen<CR>
nmap ,doBB :DbashrcTabOpen<CR>
nmap ,dobp :DbashprofileOpen<CR>
nmap ,doBP :DbashprofileTabOpen<CR>

"" 
"" set statusline=%{ObsessionStatus()}

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Monaco:h11
set guifontwide=NSimsun:h12

