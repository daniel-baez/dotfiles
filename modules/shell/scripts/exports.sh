#!/usr/bin/env bash
# Environment exports

export DOTFILES="${DOTFILES:-$HOME/workspace/dotfiles}"
export DOWNLOADS="${DOWNLOADS:-$HOME/Downloads}"
export WORKSPACE="${WORKSPACE:-$HOME/workspace}"

export JAVA_TOOL_OPTIONS='-Dfile.encoding=UTF8 -Duser.country=US -Duser.language=en'

# Prefer ripgrep for fzf; fall back to ag
if command -v rg >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
elif command -v ag >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
fi
