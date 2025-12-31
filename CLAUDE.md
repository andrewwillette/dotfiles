# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

Personal dotfiles for a macOS terminal development environment. Contains configuration for Neovim, Kitty terminal, Hammerspoon automation, Zsh shell, and Git.

## Installation

Works on macOS with Zsh. Not tested on other platforms.

```bash
./install.sh
```

This creates symlinks from this repo to the appropriate locations (~/.zshrc, ~/.config/nvim, ~/.config/kitty, ~/.hammerspoon, ~/.gitconfig). Existing files are backed up with timestamps.

## Structure

- `.config/nvim/` - Neovim configuration (Lua-based, uses lazy.nvim package manager)
- `.config/kitty/` - Kitty terminal emulator configuration
- `.hammerspoon/` - Hammerspoon window management and app launcher hotkeys
- `zsh/.zshrc` - Zsh shell configuration
- `git/` - Git configuration and global gitignore

## Neovim Architecture

The Neovim config uses a modular Lua structure in `.config/nvim/lua/`:

- `init.lua` - Entry point, loads basic settings
- `lazy-config.lua` - Plugin specifications for lazy.nvim (the package manager)
- `lsp-config.lua` - Language server protocol configuration
- `keymappings.lua` - Custom key bindings
- Individual plugin configs follow the pattern `{plugin}-config.lua`

Key plugins: GitHub Copilot, fzf-lua, neotest, DAP debugger, treesitter, Mason (LSP manager).

## Testing

After making changes to Neovim configuration, run:

```bash
./scripts/test-nvim-startup.sh
```

This verifies Neovim starts without errors in headless mode.
