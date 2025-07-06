#/usr/bin/env zsh

currentDir=$(pwd)
cd ~/git
toOpen=$(ls -la|awk '{print $9;}'|fzf)

if [ -n "$toOpen" ]
then
    cd $toOpen
  else
  cd $currentDir
fi
