# Installation guide

## Requirements

- macOS or Linux
- `git`
- Package manager: Homebrew (macOS) or apt (Debian/Ubuntu)
- Shell: zsh (recommended) or bash

## Full install

```bash
cd ~/workspace/dotfiles   # or wherever you cloned this repo
chmod +x install.sh
./install.sh --all
```

What happens:

1. Detects OS, shell, and package manager
2. Installs CLI tools (`tools`)
3. Writes `~/.dotfiles.bashrc` and sources it from `~/.zshrc` or `~/.bashrc`
4. Symlinks tmux / nvim configs (with backups under `~/.dotfiles-backup/`)
5. Adds a global git `include.path` for shared aliases

## Selective install

```bash
./install.sh shell bins git
./install.sh nvim
./install.sh tools
```

## Dry run

```bash
./install.sh --dry-run --all
```

## Uninstall / restore

Symlinked files are backed up to `~/.dotfiles-backup/` before replacement. Remove the `source ~/.dotfiles.bashrc` line from your shell rc to stop loading the shell module.

## First Neovim launch

Open `nvim` once so [lazy.nvim](https://github.com/folke/lazy.nvim) can bootstrap plugins. Language servers are optional — install them separately (e.g. `gopls`, `pyright`) as needed.

## Troubleshooting

- **Wrong DOTFILES path**: re-run `./install.sh shell` from the real clone location.
- **Bins not found**: ensure shell module is loaded (`echo $DOTFILES`).
- **tmux plugins missing**: inside tmux, press `prefix` + `I` (TPM install).
