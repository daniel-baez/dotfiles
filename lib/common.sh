#!/usr/bin/env bash
# Shared helpers for dotfiles installers.

set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export DOTFILES_ROOT

# Colors (disabled when not a TTY)
if [[ -t 1 ]]; then
  _c_reset=$'\033[0m'
  _c_info=$'\033[1;34m'
  _c_ok=$'\033[1;32m'
  _c_warn=$'\033[1;33m'
  _c_err=$'\033[1;31m'
else
  _c_reset= _c_info= _c_ok= _c_warn= _c_err=
fi

info()  { printf '%s==>%s %s\n' "$_c_info" "$_c_reset" "$*"; }
ok()    { printf '%s✓%s  %s\n' "$_c_ok" "$_c_reset" "$*"; }
warn()  { printf '%s!%s  %s\n' "$_c_warn" "$_c_reset" "$*"; }
fail()  { printf '%s✗%s  %s\n' "$_c_err" "$_c_reset" "$*" >&2; exit 1; }

# Backup existing path then symlink source → dest
link_file() {
  local src="$1"
  local dest="$2"
  local backup_dir="${DOTFILES_BACKUP:-$HOME/.dotfiles-backup}"

  mkdir -p "$(dirname "$dest")"
  mkdir -p "$backup_dir"

  if [[ -L "$dest" ]]; then
    local current
    current="$(readlink "$dest")"
    if [[ "$current" == "$src" ]]; then
      ok "already linked: $dest"
      return 0
    fi
    rm -f "$dest"
  elif [[ -e "$dest" ]]; then
    local stamp
    stamp="$(date +%Y%m%d-%H%M%S)"
    local bak="$backup_dir/$(basename "$dest").$stamp"
    mv "$dest" "$bak"
    warn "backed up $dest → $bak"
  fi

  ln -s "$src" "$dest"
  ok "linked $dest → $src"
}

ensure_line_in_file() {
  local line="$1"
  local file="$2"
  mkdir -p "$(dirname "$file")"
  touch "$file"
  if grep -Fqx "$line" "$file" 2>/dev/null; then
    ok "already sourced in $file"
  else
    printf '\n%s\n' "$line" >> "$file"
    ok "appended to $file"
  fi
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}
