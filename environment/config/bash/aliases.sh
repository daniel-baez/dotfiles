#!/bin/sh

alias dreload="source $HOME/.bash_profile"
alias dcurrent_branch="git branch | grep '*' | sed -Ee 's/^[* ]+//'"
alias dcurrent_ticket="dcurrent_branch | cut -d_ -f1"
alias dcurrent_revision="git rev-parse --short=7 HEAD"

alias workspace='cd $HOME/workspace'
alias wikies='cd $HOME/wikies'
alias tools='cd $HOME/tools'
alias downloads='cd $HOME/downloads'

alias vim=nvim
