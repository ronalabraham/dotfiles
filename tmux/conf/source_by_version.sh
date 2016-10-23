#!/bin/bash

tmux_conf=~/.tmux/conf
tmux_version="$(tmux -V | cut -d ' ' -f 2 | sed 's/[^0-9\.]//g')"

if [[ $(echo "$tmux_version >= 2.1" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_conf/tmux_2.1.conf"
elif [[ $(echo "$tmux_version >= 1.9" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_conf/tmux_1.9.conf"
else
    tmux display-message "$(tmux -V) not supported"
fi
