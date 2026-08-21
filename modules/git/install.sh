#!/usr/bin/env bash
# Git helpers module (bins + optional gitconfig includes)

set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../../lib/common.sh
source "$MODULE_DIR/../../lib/common.sh"

install_git() {
  link_file "$MODULE_DIR/gitconfig" "$HOME/.config/dotfiles.gitconfig"

  if command -v git >/dev/null 2>&1; then
    if git config --global --get-all include.path 2>/dev/null | grep -qx "$HOME/.config/dotfiles.gitconfig"; then
      ok "git include already present"
    else
      git config --global --add include.path "$HOME/.config/dotfiles.gitconfig"
      ok "added include.path for dotfiles gitconfig"
    fi
  else
    warn "git not found"
  fi

  ok "git module installed"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_git
fi
