#!/bin/sh

# ideas taken from: https://taskwarrior.org/news/news.20150627.html
# export PS1='$(task +in +PENDING count) \u@\W/\$: ' not in use
export PS1='daplay@\W/\$: ' not in use
# export TASKRC="$DOTFILES/environment/config/task/taskrc" not in use

## alias in='task add +in'
## 
## tickle() {
##     deadline=$1
##     shift
##     in +tickle wait:$deadline $@
## }
## 
## webpage_title (){
##     wget -qO- "$*" | hxselect -s '\n' -c  'title' 2>/dev/null
## }
## 
## read_and_review (){
##     link="$1"
##     title=$(webpage_title $link)
##     echo $title
##     descr="\"Read and review: $title\""
##     id=$(task add +next +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
##     task "$id" annotate "$link"
## }
## 
## alias tick=tickle
## alias think='tickle +1d'
## 
## # alias to add things to research
## alias rnd='task add +rnd'
## # read and review
## alias rnr=read_and_review
