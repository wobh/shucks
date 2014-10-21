#!/usr/bin/env sh
# -*- mode: sh; -*-

# dotsend_test.sh

# Copyright 2014 William Clifford

# Author: William Clifford <wobh@yahoo.com>

set -ex

TESTHOME="./dottest"
TESTPATH="dotfiles/src"
TESTFILE="dottest0"
TESTENVS=".dotenvs"

function dotsend_test_clean {
    rm -rf "${TESTHOME}"
}

function dotsend_test_setup {
    if [[ -d "${TESTHOME}" ]]
    then
	printf "${BADDIR}" "${TESTHOME}"
	exit 1
    else
	mkdir -p "${TESTHOME}/${TESTPATH}"
	touch "${TESTHOME}/${TESTFILE}"
	touch "${TESTHOME}/${TESTENVS}"
	printf "%s" "DOTHOME=${TESTHOME}/${TESTPATH}" > "${TESTHOME}/${TESTENVS}"
    fi
}

function dotsend_test_send {
    HOME="${TESTHOME}"

}
