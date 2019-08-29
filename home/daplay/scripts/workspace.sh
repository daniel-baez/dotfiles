#!/bin/sh

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

