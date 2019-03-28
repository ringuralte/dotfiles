#
# ~/.bashrc
#

# If not running interactively, don't do anything
parse_git_branch(){ 
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

arrow_right(){
    echo -e '\e[1m→'
}
#color and settings for bash line
export PS1="[\033[96m\]\$(arrow_right) \[\033[33m\]\W\[\033[91m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH=$PATH:/home/ringu/scripts/
#if not running interactively, do not do anything
[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

alias ls='ls --color=auto'

#allows specific history search using up/down arrow and accompanying command
export INPUTRC=~/.inputrc
