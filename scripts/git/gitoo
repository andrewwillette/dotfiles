#!/bin/sh
# git open origin
originalDir=$(pwd)
declare -a gitOrigins
for dir in ~/git/*/ ; do
    cd "$dir"
    originUrl=$(git config -l|grep "origin.url"|sed -n 's/^.*https/https/p'|sed -e 's/\.git$//')
    if [ -n "$originUrl" ]; then
        gitOrigins+=("$originUrl")
    fi
done
open $(printf '%s\n' "${gitOrigins[@]}"|fzf)
cd "$originalDir"
