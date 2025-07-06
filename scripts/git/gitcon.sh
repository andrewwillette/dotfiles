#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitcon.sh newGitBranch

Git checkout newGitBranch.

'
    exit
fi
git checkout -b $1
