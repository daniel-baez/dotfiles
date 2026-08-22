# Modules

Each module lives in `modules/<name>/` with an `install.sh` entrypoint.

## shell

- Scripts: `scripts/{aliases,exports,history}.sh`
- Entry: `modules/shell/bashrc` (loaded via generated `~/.dotfiles.bashrc`)
- Helpers: `dreload`, `dclean`, `ws`
- Optional: initializes starship + zoxide when installed

## bins

Custom executables on `PATH` after the shell module loads.

Git workflows are `git-*` scripts, so they run as `g sync`, `g done`, … — see [git.md](git.md).

| Command | Purpose |
|---------|---------|
| `git-sync` | Fetch + merge (or rebase) default branch into current |
| `git-main` | Switch to main/master and pull |
| `git-cz` / `git-done` | Angular conventional commit / same + push |
| `git-ticket` / `git-rev` | Print JIRA key / short SHA |
| `git-aliases` | Print the git cheatsheet |
| `git-diff-blame` | Blame-oriented diff helper |
| `dapull` / `dasync` | Pull / commit+push wiki + dotfiles |

## git

Installs `~/.config/dotfiles.gitconfig` (aliases + defaults) and adds it to
`git config --global include.path`. Daily use: `g <command>`. See [git.md](git.md).

## tools

Installs packages from `packages.brew` or `packages.apt` depending on the OS.
