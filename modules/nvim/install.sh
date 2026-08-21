#!/usr/bin/env bash
# Neovim module (lazy.nvim Lua config)

set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../../lib/common.sh
source "$MODULE_DIR/../../lib/common.sh"

install_nvim() {
  mkdir -p "$HOME/.config"
  link_file "$MODULE_DIR" "$HOME/.config/nvim"
  ok "nvim module installed (open nvim once to bootstrap lazy.nvim)"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_nvim
fi
