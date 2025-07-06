#!/usr/bin/env python3

from pynvim import attach
nvim = attach('socket', path='/tmp/nvim')
print(nvim.api.get_chan_info(8))
