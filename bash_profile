# Source bashrc, if it exists, so that it takes effect, even for login shells;
# see https://stackoverflow.com/questions/415403.
[[ -r ~/.bashrc ]] && . ~/.bashrc

# Source .profile, if it exists.
[[ -r ~/.profile ]] && . ~/.profile

# Source .git-prompt.sh, if it exists
[[ -r ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

# Set command line prompt.
PS1='\[\033[01;32m\]\u\[\033[00m\]@\[\033[00;32m\]\h\[\033[00m\]:${PWD}\[\033[00m\]\[\033[00;31m\]($(__git_ps1 "%s")) \n\[\033[00;32m\][\D{%H:%M:%S}] \[\033[00m\]$ \[\033[01;97m\]'

# Reset formatting after typing a command (before the output is displayed); see:
#     https://wiki.archlinux.org/title/Bash/Prompt_customization#Escapes_between_command_input_and_output
trap 'tput sgr0' DEBUG
