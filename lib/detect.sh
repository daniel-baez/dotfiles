#!/usr/bin/env bash
# OS / shell / package-manager detection.

detect_os() {
  case "$(uname -s)" in
    Darwin) echo "macos" ;;
    Linux)
      if [[ -f /etc/os-release ]]; then
        # shellcheck disable=SC1091
        . /etc/os-release
        echo "${ID:-linux}"
      else
        echo "linux"
      fi
      ;;
    *) echo "unknown" ;;
  esac
}

detect_shell() {
  local name
  name="$(basename "${SHELL:-/bin/bash}")"
  case "$name" in
    zsh|bash|fish) echo "$name" ;;
    *) echo "bash" ;;
  esac
}

detect_pkg_manager() {
  if command_exists brew; then
    echo "brew"
  elif command_exists apt-get; then
    echo "apt"
  elif command_exists dnf; then
    echo "dnf"
  elif command_exists pacman; then
    echo "pacman"
  else
    echo "none"
  fi
}

print_environment() {
  info "OS:           $(detect_os)"
  info "Shell:        $(detect_shell) ($SHELL)"
  info "Pkg manager:  $(detect_pkg_manager)"
  info "Dotfiles:     $DOTFILES_ROOT"
  info "Home:         $HOME"
}
