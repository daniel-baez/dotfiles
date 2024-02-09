#!/bin/sh

    local currentDir=${0:a:h}
function load_scripts() {
  while read file
  do
    # local currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    # local currentDir=${0:a:h}
    local file=$currentDir/scripts/$file.sh

    [ -r "$file" ] && [ -f "$file" ] && source "$file";
  done <<EOM
    aliases
    exports
    history
    vim
EOM
}

function extend_path() {
  local currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  export PATH="$PATH:$currentDir/bin"
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

#   ws [ dirname ]
#
# Without arguments `workspace` executes pushd for $HOME/workspace
# if an argument is passed it will execute pushd for $HOME/workspace/$argument
#
function ws() {
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

