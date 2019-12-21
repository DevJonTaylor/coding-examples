#!/usr/bin/env bash
# Gets location the symbolic link is pointing top.
TARGET=`readlink ${0}`

# Gets directory of the target.
DIR=`dirname ${TARGET}`

# change directory to the revealing directory of target.
cd ${DIR}

# Running npm without standard commandline output.
# All arguments passed to the symbolic link are then passed to the script ran by npm here.
npm --silent run build-cli $@