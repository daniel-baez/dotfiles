#!/bin/sh

alias dreload="source $HOME/.bash_profile"

alias dcb="git branch | grep '*' | sed -Ee 's/^[* ]+//'"
alias dct="dcb | cut -d_ -f1"
alias dcr="git rev-parse --short=7 HEAD"

alias dotfiles='cd $DOTFILES'
alias downloads='cd $DOWNLOADS'
alias tools='cd $TOOLS'
alias vimwiki='cd $VIMWIKI'

alias vim=nvim
