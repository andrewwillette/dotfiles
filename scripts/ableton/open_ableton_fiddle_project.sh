#!/bin/sh

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./open_ableton_fiddle_project.sh

    Open ableton fiddle project, files location hard-coded to where I (Andrew Willette) save ableton projects

'
    exit
fi

fiddle_projects=$HOME/Documents/Production/fiddle_projects
selectedAbletonProject=$(ls $fiddle_projects| sed 's/ Project$//g'|fzf)
ableton_program="Ableton Live 12 Standard"
open "$fiddle_projects/$selectedAbletonProject Project/$selectedAbletonProject.als" -a "$ableton_program"
