
###############
# 
# 1. Install latest bash via brew: 
# brew install bash
#
# 2. To source .bashrc, create .bash_profile with content:
# if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 
#

###############

# Bash settings

# -- Prompt

ATTRIBUTE_BOLD='\[\e[1m\]'
ATTRIBUTE_RESET='\[\e[0m\]'
COLOR_DEFAULT='\[\e[39m\]'
COLOR_RED='\[\e[31m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_BLUE='\[\e[34m\]'
COLOR_MAGENTA='\[\e[35m\]'
COLOR_CYAN='\[\e[36m\]'

machine_name() {
    if [[ -f $HOME/.name ]]; then
        cat $HOME/.name
    else
        hostname
    fi
}

PROMPT_DIRTRIM=3
PS1="\n${COLOR_BLUE}#${COLOR_DEFAULT} ${COLOR_CYAN}\\u${COLOR_DEFAULT} ${COLOR_GREEN}at${COLOR_DEFAULT} ${COLOR_MAGENTA}\$(machine_name)${COLOR_DEFAULT} ${COLOR_GREEN}in${COLOR_DEFAULT} ${COLOR_YELLOW}\w${COLOR_DEFAULT}\n\$(if [ \$? -ne 0 ]; then echo \"${COLOR_RED}!${COLOR_DEFAULT} \"; fi)${COLOR_BLUE}>${COLOR_DEFAULT} "
PS2="${COLOR_BLUE}>${COLOR_DEFAULT} "

COLOR_GRAY='\e[38;5;246m'

demoprompt() {
    PROMPT_DIRTRIM=1
    PS1="${COLOR_GRAY}\w ${COLOR_BLUE}\$ "
    trap '[[ -t 1 ]] && tput sgr0' DEBUG
}

# -- History

HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
shopt -s histappend # append to history file

export EDITOR=vim

###############


# -- Functions

# Create a directory and cd into it

mcd() {
    mkdir "${1}" && cd "${1}"
}

# Command to activate / create Python virtual environmment
# Activate a Python virtual environment or create a new one if it doesn't exist and install the go-to packages I use in every project. 

function venv {
    default_envdir=".env"
    envdir=${1:-$default_envdir}

    if [ ! -d $envdir ]; then
        python -m venv $envdir
        pip install jupyterlab black flake8 bpython mypy pytest
        echo -e "\x1b[38;5;2m✔ Created virtualenv $envdir\x1b[0m"
    fi
    source $envdir/bin/activate
    export PYTHONPATH=`pwd`
    echo -e "\x1b[38;5;2m✔ Activated virtualenv $envdir\x1b[0m"
    python -m pip install --upgrade pip
    echo -e "\x1b[38;5;2m✔ Upgraded pip for $envdir\x1b[0m"
    cd $envdir
    echo -e "\x1b[38;5;2m✔ Changed directory to virtualenv $envdir\x1b[0m"
    python --version
}

###############
