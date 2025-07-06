#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitshh.sh

Git reset hard HEAD.

'
    exit
fi
git reset --hard HEAD
