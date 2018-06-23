#!/bin/sh

# usage: 
#   dreload
#
function dreload() {
  local currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  source $currentDir/../profile
}

