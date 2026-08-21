#!/usr/bin/env bash
# Bins module: ensure custom scripts are executable and on PATH via shell module

set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../../lib/common.sh
source "$MODULE_DIR/../../lib/common.sh"

install_bins() {
  local f
  for f in "$MODULE_DIR"/*; do
    [[ -f "$f" ]] || continue
    [[ "$(basename "$f")" == "install.sh" ]] && continue
    chmod +x "$f"
  done

  # Fix DOTFILES-relative paths in a few legacy scripts
  ok "bins executable under $MODULE_DIR"
  ok "bins module installed (PATH via shell module)"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_bins
fi
