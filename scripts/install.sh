#!/bin/sh

set -eu

DOTFILES_DIR="$HOME/git/dotfiles"
DOTFILES_PRIVATE_DIR="$HOME/git/dotfiles_private"
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

# Ensure .zshrc sources the dotfiles version
ZSHRC_SOURCE_LINE="source \"$DOTFILES_DIR/zsh/.zshrc\""
if [ ! -e "$HOME/.zshrc" ]; then
  cat > "$HOME/.zshrc" << EOF
# Source dotfiles zshrc
$ZSHRC_SOURCE_LINE
EOF
  echo "Created $HOME/.zshrc"
elif ! grep -qF "$ZSHRC_SOURCE_LINE" "$HOME/.zshrc"; then
  cat >> "$HOME/.zshrc" << EOF

# Source dotfiles zshrc
$ZSHRC_SOURCE_LINE
EOF
  echo "Added dotfiles source line to $HOME/.zshrc"
else
  echo "$HOME/.zshrc already sources dotfiles"
fi
link_file "$DOTFILES_DIR/.hammerspoon" "$HOME/.hammerspoon"

if [ -d "$DOTFILES_PRIVATE_DIR" ]; then
  link_file "$DOTFILES_PRIVATE_DIR/.zshenv" "$HOME/.zshenv"
  mkdir -p "$HOME/.claude"
  link_file "$DOTFILES_PRIVATE_DIR/.claude/settings.json" "$HOME/.claude/settings.json"
  link_file "$DOTFILES_PRIVATE_DIR/.claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
fi

mkdir -p "$CONFIG_DIR"

for dir in "$DOTFILES_DIR/.config/"*; do
  [ -d "$dir" ] || continue
  name=$(basename "$dir")
  link_file "$dir" "$CONFIG_DIR/$name"
done

link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

echo "Dotfiles installation complete."
