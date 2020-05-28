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
EOM

  unset file;
  unset currentDir;
}

function extend_path() {
  currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  export PATH="$PATH:$currentDir/bin"
  unset currentDir;
}

# reloads ~/.bashrc
#
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

# usage: 
#   workspace [ dirname ]
#
# Without arguments `workspace` executes pushd for $HOME/workspace
# if an argument is passed it will execute pushd for $HOME/workspace/$argument
#
function workspace() {
  local dirname="$HOME/workspace/"

  if [[ $# -eq 1 ]] ; then
    dirname="$HOME/workspace/$1"
  fi

  if [ -d $dirname ] ; then
    pushd $dirname;
  else
    echo "Directory: $dirname doesn't exists"
  fi
}

load_scripts
extend_path

echo :dotfiles .bashrc

