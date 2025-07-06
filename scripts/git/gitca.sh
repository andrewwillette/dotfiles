#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitca.sh

Execute git commit ammend with no editing of commit message.

'
    exit
fi
git commit --amend --no-edit
