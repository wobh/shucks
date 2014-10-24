# -*- mode: sh; -*-

# .zshrc is sourced in interactive shells.  It should contain commands
# to set up aliases, functions, options, key bindings, etc.

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory notify
bindkey -e
zstyle :compinstall filename "~/.zshrc"

autoload -Uz compinit
compinit

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
