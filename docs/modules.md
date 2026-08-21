# Modules

Each module lives in `modules/<name>/` with an `install.sh` entrypoint.

## shell

- Scripts: `scripts/{aliases,exports,history,vim}.sh`
- Entry: `modules/shell/bashrc` (loaded via generated `~/.dotfiles.bashrc`)
- Helpers: `dreload`, `dclean`, `ws`
- Optional: initializes starship + zoxide when installed

## bins

Custom executables on `PATH` after the shell module loads:

| Command | Purpose |
|---------|---------|
| `dcommit` | Commit (+ push) with ticket prefix from branch |
| `dticket` | Print JIRA-style ticket from branch name |
| `dpush` / `dapull` / `dasync` | Push current branch / sync wiki+dotfiles |
| `git-diff-blame` | Blame-oriented diff helper |

## git

Installs `~/.config/dotfiles.gitconfig` and adds it to `git config --global include.path`.

## tmux

- Prefix: `Ctrl-a`
- Plugins via TPM: sensible, pain-control, yank, sessionist, resurrect, continuum
- See [keystrokes.md](keystrokes.md) for bindings

## nvim

Lua config with lazy.nvim:

- Telescope (`<C-p>`, `<leader>ff`)
- Oil file browser (`,dt`)
- Treesitter, gitsigns, fugitive, LSP + cmp
- Legacy shortcuts preserved: `,dR`, `,dov`, `,dot`, tab maps `th/tj/tk/tl`

## tools

Installs packages from `packages.brew` or `packages.apt` depending on the OS.
