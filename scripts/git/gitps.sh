#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitps.sh [option]

Git push the current branch. "option" arg generally used for "-f" force pushing.

'
    exit
fi
currentBranch=`git branch|awk '/\*/{print $2}'`
git push origin $currentBranch $1
