#!/usr/bin/env sh
# -*- mode: sh; -*-

# dotsync

# Copyright 2014 William Clifford

# Author: William Clifford <wobh@yahoo.com>


set -e


# Messages

DOTVERSION="0.0.1"

# NOTE: `read' always returns non-zero, so using `!' helps it work
# with `set -e'.

! read -d '' HELPTEXT <<"EOF"
dotsync, version %s
USAGE: dotsync SOURCE
       dotsync [-t TARGET] SOURCE

Synchronize files listed in \`SOURCE/.dotlist' with \'\$DOTKEEP'.

Configure environment in \`\$HOME/.dotenvs'.

OPTIONS

-t Target directory argument overrides \$DOTKEEP

EOF


NILARG="ERROR ${0}: Argument for \`-%s' missing.\n"

BADOPT="ERROR ${0}: Option \`-%s' invalid.\n"

DUPOPT="ERROR ${0}: Option \`-%s' used more than once.\n"

BADDIR="ERROR ${0}: Directory \`%s' invalid.\n"

BADFILE="ERROR ${0}: File \`%s' invalid.\n"

NODOTLIST="This folder does not have a usable \`.dotlist'.\n"

NODOTKEEP="\$DOTKEEP or TARGET folder's unusable.\n"

# Options

while getopts "t:" opt; do
    case "${opt}" in
	t)
	    if [[ -n "${TARGET}" ]]
	    then 
		printf "${DUPOPT}" "${OPTARG}" >&2
		printf "${HELPTEXT}" "${DOTVERSION}"
		exit 1
	    else
		TARGET="${OPTARG}"
	    fi
	    ;;
	\?)
	    printf "${BADOPT}" "${OPTARG}" >&2
	    printf "${HELPTEXT}" "${DOTVERSION}"
	    exit 1
	    ;;
	:)
	    printf "${BADARG}" "${OPTARG}" >&2
	    printf "${HELPTEXT}" "${DOTVERSION}"
	    exit 1
	    ;;
    esac
done

if [[ -z "${1}" ]]
then
    printf "${HELPTEXT}" "${DOTVERSION}"
    exit 0
else
    SOURCE="${1}"
fi

source "${SOURCE}/.dotenvs"
	
TARGET="${TARGET-$DOTKEEP}"

if [[ ! -d "${TARGET}" ]]
then
    printf "${BADDIR}\n${NODOTKEEP}" "${TARGET}" >&2
    exit 1
fi

DOTLIST="${SOURCE}/.dotlist"

if [[ ! -f "${DOTLIST}" ]]
then
    printf "${BADFILE}\n${NODOTLIST}" "${DOTLIST}"
fi

#FIXME: determine if these are really the best options here:
CMDOPTS="-auvhr --no-perms --files-from=${DOTLIST}"

DOTSYNC="rsync ${CMDOPTS} . ${TARGET}"


# Actions

eval "${DOTSYNC}"

if [[ "${TARGET}" != "${DOTHOME}" ]]
then
    cp "${DOTLIST}" "${TARGET}"
fi

exit
# end dotsync
