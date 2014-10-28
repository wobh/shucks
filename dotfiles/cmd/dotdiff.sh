#!/usr/bin/env sh
# -*- mode: sh; -*-

# dotdiff

# Copyright 2014 William Clifford

# Author: William Clifford <wobh@yahoo.com>


set -e


# Messages

DOTVERSION="0.0.1"

# NOTE: `read' always returns non-zero, so using `!' helps it work
# with `set -e'.

! read -d '' HELPTEXT <<"EOF"
dotdiff, version %s
USAGE: dotdiff [options] [FILES] ...
       dotsend [-t TARGET] [FILES] ...

Show differences between files or directory to dotfile archive,
default $DOTKEEP.

Configure environment in \`\$HOME/.dotenvs'.

OPTIONS

-t Target directory argument overrides \`\$DOTKEEP'

EOF

TRUE="0"
FALSE="1"

NILARG="ERROR ${0}: Argument for \`-%s' missing.\n"

BADOPT="ERROR ${0}: Option \`-%s' invalid.\n"

DUPOPT="ERROR ${0}: Option \`-%s' used more than once.\n"

BADDIR="ERROR ${0}: Directory \`%s' invalid.\n"

BADFILE="ERROR ${0}: File \`%s' invalid.\n"

NILFILE="ERROR ${0}: File \`%s' not in path \`%s'.\n"

NODOTLIST="This folder does not have a usable \`.dotlist'.\n"

NOTINPATH="This folder does not have the file below \`\.dotlist'.\n"

NOTWITHOPT="May not use this option with %s"

DOTHEAD="# .dotsync\n# list of files to sync with dotsync\n"


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
		shift
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

DOTLIST="$(pwd)/.dotlist"

if [[ -f "${DOTLIST}" ]]
then
    true
else
    printf "${BADFILE}\n${NODOTLIST}" "${DOTLIST}" >&2
    exit 1
fi

source "${HOME}/.dotenvs"

TARGET="${TARGET-$DOTKEEP}"

if [[ -z "${TARGET}" ]]
then
    printf "${BADDIR}" "${TARGET}" >&2
    exit 1
fi

if [[ -d "${TARGET}" ]]
then
    true
else
    printf "${BADDIR}" "${TARGET}" >&2
    exit 1
fi

# Actions

CMDOPTS="-u"



for FILE in "${@}"
do
    DOTDIFF="diff ${CMDOPTS} ${FILE} ${TARGET}/${FILE}"     
    eval "${DOTSEND}"
done

exit
# end dotdiff
