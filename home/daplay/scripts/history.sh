#!/bin/sh

# Returns all the aliases
# contatenated like this: ":a:b:c:d"
# this string should be appended to
# env var HISTIGNORE in order to avoid
# capturing aliases in history.
#
# This helps remove noise from the log
function get_aliases_for_ignore() {
  # loads every other file in this same directory
  currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  result="ls:bg:fg:history:echo"

  for ELEMENT in $(cat ${currentDir}/aliases.sh | grep alias | sed -E -e 's/alias //g' | sed -E -e 's/=.*$//g'); do
    result+=":${ELEMENT}"
  done

  unset file;
  unset currentDir;

  echo $result
}


# BETTER HISTORY https://sanctum.geek.nz/arabesque/better-bash-history/

# option `histappend` will append to .bash_history instead of overwriting what's there
# this happens, by default, upon closing your session
shopt -s histappend

# by default, the .bash_history file will hold up to 500 commands
# lets get that way longer!
export HISTFILESIZE=100000
export HISTSIZE=100000

# `ignoreboth` is a shortcut to specify options:
# - ignorespace => avoids saving commands that start with an space
# - ignoredups => avoids duplicates
# export HISTCONTROL=ignoreboth
export HISTCONTROL=erasedups:ignorespace  # no duplicate entries

# the following list of commands will be ignored
export HISTIGNORE="$(get_aliases_for_ignore)"

# preprends date (%F) and time (%F) to each command
# export HISTTIMEFORMAT='%F %T '

# upon saving commands to $HOME/.bash_history
# it will break multiple line commands into single line commnads
shopt -s cmdhist

# by default, bash will save commands upon quitting your session
# this means that, if you session crashes, you won't see a thing written :{
# the following setting, makes bash save commands automatically
if [ -z "$PROMPT_COMMAND" ]
then
  export PROMPT_COMMAND="history -a"
else
  export PROMPT_COMMAND="$PROMPT_COMMAND;history -a"
fi
