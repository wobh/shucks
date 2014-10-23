#!/usr/bin/env sh
# -*- mode: sh; -*-

# dotsend

# Copyright 2014 William Clifford

# Author: William Clifford <wobh@yahoo.com>


set -e


# Messages

DOTVERSION="0.0.1"

# NOTE: `read' always returns non-zero, so using `!' helps it work
# with `set -e'.

! read -d '' HELPTEXT <<"EOF"
dotsend, version %s
USAGE: dotsend [options] SOURCE ...
       dotsend [-[f]t TARGET] SOURCE ...
       dotsend [-r] [-t TARGET]

Send file or directory to dotfile archive, default $DOTKEEP. Updates
\`./.dotlist' file.

Configure environment in \`\$HOME/.dotenvs'.

OPTIONS

-f Force send and create \`./.dotlist' if it doesn't exist
-t Target directory argument overrides \`\$DOTKEEP'
-r Restore/refresh \`./.dotlist' from \`\$DOTKEEP'

NOTE

The folder containing \`.dotlist' must be considered the \`root'
folder for \`dotsync' to work properly. Do not try to send a file from
a path outside of this \`root'.

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

DOTFORCE="${FALSE}"
DOTFRESH="${FALSE}"

while getopts "frt:" opt; do
    case "${opt}" in
	f)
	    DOTFORCE="${TRUE}"
	    shift
	    ;;
	r)
	    if [[ "${DOTFORCE}" == "${TRUE}" ]]
	    then
		printf "${BADOPT}\n$NOTWITHOPT" "${OPTARG}" "-f"
		exit 1
	    else
		DOTFRESH="${TRUE}"
		shift
	    fi
	    ;;
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

if [[ -z "${@}" ]]
then
    if [[ "${DOTFRESH}" != "${TRUE}" ]]
    then
	printf "${HELPTEXT}" "${DOTVERSION}"
	exit 0
    fi
fi

DOTLIST="$(pwd)/.dotlist"

if [[ -f "${DOTLIST}" ]]
then
    true
else
    if [[ "${DOTFORCE}" == "${TRUE}" ]]
    then
	touch "${DOTLIST}"
	chmod "0650" "${DOTLIST}"
    else
	printf "${BADFILE}\n${NODOTLIST}" "${DOTLIST}" >&2
	exit 1
    fi
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
    if [[ "${DOTFORCE}" == "${TRUE}" ]]
    then
	install -d -v -m 0740 "${TARGET}"
    else
	printf "${BADDIR}" "${TARGET}" >&2
	exit 1
    fi
fi

# Actions

if [[ "$DOTFRESH" == "${FALSE}" ]]
then
    for FILE in "${@}"
    do
    
	FOUND="$(find ${PWD} -name ${FILE##*/})"
	if [[ -z "${FOUND#$PWD/}" ]]
	then
	    printf "${BADFILE}\n${NOTINPATH}" "${FILE}" >&2
	    exit 1
	fi
    done

    # FIXME: determine if these are really the best options here:
    CMDOPTS="-auvhR --no-perms"

    DOTSEND="rsync ${CMDOPTS} ${@} ${TARGET}" 

    eval "${DOTSEND}"
fi

printf "%b" "${DOTHEAD}" > "${DOTLIST}"

DOTSENT="cd ${TARGET}; find -f . -- -type f -print | cat >> ${DOTLIST}; cd -"

eval "${DOTSENT}"

exit
# end dotsend
