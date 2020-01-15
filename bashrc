# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# adding per https://stackoverflow.com/questions/12373586
stty -ixon

# adding per https://stackoverflow.com/questions/34253579
export GTEST_COLOR=1

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# define gnu utilities on different OSes
os=`uname -s`
case $os in
    "Darwin")
        gnu_dircolors=/usr/local/bin/gdircolors
        gnu_ls=gls
        gnu_dir=gdir
        gnu_vdir=gvdir
        gnu_grep=ggrep
        gnu_fgrep=gfgrep
        gnu_egrep=gegrep
        ;;
    *       )
        gnu_dircolors=/usr/bin/dircolors
        gnu_ls=ls
        gnu_dir=dir
        gnu_vdir=vdir
        gnu_grep=grep
        gnu_fgrep=fgrep
        gnu_egrep=egrep
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x $gnu_dircolors ]; then
    test -r ~/.dircolors && eval "$($gnu_dircolors -b ~/.dircolors)" || eval "$($gnu_dircolors -b)"
    alias ls='$gnu_ls --color=auto'
    alias dir='$gnu_dir --color=auto'
    alias vdir='$gnu_vdir --color=auto'
fi
alias grep='$gnu_grep --color=auto'
alias fgrep='$gnu_fgrep --color=auto'
alias egrep='$gnu_egrep --color=auto'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash completion definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_completion, instead of adding them here directly.
[ -f ~/.bash_completion ] && source ~/.bash_completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Tmux hooks.
# This script contains any tmux-related setup for new bash shells.
if [ -f ~/.bash_tmux ]; then
    . ~/.bash_tmux
fi

# Enable fzf.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Enable bash_preexec. Also define a 'preexec_bash_tmux()' function that
# executes just before every bash command is processed. For more details, see
# https://github.com/rcaloras/bash-preexec.
[[ -f ~/.bash_preexec ]] && source ~/.bash_preexec

preexec_bash_tmux()
{
    # Execute ~/.bash_tmux with the current command being run (truncated).
    local bash_cmd="$1"
    local MAX_TITLE_LEN=32
    if [ ${#bash_cmd} -gt $MAX_TITLE_LEN ]; then
        bash_cmd="${bash_cmd:0:$(expr $MAX_TITLE_LEN - 3)}..."
    fi
    . ~/.bash_tmux "$bash_cmd"
}

preexec_functions+=(preexec_bash_tmux)

precmd_bash_tmux()
{
    # Execute ~/.bash_tmux.
    . ~/.bash_tmux
}
precmd_functions+=(precmd_bash_tmux)
