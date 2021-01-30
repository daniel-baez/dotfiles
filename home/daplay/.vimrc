" source $HOME/.plugins.vim

if exists("g:loaded_dotfiles") || v:version < 700 || &compatible
  finish
endif
let g:loaded_dotfiles = 1

""programming indent
filetype plugin indent on
filetype on

set exrc " esta opcion permite tener un .vimrc a nivel de cada directorio (por proyecto)

"" Don't let Vim's "Found a swap file" message block input
set shortmess=A

" Jsonnet. Call Jsonnet by means of :Jsonnet, use 1 to enable on save filtering
let g:jsonnet_fmt_on_save = 0

"" ruby
let g:ale_linters = {'ruby': ['rubocop']}
let g:ale_ruby_rubocop_executable = 'bundle'

autocmd FileType ruby let b:dispatch = 'rtest %'
autocmd FileType ruby nnoremap <buffer> ,t :Dispatch rtest %<CR>

"" configuraciones varias
" set regexpengine=1
syntax enable
set autoread
set autowrite
set nopaste " it's a terrible idea to leave this on see: 'help pastetoggle'


set clipboard=unnamed " http://stackoverflow.com/questions/39645253/clipboard-failure-in-tmux-vim-after-upgrading-to-macos-sierra

let g:terraform_align = 1

" Allows to scroll using mouse
set mouse=a

"" cursor
set nocursorline
set nocursorcolumn

"" programming
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
au FileType java setl sw=4 sts=4 ts=4
au FileType groovy setl sw=4 sts=4 ts=4

autocmd BufRead,BufNewFile *.groovy set ft=groovy
autocmd BufRead,BufNewFile *.gsp set ft=html
autocmd BufRead,BufNewFile *.gson set ft=groovy
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

" Save for regular ppl
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" CONTROL-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*,*.pyc,*.pyo,*/node_modules/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_root_markers = ['git']
" let g:ctrlp_root_markers = [[]'run', 'pom.xml', 'projectConfig.gradle', 'build.gradle', 'package.json', 'build.boot', 'project.clj']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_extensions = ['tag']

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

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

" Clojure
"""""  let g:sexp_enable_insert_mode_mappings = 1
"""""  
"""""  let g:clojure_fuzzy_indent_patterns = ['^doto', '^with', '^def', '^let', 'go-loop', 'match', '^context', '^GET', '^PUT', '^POST', '^PATCH', '^DELETE', '^ANY', 'this-as', '^are', '^dofor']
"""""  let g:clojure_align_multiline_strings = 1
"""""  let g:clojure_maxlines = 100
"""""  let g:clj_refactor_prefix_rewriting=0

" CLOJURE BINDINGS

"" nmap <Leader>F <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
" nmap <Leader>f <Plug>FireplacePrint<Plug>(sexp_outer_list)``
" nmap <Leader>e <Plug>FireplacePrint<Plug>(sexp_inner_element)``
" nmap <Leader>d [<C-D>
" nmap <Leader>E :%Eval<CR>
" nmap <Leader>R cqp(require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)<CR>
" nmap <Leader>w( ysie)
" nmap <Leader>w[ ysie]
" nmap <Leader>w{ ysie}
" nmap <Leader>w" ysie"
" vmap <Leader>w( S)
" vmap <Leader>w[ S]
" vmap <Leader>w{ S}
" vmap <Leader>w" S"

" nmap <S-Right> <Plug>(sexp_capture_next_element)<Plug>(sexp_indent)
" nmap <S-Left> <Plug>(sexp_emit_tail_element)<Plug>(sexp_indent)
" imap <S-Right> <C-O><Plug>(sexp_capture_next_element)<C-O><Plug>(sexp_indent)
" imap <S-Left> <C-O><Plug>(sexp_emit_tail_element)<C-O><Plug>(sexp_indent)

