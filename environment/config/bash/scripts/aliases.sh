#!/bin/sh

# base directories
alias dotfiles='pushd $DOTFILES'
alias home='pushd $HOME'
alias downloads='pushd $DOWNLOADS'
alias tools='pushd $TOOLS'
alias vimwiki='pushd $VIMWIKI'

# build tools
alias gradle='gradlew'

# git
alias dpull='git checkout master && git pull'
alias dadd='git add --all .'
alias dbranch='git checkout -b '
