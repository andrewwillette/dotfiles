#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./ls_willette_log.sh

    Startup less command on appropriate log file for ls_willette project.

'
    exit
fi

less -R +F $(find $HOME/git/ls_willette/target/logs -maxdepth 1 -type f -exec ls -1rt "{}" +| tail -n 1)
