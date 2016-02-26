# -*- mode: sh; -*-

export NAME="William Clifford"
source "${HOME}/.organization"

export     PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export  MANPATH="/usr/local/share/man:/usr/share/man"
export INFOPATH="$HOME/doc/info/:/usr/local/share/info/emacs/:/usr/local/share/info/:/usr/share/info/"

export RIPPER_TAGS_EMACS=1

export CIM_HOME="${HOME}/.cim"; [ -s "$CIM_HOME/init.sh" ] && . "$CIM_HOME/init.sh"

export GREP_OPTIONS="--color=auto"
