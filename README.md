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

After install, open a new terminal (or `source ~/.dotfiles.bashrc`). Type `g aliases` any time you forget the git shortcuts.

---

## Installation

### Requirements

- macOS or Linux
- `git`
- Package manager: Homebrew (macOS) or apt (Debian/Ubuntu)
- Shell: zsh (recommended) or bash

### Full install

```bash
cd ~/workspace/dotfiles   # or wherever you cloned this repo
chmod +x install.sh
./install.sh --all
```

What happens:

1. Detects OS, shell, and package manager
2. Installs CLI tools (`tools`)
3. Writes `~/.dotfiles.bashrc` and sources it from `~/.zshrc` or `~/.bashrc`
4. Adds a global git `include.path` for shared aliases

### Selective install

```bash
./install.sh shell bins git
./install.sh tools
```

### Dry run

```bash
./install.sh --dry-run --all
```

### Uninstall / restore

Symlinked files are backed up to `~/.dotfiles-backup/` before replacement. Remove the `source ~/.dotfiles.bashrc` line from your shell rc to stop loading the shell module.

### Troubleshooting

- **Wrong DOTFILES path**: re-run `./install.sh shell` from the real clone location.
- **Bins not found**: ensure shell module is loaded (`echo $DOTFILES`).
- **Git shortcuts**: type `g aliases`. Reload the shell (`r`) after installing.

---

## Layout

```
lib/           shared install helpers
modules/       one folder per concern (+ install.sh)
```

---

## Modules

Each module lives in `modules/<name>/` with an `install.sh` entrypoint.

| Module | What it does |
|--------|----------------|
| `shell` | Aliases, history, exports, PATH to custom bins; hooks zsh/bash |
| `bins` | Custom CLI helpers (`g sync`, `g done`, wiki sync, …) |
| `git` | Shared git aliases via `include.path` |
| `tools` | Installs ripgrep, fzf, starship, zoxide, … via brew/apt |

### shell

- Scripts: `scripts/{aliases,exports,history}.sh`
- Entry: `modules/shell/bashrc` (loaded via generated `~/.dotfiles.bashrc`)
- Helpers: `dreload`, `dclean`, `ws`
- Optional: initializes starship + zoxide when installed

### bins

Custom executables on `PATH` after the shell module loads.

