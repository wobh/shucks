# -*- mode: sh; -*-
# .zprofile is run for login shells.

source .profile

## Paths

typeset -U path
path=(~/bin /usr/local/bin "$path[@]")

typeset -U manpath
manpath=(/usr/local/share/man /usr/share/man $manpath[@])

typeset -T INFOPATH infopath
typeset -U infopath
infopath=(~/doc/info /usr/local/share/info /usr/share/info $infopath[@])
