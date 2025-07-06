#!/bin/sh
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitdh.sh [filepath]

Git diff HEAD. "filepath" option allows for a single file diff to be displayed.

'
    exit
fi

if [ $# -eq 0 ]
then
  git diff HEAD
else
  git diff HEAD $1
fi
