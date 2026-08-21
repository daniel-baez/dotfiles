#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="${WORKSPACE:-$HOME/workspace}"

docker build "$ROOT" -t dotfiles

docker run -it \
  -u daplay \
  -v "$ROOT:/home/daplay/dotfiles" \
  -v "$WORKSPACE:/home/daplay/workspace" \
  dotfiles \
  bash
