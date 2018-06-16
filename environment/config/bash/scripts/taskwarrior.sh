#!/bin/sh

if [ ! -z ${TASKRC+x} ]; then 
  export PS1='$(task +in +PENDING count) \u \$ '
  export TASKRC="$DOTFILES/environment/config/task/taskrc"
fi


# taskwarrior
alias in='task add +in'

tickle() {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}

alias tick=tickle
alias think='tickle +1d'
