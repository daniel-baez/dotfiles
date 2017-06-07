# How to install

just run...

```.groovy
./gradle
```

## Vim

- `,dn` toggle line numbers
- `,dR` reloads .vimrc
- `,dov` opens .vimrc 
- `,doV` opens .vimrc in a new tab
- `,dot` opens .tmux.conf in a new tab
- `,doT` opens .tmux.conf in a new tab
- `,dobb` opens .bashrc
- `,doBB` opens .bashrc in a new tab
- `,dobp` opens .bash_profile
- `,doBP` opens .bash_profile in a new tab

## Tmux

prefix is `Ctrl-a` instead of `Ctrl-b`, plugins included:

- [tpm](http://github.com/tmux-plugins/tpm) _plugin manager_
- [tmux-open](http://github.com/tmux-plugins/tmux-open) _key bindings for quick opening of a highlighted file or url_
- [tmux-yank](http://github.com/tmux-plugins/tmux-yank) _copy to system clipboard_ (check website for OS specific instructions)
- [tmux-copycat](http://github.com/tmux-plugins/tmux-copycat) _enhances tmux search_
- [tmux-sessionist](http://github.com/tmux-plugins/tmux-sessionist) _utils for manipulating sessions_
- [tmux-logging](http://github.com/tmux-plugins/tmux-logging) _Easy logging and screen capturing for Tmux._
- [tmux-pain-control](http://github.com/tmux-plugins/tmux-pain-control) _standard pane key-bindings for tmux_
- [tmux-sensible](http://github.com/tmux-plugins/tmux-sensible) _basic tmux settings everyone can agree on_
- [tmux-resurrect](http://github.com/tmux-plugins/tmux-resurrect) _Persists tmux environment across system restarts_

### Keybindings

- `prefix + I` - Installs new plugins 
- `prefix + U` - updates plugin(s)
- `prefix + alt + u` - removes plugins
- `prefix + y` - copies text from the command line to clipboard.
- `prefix + Y (shift + y)` - copy pane current working directory to clipboard.
- `prefix + g` - prompts for session name and switches to it. Performs 'kind-of' name completion.
- `prefix + C (shift + c)` - prompt for creating a new session by name.
- `prefix + X (shift + x)` - kill current session without detaching tmux.
- `prefix + S (shift + s)` - switches to the last session.
- `prefix + @` - promote current pane into a new session. Analogous to how prefix + ! breaks current pane to a new window.
- `prefix + ctrl-f` - simple file search
- `prefix + ctrl-g` - jumping over git status files (best used after git status command)
- `prefix + alt-h` - jumping over SHA-1 hashes (best used after git log command)
- `prefix + ctrl-u` - url search (http, ftp and git urls)
- `prefix + ctrl-d` - number search (mnemonic d, as digit)
- `prefix + alt-i` - ip address search
- `prefix + shift + p` - Toggles (start/stop) logging in the current pane.
- `prefix + alt + p` - Visible text in the current pane is saved to a file. Equivalent of a "texual screenshot".
- `prefix + alt + shift + p` - Saves complete pane history to a file. Convenient if you retroactively remember you need to log/save all the work.
- `prefix + alt + c` - Clear pane history
- `prefix + Ctrl-s` - save
- `prefix + Ctrl-r` - restore
- `prefix + h` - select pane on the left
- `prefix + C-h` - select pane on the left
- `prefix + j` - select pane below the current one
- `prefix + C-j` - select pane below the current one
- `prefix + k` - select pane above
- `prefix + C-k` - select pane above
- `prefix + l` - select pane on the right
- `prefix + C-l` - select pane on the right
- `prefix + shift + h` - resize current pane 5 cells to the left
- `prefix + shift + j` - resize 5 cells in the up direction
- `prefix + shift + k` - resize 5 cells in the down direction
- `prefix + shift + l` - resize 5 cells to the right
- `prefix + |` - split current pane horizontally
- `prefix + -` - split current pane vertically
- `prefix + <` - moves current window one position to the left
- `prefix + >` - moves current window one position to the righto


### Copy Mode Keybindings

- `o` - "open" a highlighted selection with the system default program. open for OS X or xdg-open for Linux.
- `Ctrl-o` - open a highlighted selection with the $EDITOR
- `y` - copy selection to system clipboard
- `Y (shift-y)` - "put" selection - equivalent to copying a selection, and pasting it to the command line
- `Alt-y` - performs both of the above: copy to system clipboard and put to command line (deprecated, not useful)

### Regex Search 

- `prefix + /` - regex search (strings work too)
- `n` moves to next match
- `N` moves to previous match
