#!/usr/bin/env bash
# Dotfiles installer — modular, OS-aware, interactive or scripted.
#
# Usage:
#   ./install.sh                  # interactive: pick modules
#   ./install.sh --all            # install everything
#   ./install.sh shell git tools  # install listed modules
#   ./install.sh --list           # list modules
#   ./install.sh --dry-run ...   # show plan only

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$ROOT/lib/common.sh"
# shellcheck source=lib/detect.sh
source "$ROOT/lib/detect.sh"

ALL_MODULES=(shell bins git tools)

usage() {
  cat <<EOF
Usage: $(basename "$0") [options] [modules...]

Options:
  --all        Install all modules
  --list       List available modules
  --dry-run    Print actions without running installers
  -h, --help   Show this help

Modules: ${ALL_MODULES[*]}

Examples:
  ./install.sh --all
  ./install.sh shell git
  ./install.sh              # interactive picker
EOF
}

list_modules() {
  local m
  for m in "${ALL_MODULES[@]}"; do
    if [[ -x "$ROOT/modules/$m/install.sh" ]] || [[ -f "$ROOT/modules/$m/install.sh" ]]; then
      echo "  $m"
    fi
  done
}

DRY_RUN=0

run_module() {
  local name="$1"
  local script="$ROOT/modules/$name/install.sh"
  [[ -f "$script" ]] || fail "unknown module: $name"
  chmod +x "$script"
  if [[ "$DRY_RUN" == "1" ]]; then
    info "[dry-run] would run $script"
    return 0
  fi
  info "installing module: $name"
  bash "$script"
}

interactive_pick() {
  echo "Select modules to install (space-separated numbers), or 'all':"
  local i=1
  local m
  for m in "${ALL_MODULES[@]}"; do
    printf "  %d) %s\n" "$i" "$m"
    i=$((i + 1))
  done
  printf "> "
  local answer
  read -r answer
  if [[ "$answer" == "all" ]]; then
    SELECTED=("${ALL_MODULES[@]}")
    return
  fi
  SELECTED=()
  local n
  for n in $answer; do
    if [[ "$n" =~ ^[0-9]+$ ]] && (( n >= 1 && n <= ${#ALL_MODULES[@]} )); then
      SELECTED+=("${ALL_MODULES[$((n - 1))]}")
    fi
  done
  [[ ${#SELECTED[@]} -gt 0 ]] || fail "no modules selected"
}

main() {
  local DO_ALL=0
  local args=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --all) DO_ALL=1; shift ;;
      --list) list_modules; exit 0 ;;
      --dry-run) DRY_RUN=1; shift ;;
      -h|--help) usage; exit 0 ;;
      -*) fail "unknown option: $1" ;;
      *) args+=("$1"); shift ;;
    esac
  done

  print_environment
  echo

  local SELECTED=()
  if [[ "$DO_ALL" == "1" ]]; then
    SELECTED=("${ALL_MODULES[@]}")
  elif [[ ${#args[@]} -gt 0 ]]; then
    SELECTED=("${args[@]}")
  else
    interactive_pick
  fi

  local m
  for m in "${SELECTED[@]}"; do
    run_module "$m"
  done

  echo
  ok "done. Open a new shell (or: source ~/.dotfiles.bashrc)"
}

main "$@"
