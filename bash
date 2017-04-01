#!/bin/bash
###########################################################
#
#Bash stuffs
#
###########################################################

#Custom PS1 prompt
PS1="\e[1;34m\u@\h\e[33m[\e[36m\w \e[35m\$?\e[33m]> \e[0m"
export PS1

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
    return 0
fi

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

#netinfo - shows network information for your system
netinfo() {
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
myip=$(lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ \
	| sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g')
echo "${myip}"
echo "---------------------------------------------------"
}

# Configure moving up directories
# example use: up 3
#           to move up three direcotries
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


