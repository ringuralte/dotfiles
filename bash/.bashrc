#
# ~/.bashrc
#

# If not running interactively, don't do anything
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

#if not running interactively, do not do anything
[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

alias ls='ls --color=auto'

#allows specific history search using up/down arrow and accompanying command
export INPUTRC=~/.inputrc

#bin for ringu
export PATH=$PATH:~/bin

#nvm
source /usr/share/nvm/init-nvm.sh

#fzf stuffs
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
