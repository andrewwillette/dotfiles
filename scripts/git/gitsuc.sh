#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitsuc.sh

Switch the current git user to CapitalOne configuration.

'
    exit
fi
git config --global user.name "rjm995"
git config --global user.email "andrew.willette@capitalone.com"
