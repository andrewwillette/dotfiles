#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitb.sh

Print out current branch.

'
    exit
fi
git branch|awk '/\*/ {print $2}'
