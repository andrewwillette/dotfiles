#/usr/bin/env zsh
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./nvim_read_logs.sh

lnav nvim logs

'
    exit
fi
lnav ~/.local/state/nvim/log
