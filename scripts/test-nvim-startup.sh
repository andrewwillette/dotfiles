#!/bin/bash
# Test that Neovim starts without errors

set -e

echo "Testing Neovim headless startup..."

# Capture stderr to check for errors
stderr_output=$(nvim --headless -c 'quitall!' 2>&1)

if [ -n "$stderr_output" ]; then
    echo "FAIL: Neovim startup produced errors:"
    echo "$stderr_output"
    exit 1
fi

echo "PASS: Neovim started successfully"
