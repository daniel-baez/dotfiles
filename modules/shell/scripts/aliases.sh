#!/usr/bin/env bash
# Shell aliases — kept short; prefer bins/ for multi-step helpers.
# Git: only `g`. Everything else is `g <command>` — see `g aliases` / README.md.

alias a="alias"
alias c="dclean"
alias e="echo"
alias g="git"
alias h="history"
alias l='ls -ltr'
alias r="dreload"

# git completion for `g`
if [[ -n "${ZSH_VERSION:-}" ]]; then
  compdef g=git 2>/dev/null || true
elif [[ -n "${BASH_VERSION:-}" ]] && declare -F __git_complete >/dev/null 2>&1; then
  __git_complete g git
fi

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
