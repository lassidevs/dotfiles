#!/usr/bin/env bash
# dotfiles/install/install-wsl.sh

# A simple for for creating symlinks.

set -e
DOTFILES="$HOME/dotfiles"

echo "🔗 Symlinking WSL configs..."

ln -sf "$DOTFILES/shared/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/shared/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES/wsl/.zshrc" "$HOME/.zshrc"

echo "✅ WSL symlinking complete."
