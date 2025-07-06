#!/bin/sh

set -eu

DOTFILES_DIR="$HOME/git/dotfiles"
CONFIG_DIR="$HOME/.config"
timestamp="$(date +%s)"

backup_file() {
  target=$1
  if [ -e "$target" ] || [ -L "$target" ]; then
    mv "$target" "$target.backup.$timestamp"
    echo "Backed up existing $target"
  fi
}

link_file() {
  src=$1
  dest=$2
  backup_file "$dest"
  ln -s "$src" "$dest"
  echo "Linked $src → $dest"
}

# --- Link ~/.zshrc ---
link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# --- Link ~/.hammerspoon ---
link_file "$DOTFILES_DIR/.hammerspoon" "$HOME/.hammerspoon"

# --- Link directories in .config ---
mkdir -p "$CONFIG_DIR"

for dir in "$DOTFILES_DIR/.config/"*; do
  [ -d "$dir" ] || continue
  name=$(basename "$dir")
  link_file "$dir" "$CONFIG_DIR/$name"
done

# --- Configure global .gitignore ---
GITIGNORE_GLOBAL="$DOTFILES_DIR/git/gitignore_global"
git config --global core.excludesFile "$GITIGNORE_GLOBAL"
echo "Set Git global excludesFile to $GITIGNORE_GLOBAL"

# --- Link ~/.gitconfig ---
link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

echo "✅ Dotfiles installation complete."
