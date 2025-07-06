#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitl.sh numberOfCommits

Git log. If "numberOfCommits" provided, will only output that many commits.

'
    exit
fi

if [ $# -eq 0 ]; then
    git log
else 
    git log -n $1
fi