" let g:sexp_mappings = {
"       \ 'sexp_outer_list':                'af',
"       \ 'sexp_inner_list':                'if',
"       \ 'sexp_outer_top_list':            'aF',
"       \ 'sexp_inner_top_list':            'iF',
"       \ 'sexp_outer_string':              'as',
"       \ 'sexp_inner_string':              'is',
"       \ 'sexp_outer_element':             'ae',
"       \ 'sexp_inner_element':             'ie',
"       \ 'sexp_move_to_prev_bracket':      '(',
"       \ 'sexp_move_to_next_bracket':      ')',
"       \ 'sexp_indent_top':                '=-',
"       \ 'sexp_round_head_wrap_element':   '<Leader>W',
"       \ 'sexp_swap_element_backward':     '<Leader>T',
"       \ 'sexp_swap_element_forward':      '<Leader>t',
"       \ 'sexp_raise_element':             '<Leader>''',
"       \ 'sexp_emit_head_element':         '<Leader>{',
"       \ 'sexp_emit_tail_element':         '<Leader>}',
"       \ 'sexp_capture_prev_element':      '<Leader>[',
"       \ 'sexp_capture_next_element':      '<Leader>]',
"       \ 'sexp_flow_to_next_open_bracket': '<M-f>',
"       \ 'sexp_flow_to_prev_open_bracket': '<M-b>',
"       \ } 

" COC
" let g:airline_section_error = '%{airline#til#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>u <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')

let g:coc_enable_locationlist = 0
autocmd User CocLocationsChange CocList --normal location

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [l <Plug>(coc-diagnostic-prev)
nmap <silent> ]l <Plug>(coc-diagnostic-next)
nmap <silent> [k :CocPrev<cr>
nmap <silent> ]k :CocNext<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

" Highlight symbol under cursor on CursorHold      
autocmd CursorHold * silent call CocActionAsync('highlight')
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcp :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-privacy', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>
nnoremap <silent> cris :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'inline-symbol', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))
 function! s:LoadClojureContent(uri)
  setfiletype clojure
  let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
  call setline(1, split(content, "\n"))
  setl nomodified
  setl readonly
endfunction

" Default
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1
let g:clj_fmt_autosave = 1


au BufEnter *.clj,*.cljc,*.cljs,build.boot RainbowParenthesesActivate
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

" command! DclojurescriptPiggieback :Piggieback (adzerk.boot-cljs-repl/repl-env)
command! DclojurescriptPiggieback :Piggieback (cider.piggieback/cljs-repl) 

fun! DReload()
  unlet g:loaded_dotfiles
  source ~/.vimrc 
  echo 'Configuration reloaded :)'
endfun

command! DvimrcReload :source ~/.vimrc | :echo 'Configuration reloaded :)'
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
" nmap ,dov :DvimrcOpen<CR>
map ,dov :silent! :split ~/.vimrc<CR>
map ,doV :silent! :tabedit :e ~/.vimrc<CR>
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

"" Utilsnips
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
nnoremap ,sl :call UltiSnips#ListSnippets()<CR>

let mapleader=','
if exists(":Tabularize")
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
endif


if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" Search with C-d C-f
"" In selection mode: \a searches using Ack
"" In selection mode: C-d C-f searches using Ack
"" vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>
vnoremap <C-D><C-F> y:Ack <C-r>=fnameescape(@")<CR><CR>
"" noremap   :Ack 
" Ack uses ag " FZF
"


""" INDENT ON SAVE.



" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Re-indent the whole buffer.
function! Indent()
  call Preserve('normal =-')
endfunction

" Indent on save hook
"" "autocmd BufWritePre *.clj <buffer> call Indent()
"" "autocmd BufWritePre *.cljs <buffer> call Indent()

" local directory follows file
" autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
let g:rooter_change_directory_for_non_project_files = 'current'

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>

" PHP
let g:phpfmt_standard = 'Zend'
let g:phpfmt_autosave = 0
let g:phpfmt_options = '--indent_with_space=2'

