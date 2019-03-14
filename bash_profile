# Source bashrc, if it exists, so that it takes effect, even for login shells;
# see https://stackoverflow.com/questions/415403.
[[ -r ~/.bashrc ]] && . ~/.bashrc

# Source .profile, if it exists.
[[ -r ~/.profile ]] && . ~/.profile

# Source .git-prompt.sh, if it exists
[[ -r ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

# Set command line prompt.
PS1='\[\033[01;32m\]\u\[\033[00m\]@\[\033[00;32m\]\h\[\033[00m\]:${PWD}\[\033[00m\]\[\033[00;31m\]($(__git_ps1 "%s")) \[\033[00m\]\$ \n '

# https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc
if [[ $(uname -s) == Linux ]]
then
    setxkbmap -option "caps:swapescape"
fi

