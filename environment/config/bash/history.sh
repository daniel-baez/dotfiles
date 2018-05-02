# BETTER HISTORY https://sanctum.geek.nz/arabesque/better-bash-history/

# option `histappend` will append to .bash_history instead of overwriting what's there
# this happens, by default, upon closing your session
shopt -s histappend

# by default, the .bash_history file will hold up to 500 commands
# lets get that way longer!
HISTFILESIZE=1000000
HISTSIZE=1000000

# `ignoreboth` is a shortcut to specify options:
# - ignorespace => avoids saving commands that start with an space
# - ignoredups => avoids duplicates
HISTCONTROL=ignoreboth

# the following list of commands will be ignored
HISTIGNORE='ls:bg:fg:history:echo'

# preprends date (%F) and time (%F) to each command
HISTTIMEFORMAT='%F %T '

# upon saving commands to $HOME/.bash_history
# it will break multiple line commands into single line commnads
shopt -s cmdhist

# by default, bash will save commands upon quitting your session
# this means that, if you session crashes, you won't see a thing written :{
# the following setting, makes bash save commands automatically
PROMPT_COMMAND='history -a'
