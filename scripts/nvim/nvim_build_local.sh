#/usr/bin/env zsh
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./nvim_build_local.sh

Build local neovim instance. Generally used for neovim development.

'
    exit
fi
cd ~/git/neovim
sudo make distclean
sudo make clean
sudo make install
