# Dotfiles — modern modular setup

Streamlined install for shell helpers, git aliases, and favorite CLI tools.

## Quick start

```bash
git clone git@github.com:daniel-baez/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
./install.sh --all
```

Or install modules selectively:

```bash
./install.sh shell git
./install.sh --list
./install.sh --dry-run --all
```

After install, open a new terminal (or `source ~/.dotfiles.bashrc`).

## Modules

| Module | What it does |
|--------|----------------|
| `shell` | Aliases, history, exports, PATH to custom bins; hooks zsh/bash |
| `bins` | Custom CLI helpers (`g sync`, `g done`, wiki sync, …) |
| `git` | Shared git aliases via `include.path` — [docs/git.md](docs/git.md) |
| `tools` | Installs ripgrep, fzf, starship, zoxide, … via brew/apt |

See [docs/modules.md](docs/modules.md), [docs/installation.md](docs/installation.md), and [docs/git.md](docs/git.md) (`g aliases`).

## Layout

```
lib/           shared install helpers
modules/       one folder per concern (+ install.sh)
docs/          guides
```
