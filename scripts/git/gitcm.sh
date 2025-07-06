#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitcm.sh commitMessage

Create git commit with commitMessage prepended with the current git branch name.

'
    exit
fi
# currentBranch - used in deprecated workflow, prepend to git commit message
currentBranch=`git branch|awk '/\*/{print $2}'`

git commit -m "$@"
