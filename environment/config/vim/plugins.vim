set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-obsession'
Plugin 'justinmk/vim-dirvish'
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
Plugin 'pangloss/vim-javascript' " JavaScript
Plugin 'mxw/vim-jsx'
Plugin 'tfnico/vim-gradle' " Gradle
Plugin 'tmux-plugins/vim-tmux' " tmux.conf
Plugin 'tpope/vim-jdaddy' " json

"" Plugin 'groovy.vim' " Groovy
Plugin 'rdolgushin/groovy.vim'

"" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-salve' " let g:salve_auto_start_repl = 1
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'kien/rainbow_parentheses.vim'

"" colors
"" Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

call vundle#end()            " required
filetype plugin indent on    " required
