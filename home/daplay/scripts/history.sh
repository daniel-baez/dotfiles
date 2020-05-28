#!/bin/sh

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
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries

# the following list of commands will be ignored
export HISTIGNORE='ls:bg:fg:history:echo'

# preprends date (%F) and time (%F) to each command
export HISTTIMEFORMAT='%F %T '

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
