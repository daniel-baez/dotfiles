#!/usr/bin/env bash
# Editor defaults

set -o vi 2>/dev/null || true

export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-$EDITOR}"

if command -v nvr >/dev/null 2>&1 && { [[ -n "${NVIM:-}" ]] || [[ -n "${NVIM_LISTEN_ADDRESS:-}" ]]; }; then
  alias vim=nvr
  alias vi=nvr
elif command -v nvim >/dev/null 2>&1; then
  alias vim=nvim
  alias vi=nvim
fi
