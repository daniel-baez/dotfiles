#!/usr/bin/env bash
# Install packages via the detected package manager.

# shellcheck source=common.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
# shellcheck source=detect.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/detect.sh"

# Install a list of packages if missing (best-effort).
# Usage: install_packages pkg1 pkg2 ...
install_packages() {
  local pm
  pm="$(detect_pkg_manager)"
  local missing=()
  local pkg

  for pkg in "$@"; do
    if command_exists "$pkg"; then
      ok "present: $pkg"
    else
      # Some package names differ from the binary name
      missing+=("$pkg")
    fi
  done

  if [[ ${#missing[@]} -eq 0 ]]; then
    return 0
  fi

  info "installing: ${missing[*]} (via $pm)"

  case "$pm" in
    brew)
      brew install "${missing[@]}"
      ;;
    apt)
      sudo apt-get update -qq
      sudo apt-get install -y "${missing[@]}"
      ;;
    dnf)
      sudo dnf install -y "${missing[@]}"
      ;;
    pacman)
      sudo pacman -S --noconfirm "${missing[@]}"
      ;;
    none)
      warn "no package manager found; install manually: ${missing[*]}"
      return 1
      ;;
  esac
}

# Map logical tool names → brew / apt package names when they differ.
resolve_package_name() {
  local tool="$1"
  local pm
  pm="$(detect_pkg_manager)"

  case "$pm:$tool" in
    brew:rg) echo "ripgrep" ;;
    brew:ag) echo "the_silver_searcher" ;;
    apt:rg) echo "ripgrep" ;;
    apt:ag) echo "silversearcher-ag" ;;
    brew:fd) echo "fd" ;;
    apt:fd) echo "fd-find" ;;
    *) echo "$tool" ;;
  esac
}

install_tools_from_list() {
  local list_file="$1"
  [[ -f "$list_file" ]] || fail "missing package list: $list_file"

  local tools=()
  local line resolved
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    resolved="$(resolve_package_name "$line")"
    tools+=("$resolved")
  done < "$list_file"

  install_packages "${tools[@]}"
}
