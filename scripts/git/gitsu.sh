#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitsu.sh

Switch the global git user.

'
    exit
fi
personal="personal"
cap1="cap1"

cap1Username="AndrewWillette"
cap1Email="andrew.willette@capitalone.com"

personalUsername="andrewwillette"
personalEmail="willette.andrew1846@gmail.com"

user=$(printf "${personal}\n${cap1}"|fzf)

if [ "$user" = "$personal" ]; then
    git config --global user.name "${personalUsername}"
    git config --global user.email "${personalEmail}"
fi
if [ "$user" = "$cap1" ]; then
  git config --global user.name "${cap1Username}"
  git config --global user.email "${cap1Email}"
fi
