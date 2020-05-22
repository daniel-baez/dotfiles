#!/bin/sh

# base directories
alias dotfiles='pushd $DOTFILES'
alias home='pushd $HOME'
alias downloads='pushd $DOWNLOADS'
alias tools='pushd $TOOLS'
alias vimwiki='pushd $VIMWIKI'

# build tools
alias gradle='./gradlew'

# git
alias dpull='git checkout master && git pull'
alias dmerge='git pull && git merge origin/master'

alias gA='git add --all'
alias gd='git diff'
alias gb='git checkout -b'
alias gc='git checkout'
alias gp='git pull'
alias gs='git status'

# kubernetes
alias klspod='kubectl get pod'
alias krmpod='kubectl delete pod'
alias k='kubectl'

# Limpia la pantalla
# si estamos usando tmux, 
# tambien limpia el historial del panel
function dclean() {
  if [ -z ${TMUX_PANE+x} ]; 
  then 
    clear
  else 
    clear
    tmux clear-history
  fi
}
