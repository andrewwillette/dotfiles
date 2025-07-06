#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitsup.sh

Switch the current git user to personal configuration.

'
    exit
fi
git config --global user.name "andrewwillette"
git config --global user.email "willette.andrew1846@gmail.com"