Git workflows are `git-*` scripts, so they run as `g sync`, `g done`, … — see [Git shortcuts](#git-shortcuts).

| Command | Purpose |
|---------|---------|
| `git-sync` | Fetch + merge (or rebase) default branch into current |
| `git-main` | Switch to main/master and pull |
| `git-cz` / `git-done` | Angular conventional commit / same + push |
| `git-ticket` / `git-rev` | Print JIRA key / short SHA |
| `git-aliases` | Print the git cheatsheet |
| `git-diff-blame` | Blame-oriented diff helper |
| `dapull` / `dasync` | Pull / commit+push wiki + dotfiles |

### git

Installs `~/.config/dotfiles.gitconfig` (aliases + defaults) and adds it to `git config --global include.path`. Daily use: `g <command>`.

### tools

Installs packages from `packages.brew` or `packages.apt` depending on the OS (ripgrep, fd, fzf, starship, zoxide, bat, eza, gh, jq, …).

---

## Git shortcuts

One prefix, one namespace: **`g` is `git`**. Type `g aliases` any time you forget.

There are no `gs` / `gp` / `gmm` shell aliases. Workflows that need logic (`sync`, `main`, `done`, …) are `git-*` scripts on `PATH`, so Git exposes them as `git sync` / `g sync`.

### Inspect

| Command | What it does |
|---------|----------------|
| `g s` | Short status (`status -sb`) |
| `g d` / `g ds` | Unstaged / staged diff |
| `g l` / `g ll` | Graph log (20) / last commit with stat |
| `g b` | Branches, newest commit first |
| `g rev` | Short SHA of HEAD (copied to clipboard) |

### Change

| Command | What it does |
|---------|----------------|
| `g a` / `g ap` | Stage everything / stage hunks interactively |
| `g cz` | **Angular conventional commit** (interactive, or one-shot) |
| `g c` | Raw `git commit` — e.g. `g c -m "msg"` |
| `g amend` | Amend last commit, keep the message |
| `g wip` | Stage everything and commit as `wip` |
| `g unstage` | Unstage (files stay in the working tree) |
| `g undo` | Undo last commit, keep the files (`reset --keep`) |

`g undo` only rewrites a commit that has **not** been pushed. After a push, use `g revert` or an explicit reset.

### Move

| Command | What it does |
|---------|----------------|
| `g sw <name>` | Switch branch (`git switch`) |
| `g new <name>` | Create and switch (`git switch -c`) |
| `g main` | Switch to `main` or `master` and pull |
| `g develop` | Switch to `develop` and pull |

Prefer `g sw` / `g restore -- <file>` over `checkout`. `switch` moves branches; `restore` restores files.

### Integrate

| Command | What it does |
|---------|----------------|
| `g sync` | Fetch, then merge `origin/<default>` into the **current** branch |
| `g sync --rebase` | Same, but rebase onto the default branch |
| `g sync develop` | Merge `origin/develop` instead |
| `g f` | Fetch (gone remotes are pruned) |
| `g pull` / `g push` | Pull / push. First push sets upstream automatically |
| `g pf` | Push `--force-with-lease` (never `--force`) |

`g sync` is the old `dmerge`: update this feature branch from latest main/master. If you are already on the default branch, it just pulls.

Default branch is detected from `origin/HEAD`, then `origin/main`, then `origin/master`. Print it with `g default-branch`.

### Conventional commits (Angular)

`g cz` writes messages in the [Angular / Conventional Commits](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit) shape:

```
<type>(<scope>): <subject>

<body>

BREAKING CHANGE: <details>
Refs: ABC-123
```

Types: `feat` `fix` `docs` `perf` `refactor` `test` `style` `build` `ci` `chore` `revert`.

| Command | What it does |
|---------|----------------|
| `g cz` | Interactive: type (fzf) → scope → subject → body → breaking? |
| `g cz feat handle empty response` | One-shot header, no prompts (except missing fields) |
| `g cz -s api feat handle empty response` | With scope: `feat(api): handle empty response` |
| `g cz -b` | Same wizard, marks a breaking change (`feat!: …`) |
| `g ticket` | Print the JIRA key from the branch (copied) |
| `g done` | `g cz` then `g push` |

Stage first (`g a` or `g ap`), then `g cz` or `g done`. Subject is imperative, not capitalized, no trailing period — the wizard normalizes that. A ticket on the branch becomes a `Refs: ABC-123` footer (you can decline, or pass `--no-ticket`). Header longer than 100 characters is rejected (or confirmed interactively).

With `fzf` installed, the type picker is fuzzy; otherwise it is a numbered list.

### Other

| Command | What it does |
|---------|----------------|
| `g aliases` | Print this cheatsheet |
| `g diff-blame` | Diff annotated with blame |
| `g restore -- <path>` | Discard unstaged edits to a file |

### Typical day

```bash
g main                          # start from latest default branch
g new ABC-123-fix-timeout       # feature branch
# … edit …
g s                             # what changed?
g ap                            # stage hunks (or g a for everything)
g done                          # Angular commit wizard, then push
# → feat(api): handle empty response
# → Refs: ABC-123

g sync                          # later: merge latest main into this branch
g push                          # if sync created a merge commit
```

### Mapping from the old aliases

| Old | New |
|-----|-----|
| `gs` | `g s` |
| `gd` | `g d` |
| `ga` | `g a` |
| `gC` / `dcommit msg` | `g cz` / `g done` / `g c -m "msg"` |
| `gc` / `gb` | `g sw` / `g new` |
| `gp` / `gP` / `dpush` | `g pull` / `g push` |
| `gcm` | `g main` |
| `gcd` | `g develop` |
| `gmm` / `dmerge` | `g sync` |
| `dticket` / `dct` | `g ticket` |
| `dcr` | `g rev` |
| `drecommit` | `g c --reuse-message=HEAD` |

### Config baked in

- `pull.rebase = false` — `g pull` and `g sync` merge, unless you pass `--rebase`
- `push.autoSetupRemote = true` — first `g push` on a new branch is enough
- `fetch.prune = true` — `g f` drops deleted remote branches
- `rerere.enabled = true` — Git remembers conflict resolutions
- `branch.sort = -committerdate` — `g b` lists recent branches first
- `init.defaultBranch = main`

The `git` module adds `~/.config/dotfiles.gitconfig` to `include.path`. The `bins` + `shell` modules put `git-*` on `PATH`. Reload with `r` (`dreload`) after install.
