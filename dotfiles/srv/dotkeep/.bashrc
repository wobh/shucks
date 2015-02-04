# -*- mode: sh; -*-

# From Bash docs:

# When an interactive shell that is not a login shell is started, Bash
# reads and executes commands from `~/.bashrc', if that file exists.


# Sources

source "${HOME}/.editors"
source "${HOME}/.aliases"


# Prompt

export PS1="\w\$ "

# Title

export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# Direnv

eval "$(direnv hook bash)"
