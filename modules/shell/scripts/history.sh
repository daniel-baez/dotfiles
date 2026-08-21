#!/usr/bin/env bash
# History settings (bash + zsh)

# Large shared history
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTCONTROL=erasedups:ignorespace
export HISTTIMEFORMAT='%F %T '

if [[ -n "${ZSH_VERSION:-}" ]]; then
  setopt INC_APPEND_HISTORY
  setopt HIST_IGNORE_DUPS
  setopt HIST_IGNORE_SPACE
  bindkey -v
  bindkey '^R' history-incremental-search-backward
elif [[ -n "${BASH_VERSION:-}" ]]; then
  shopt -s histappend 2>/dev/null || true
  shopt -s cmdhist 2>/dev/null || true
  if [[ -z "${PROMPT_COMMAND:-}" ]]; then
    export PROMPT_COMMAND="history -a"
  else
    export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
  fi
fi
