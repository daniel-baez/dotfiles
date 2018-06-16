#!/bin/sh

function dreload() {
  local currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  source $currentDir/../profile
}

alias dcb="git branch | grep '*' | sed -Ee 's/^[* ]+//'"
alias dct="dcb | cut -d_ -f1"
alias dcr="git rev-parse --short=7 HEAD"

alias dotfiles='pushd $DOTFILES'
alias downloads='pushd $DOWNLOADS'
alias tools='pushd $TOOLS'
alias vimwiki='pushd $VIMWIKI'

alias vim=nvim
