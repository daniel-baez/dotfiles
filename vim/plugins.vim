set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'taku-o/vim-copypath'
Plugin 'Townk/vim-autoclose'

"" Plugin 'mileszs/ack.vim'
"" Plugin 'bling/vim-airline'
"" Plugin 'tpope/vim-sensible'
"" Plugin 'takac/vim-spotifysearch'
"" Plugin 'jnurmine/Zenburn'

"" personal management
Plugin 'mattn/calendar-vim'
Plugin 'vimwiki/vimwiki'

"" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

"" JavaScript
Plugin 'pangloss/vim-javascript'

"" Groovy
Plugin 'groovy.vim'
Plugin 'tfnico/vim-gradle'

"" tmux.conf
Plugin 'tmux-plugins/vim-tmux'

"" Clojure
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-salve'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

"" colors
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required
