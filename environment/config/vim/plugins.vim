set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Google Cloud Platform
Plugin 'hashivim/vim-terraform'


" Javascript
Plugin 'ternjs/tern_for_vim'
Plugin 'pangloss/vim-javascript' " JavaScript
Plugin 'tpope/vim-abolish'

Plugin 'ludovicchabant/vim-gutentags.git'  " Automatically update tags


Plugin 'airblade/vim-rooter' " Cambia el directorio automaticamente

Plugin 'blindFS/vim-taskwarrior'
Plugin 'jimmyhchan/dustjs.vim.git'
Plugin 'google/vim-jsonnet'
Plugin 'tpope/vim-obsession'
Plugin 'justinmk/vim-dirvish'
Plugin 'calendar.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'gmarik/Vundle.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'taku-o/vim-copypath'
Plugin 'ctrlpvim/ctrlp.vim' " Control P
Plugin 'jiangmiao/auto-pairs' " 
Plugin 'scrooloose/nerdtree' " NERDTree
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vimwiki/vimwiki' " personal management
Plugin 'kchmck/vim-coffee-script' " CoffeeScript
Plugin 'mxw/vim-jsx'
" Plugin 'tfnico/vim-gradle' " Gradle
Plugin 'gisphm/vim-gradle' " Gradle2

Plugin 'joukevandermaas/vim-ember-hbs'

" HTML
Plugin 'mattn/emmet-vim'
Plugin 'tmhedberg/matchit'

" Provides Snippets (templates based on keywords)
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'tmux-plugins/vim-tmux' " colors and syntax help for tmux.conf
Plugin 'tmux-plugins/vim-tmux-focus-events' " makes clipboard work inside tmux

Plugin 'tpope/vim-jdaddy' " json

" context info: git and other stuff
Plugin 'vim-airline/vim-airline'

"" Plugin 'groovy.vim' " Groovy
Plugin 'rdolgushin/groovy.vim'

"" Clojure
" Plugin 'bhurlow/vim-parinfer'
" Plugin 'venantius/vim-cljfmt'
" Plugin 'guns/vim-slamhound' 
" Plugin 'snoe/clj-refactor.nvim'
"
" Al parecer esta wea resuelve el tema de editar el namespace
Plugin 'guns/vim-clojure-static'

" let g:salve_auto_start_repl = 1
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve' 
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()            " required
filetype plugin indent on    " required

