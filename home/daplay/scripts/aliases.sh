#!/bin/sh

# ®
alias e="echo"

# ls
alias l='ls -ltr'

# base directories
alias dotfiles='pushd $DOTFILES'
alias home='pushd $HOME'
alias downloads='pushd $DOWNLOADS'
alias tools='pushd $TOOLS'
alias vimwiki='pushd $VIMWIKI'

# build tools
alias gradle='./gradlew'

# git
alias dpull='git checkout master && git pull' # TODO: remove this one or replace by a more useful program
alias dmerge='git pull && git merge origin/master' # TODO: remove this one or replace by a more useful program

alias ga='git add --all'
alias gA='git add --all -n'
alias gb='git checkout -b'
alias gc='git checkout'
alias gd='git diff'
alias gp='git pull'
alias gs='git status'

# git: branches
alias gcm="git checkout master"
alias gcd="git checkout develop"

# docker-compose
alias dcu='docker-compose up --build'
alias dcd='docker-compose down'
alias dcps='docker-compose ps'
alias dc='docker-compose'

# kubernetes
alias k='kubectl'
alias kdespod='kubectl describe pod'
alias klspod='kubectl get pod'
alias krmpod='kubectl delete pod'

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
