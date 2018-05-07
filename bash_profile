# Source bashrc, if it exists, so that it takes effect, even for login shells;
# see https://stackoverflow.com/questions/415403.
[[ -r ~/.bashrc ]] && . ~/.bashrc

# Source .profile, if it exists.
[[ -r ~/.profile ]] && . ~/.profile

# Set command line prompt.
NONE='\e[0m'
RED='\e[0;31m'
GREEN='\e[0;32m'
PS1="\u${GREEN}@\h${NONE}[\w]${RED}\$(__git_ps1 '(%s)')${NONE} \$ "
unset NONE
unset RED
unset GREEN
