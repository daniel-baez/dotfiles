#!/bin/sh

function load_scripts() {
  while read file
  do
    currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    file=$currentDir/scripts/$file.sh
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
  done <<EOM
    aliases
    exports
    history
    vim
    workspace
EOM

  unset file;
  unset currentDir;
}

function extend_path() {
}

# reloads
# usage:
#   dreload
#
function dreload() {
  source $HOME/.bashrc
}

# Limpia la pantalla
# si estamos usando tmux,
# tambien limpia el historial del panel
function dclean() {
  if [ -z ${TMUX_PANE+x} ];
  then
    clear
  else
    clear
    tmux clear-history
  fi
}


load_scripts
extend_path

echo :dotfiles .bashrc

