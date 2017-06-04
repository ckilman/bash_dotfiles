#!/bin/bash
###########################################################
#
#Bash stuffs
#
###########################################################

#Custom PS1 prompt
export PS1="\e[1;34m\u@\h\e[33m[\e[36m\w \e[35m\$?\e[33m]> \e[0m"

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
    return 0
fi

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s cmdhist        #save multi-line commands in history

# Configure moving up directories
# usage: up 3
#           to move up three directories
#           and can 'cd -' to get back
up() {
  DEEP=$1

  # if no option, default to 1
  if [[ -z $DEEP ]]; then
    DEEP=1
  fi
  str=""
  for i in $(seq 1 ${DEEP}); do
    str+="../"
  done
  eval cd $str
}

