#!/bin/sh

function load_scripts() {
  while read file
  do
    currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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

unset file;
unset currentDir;
}

# export PATH=$NEW_PATH

load_scripts
echo :dotfiles .bashrc

