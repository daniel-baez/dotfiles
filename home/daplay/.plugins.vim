" Instala vim-plug en caso de que no esté
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/bundle')

" Google Cloud Platform
Plug 'hashivim/vim-terraform'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim' " Control P
" Plug 'mileszs/ack.vim'

" Javascript
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript' " JavaScript
Plug 'tpope/vim-abolish'

Plug 'airblade/vim-rooter' " Cambia el directorio automaticamente

Plug 'google/vim-jsonnet'
Plug 'tpope/vim-obsession'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-unimpaired'
Plug 'gmarik/Vundle.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ekalinin/Dockerfile.vim'
Plug 'taku-o/vim-copypath'
Plug 'jiangmiao/auto-pairs' " 
Plug 'scrooloose/nerdtree' " NERDTree
Plug 'majutsushi/tagbar'
Plug 'vimwiki/vimwiki' " personal management
Plug 'kchmck/vim-coffee-script' " CoffeeScript
Plug 'mxw/vim-jsx'
" Plugin 'tfnico/vim-gradle' " Gradle
Plug 'gisphm/vim-gradle' " Gradle2

Plug 'joukevandermaas/vim-ember-hbs'

" HTML
Plug 'mattn/emmet-vim'
Plug 'tmhedberg/matchit'

" Provides Snippets (templates based on keywords)
" Track the engine.  
"Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

Plug 'tmux-plugins/vim-tmux' " colors and syntax help for tmux.conf
Plug 'tmux-plugins/vim-tmux-focus-events' " makes clipboard work inside tmux

Plug 'tpope/vim-jdaddy' " json

" context info: git and other stuff
" Plugin 'vim-airline/vim-airline'

"" Plugin 'groovy.vim' " Groovy
"" "Plugin 'rdolgushin/groovy.vim'
Plug 'vim-scripts/groovy.vim'
Plug 'vim-scripts/groovyindent-unix'

"" Clojure
" Plugin 'bhurlow/vim-parinfer'
Plug 'venantius/vim-cljfmt'
" Plugin 'guns/vim-slamhound' 
"
" Al parecer esta wea resuelve el tema de editar el namespace
Plug 'guns/vim-clojure-static'

" let g:salve_auto_start_repl = 1
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve' 
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'kien/rainbow_parentheses.vim'
Plug 'snoe/clj-refactor.nvim'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

call plug#end()            " required

