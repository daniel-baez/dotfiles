#!/usr/bin/env bash
# tmux module

set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../../lib/common.sh
source "$MODULE_DIR/../../lib/common.sh"

install_tmux() {
  link_file "$MODULE_DIR/tmux.conf" "$HOME/.tmux.conf"

  local tpm="$HOME/.tmux/plugins/tpm"
  if [[ ! -d "$tpm" ]]; then
    info "installing tpm"
    mkdir -p "$(dirname "$tpm")"
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$tpm"
  else
    ok "tpm present"
  fi

  ok "tmux module installed (prefix+I inside tmux to fetch plugins)"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_tmux
fi
