#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitbd.sh

Delete git branches via fzf selection. Supports multiple selections. Branches are sorted by most recent commit.

'
    exit
fi
git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)'| sed -E 's/^[[:space:]]|\*|[[:space:]] *//g' | fzf --tac --multi --cycle|xargs git branch -D
