#!/usr/bin/env bash
# Shell aliases — kept short; prefer bins/ for multi-step helpers.

alias a="alias"
alias c="dclean"
alias e="echo"
alias g="git"
alias h="history"
alias l='ls -ltr'
alias r="dreload"

# tmux
alias t='tmux -u'
alias ta='tmux -u attach -t'
alias tls='tmux ls'
alias tn='tmux -u new -n'

# directories
alias dotfiles='pushd "$DOTFILES"'
alias home='pushd "$HOME"'
[[ -n "${DOWNLOADS:-}" ]] && alias downloads='pushd "$DOWNLOADS"'
[[ -n "${WORKSPACE:-}" ]] && alias workspace='pushd "$WORKSPACE"'

# git
alias gP='git push'
alias ga='git add --all .'
alias gb='git checkout -b'
alias gc='git checkout'
alias gC='git commit'
alias gd='git diff'
alias gm='git merge'
alias gmm='git merge origin/main || git merge origin/master'
alias gp='git pull'
alias gs='git status'
alias gcm='git checkout main 2>/dev/null || git checkout master; git pull'
alias gcd='git checkout develop 2>/dev/null; git pull'

# docker compose
alias dcu='docker compose up --build'
alias dcd='docker compose down'
alias dcps='docker compose ps'
alias dc='docker compose'

# kubernetes
alias k='kubectl'
alias kdespod='kubectl describe pod'
alias klspod='kubectl get pod'
alias krmpod='kubectl delete pod'

# nvim remote (when inside nvim terminal)
if [[ -n "${NVIM:-}" ]] || [[ -n "${NVIM_LISTEN_ADDRESS:-}" ]]; then
  if command -v nvr >/dev/null 2>&1; then
    alias vih='nvr -o'
    alias viv='nvr -O'
    alias vit='nvr --remote-tab'
  fi
fi

# find helpers (avoid clobbering `fd` binary)
ffile() {
  local name="$1"
  shift
  find . -type f -name "$name" "$@"
}

fdir() {
  local name="$1"
  shift
  find . -type d -name "$name" "$@"
}
