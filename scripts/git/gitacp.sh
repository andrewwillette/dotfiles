#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitacp.sh msg

Adds all git changes. Commits with msg. Pushes to origin.

'
    exit
fi
git add --all
currentBranch=`git branch|awk '/\*/{print $2}'`
git commit -m "$currentBranch: $@"
git push origin $currentBranch
