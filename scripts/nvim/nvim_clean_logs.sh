#/usr/bin/env zsh
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./nvim_clean_logs.sh

Clean nvim and nvim lsp logs from local machine

'
    exit
fi
rm ~/.local/state/nvim/lsp.log
rm ~/.local/state/nvim/log
