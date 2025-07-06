#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitc.sh

Print out local git configuration.

'
    exit
fi
git config -l
