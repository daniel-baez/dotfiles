# Dotfiles — modern modular setup

Streamlined install for shell helpers, Neovim, tmux, git aliases, and favorite CLI tools.

## Quick start

```bash
git clone git@github.com:daniel-baez/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
./install.sh --all
```

Or install modules selectively:

```bash
./install.sh shell tmux nvim
./install.sh --list
./install.sh --dry-run --all
```

After install, open a new terminal (or `source ~/.dotfiles.bashrc`).

## Modules

| Module | What it does |
|--------|----------------|
| `shell` | Aliases, history, exports, PATH to custom bins; hooks zsh/bash |
| `bins` | Custom CLI helpers (`dcommit`, `dticket`, …) |
| `git` | Shared git aliases via `include.path` |
| `tmux` | `~/.tmux.conf` + TPM bootstrap |
| `nvim` | Lua + lazy.nvim config (Telescope, LSP, Oil, …) |
| `tools` | Installs ripgrep, fzf, starship, zoxide, neovim, … via brew/apt |

See [docs/modules.md](docs/modules.md) and [docs/installation.md](docs/installation.md).

## Layout

```
lib/           shared install helpers
modules/       one folder per concern (+ install.sh)
docs/          guides + keystrokes
```

## Docker (optional)

```bash
./launch-docker.sh
```

Builds a disposable Ubuntu image for experimenting with the shell environment.
