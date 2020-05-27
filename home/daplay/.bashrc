#!/bin/sh

# loads every other file in this same directory
currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

while read file
do
  file=$currentDir/scripts/$file.sh
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done <<EOM
aliases
dreload
exports
history
vim
workspace
EOM

## 
## # makes tools under dotfiles/environments/bin available
## 
unset file;
unset currentDir;
## 
## # is tmux set NVIM_LISTEN_ADDRESS based on tmux session name
## # [ ! -z "$TMUX" ] && export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket-$(tmux display-message -p '#S')-$(tmux display-message -p '#I')
## 
echo "$PATH" | tr : '\n' | sed -E -e '/^$/d' | uniq
echo -------
echo "$PATH" | tr : '\n' | sed -E -e '/^$/d' | sort | uniq
## 
## 
## # export PATH="$PATH:$HOME/bin"
## NEW_PATH=""
## for ELEMENT in $(echo "$PATH:$HOME/bin" | tr : '\n' | sed -E -e '/^$/d' | sort | uniq); do
##   NEW_PATH+=":${ELEMENT}"
## done
## echo -------
## 
## echo $NEW_PATH

# export PATH=$NEW_PATH

echo :dotfiles .bashrc

