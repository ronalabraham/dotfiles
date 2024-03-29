#!/bin/bash

# For motivation for this solution, see Vincent Hsu's answer in:
# http://stackoverflow.com/questions/35016458/how-to-write-if-statement-in-tmux-conf-to-set-different-options-for-different-t

tmux_conf=~/.tmux/conf
tmux_version="$(tmux -V | cut -d ' ' -f 2 | sed 's/[^0-9\.]//g')"

if [[ $(echo "$tmux_version >= 2.7" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_conf/tmux_2.7.conf"
elif [[ $(echo "$tmux_version >= 2.4" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_conf/tmux_2.4.conf"
elif [[ $(echo "$tmux_version >= 2.1" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_conf/tmux_2.1.conf"
elif [[ $(echo "$tmux_version >= 1.9" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_conf/tmux_1.9.conf"
else
    tmux display-message "$(tmux -V) not supported"
fi
