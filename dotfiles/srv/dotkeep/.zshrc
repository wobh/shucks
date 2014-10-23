# -*- mode: sh; -*-

# .zshrc is sourced in interactive shells.  It should contain commands
# to set up aliases, functions, options, key bindings, etc.

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/wclifford/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# options

setopt nobeep extendedglob badpattern nomatch


# Sources

source "$HOME/.editenv"
source "$HOME/.aliases"


# Prompt

PROMPT="%~%# "


# Window/tab titles

chpwd () { echo -ne "\e]1;$(print -Pn '%1d')\a" }


# Customizations

## Colorful less

### export LESSOPEN="| /usr/local/bin/pygmentize %s"
### export LESS=' -R '

## Ruby Ripper tags

# export RIPPER_TAGS_EMACS=1


# Hooks

## direnv

eval "$(direnv hook zsh)"
