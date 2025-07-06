#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitpl.sh

Git pull.

'
    exit
fi
git pull
