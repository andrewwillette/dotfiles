#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitaa.sh

Git add all changes.

'
    exit
fi
git add --all
