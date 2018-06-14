#!/bin/sh

alias dreload="source $HOME/.bash_profile"
alias dcb="git branch | grep '*' | sed -Ee 's/^[* ]+//'"
alias dct="dcb | cut -d_ -f1"
alias dcr="git rev-parse --short=7 HEAD"

alias tools='cd $HOME/tools'
alias downloads='cd $HOME/downloads'
alias vimwiki='cd $HOME/vimwiki'

alias vim=nvim
