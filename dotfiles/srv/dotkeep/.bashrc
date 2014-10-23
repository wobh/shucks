# -*- mode: sh; -*-

# From Bash docs:

# When an interactive shell that is not a login shell is started, Bash
# reads and executes commands from `~/.bashrc', if that file exists.


# Sources

source "$HOME/.editenv"
source "$HOME/.aliases"


# Prompt

PS1="\w\$ "


# Direnv

eval "$(direnv hook bash)"
