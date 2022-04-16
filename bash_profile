# Source bashrc, if it exists, so that it takes effect, even for login shells;
# see https://stackoverflow.com/questions/415403.
[[ -r ~/.bashrc ]] && . ~/.bashrc

# Source .profile, if it exists.
[[ -r ~/.profile ]] && . ~/.profile

# Source .git-prompt.sh, if it exists
[[ -r ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

function git_branch() {
    local branch=$(__git_ps1 "%s")
    if [ -z $branch ]; then
        echo ""
    else
        echo "(└─$branch)"
    fi
}

function prompt() {
    local GREEN="\[\033[0;32m\]"
    local BOLD_GREEN="\[\033[1;32m\]"
    local RED="\[\033[0;31m\]"
    local WHITE="\[\033[00;97m\]"
    local NONE="\[\033[00m\]"

    PS1="${BOLD_GREEN}\u${NONE}@${GREEN}\h${NONE}:"'${PWD}'"${RED}"'$(git_branch)'"${WHITE}\n${GREEN}[\D{%H:%M:%S}]${NONE}> ${WHITE}"
}

# Set command line prompt.
prompt

# Reset formatting after typing a command (before the output is displayed); see:
#     https://wiki.archlinux.org/title/Bash/Prompt_customization#Escapes_between_command_input_and_output
trap 'tput sgr0' DEBUG
