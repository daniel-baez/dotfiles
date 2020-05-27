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

# export PATH=$NEW_PATH

echo :dotfiles .bashrc

