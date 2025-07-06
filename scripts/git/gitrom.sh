#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitrom.sh

Git rebase with origin/master.

'
    exit
fi
git rebase -i origin/master
