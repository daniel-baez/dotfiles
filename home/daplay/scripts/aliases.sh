#!/bin/sh

# ®
alias c="dclean"
alias e="echo"
alias g="git"
alias h="history"
alias l='ls -ltr'
alias r="dreload"

# ruby
alias be='bundler exec'

# tmux
alias t='tmux -u'
alias ta='tmux -u attach -t'
alias tls='tmux ls'
alias tn='tmux -u new -n'
alias tt='tmuxinator'

# base directories
alias dotfiles='pushd $DOTFILES'
alias home='pushd $HOME'
alias downloads='pushd $DOWNLOADS'
alias tools='pushd $TOOLS'
alias vimwiki='pushd $VIMWIKI'

# build tools
alias gradle='./gradlew'

# git
alias wip='dcommit WIP && gP' # TODO: remove this one or replace by a more useful program
alias gawip='ga && dcommit WIP && gP' # TODO: remove this one or replace by a more useful program
alias dmerge='git pull && git merge origin/master' # TODO: remove this one or replace by a more useful program

alias gA='git add --all -n .'
alias gP='git push'
alias ga='git add --all .'
alias gb='git checkout -b'
alias gc='git checkout'
alias gC='git commit'
alias gd='git diff'
alias gm='git merge'
alias gmm='git merge origin/master'
alias gmd='git merge origin/develop'
alias gp='git pull'
alias gs='git status'

# git: branches
alias gcm="echo 'git checkout master && git pull' &&  git checkout master && git pull"
alias gcd="echo 'git checkout develop && git pull' &&  git checkout develop && git pull"

# docker-compose
alias dcu='docker-compose up --build'
alias dcd='docker-compose down'
alias dcps='docker-compose ps'
alias dc='docker-compose'

# NVR 
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias vih='nvr -o'
  alias viv='nvr -O'
  alias vit='nvr --remote-tab'
fi

# kubernetes
alias k='kubectl'
alias kdespod='kubectl describe pod'
alias klspod='kubectl get pod'
alias krmpod='kubectl delete pod'

