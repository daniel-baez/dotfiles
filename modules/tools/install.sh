#!/usr/bin/env bash
# Tools module: install favorite CLI utilities

set -euo pipefail

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../../lib/common.sh
source "$MODULE_DIR/../../lib/common.sh"
# shellcheck source=../../lib/packages.sh
source "$MODULE_DIR/../../lib/packages.sh"
# shellcheck source=../../lib/detect.sh
source "$MODULE_DIR/../../lib/detect.sh"

install_tools() {
  local pm list
  pm="$(detect_pkg_manager)"

  case "$pm" in
    brew) list="$MODULE_DIR/packages.brew" ;;
    apt)  list="$MODULE_DIR/packages.apt" ;;
    *)
      warn "unsupported pkg manager ($pm); skipping tool install"
      return 0
      ;;
  esac

  info "installing tools from $(basename "$list")"
  # Install by reading the list (package names already manager-specific)
  local pkgs=()
  local line
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    pkgs+=("$line")
  done < "$list"

  if [[ ${#pkgs[@]} -eq 0 ]]; then
    warn "empty package list"
    return 0
  fi

  case "$pm" in
    brew) brew install "${pkgs[@]}" || warn "some brew packages failed" ;;
    apt)
      sudo apt-get update -qq
      sudo apt-get install -y "${pkgs[@]}" || warn "some apt packages failed"
      ;;
  esac

  ok "tools module done"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_tools
fi
