#!/usr/bin/env bash
# dotfiles/install/install.sh

# A simple script for detecting the OS and running the appropriate install script.

set -e

OS="$(uname -s)"
DOTFILES="$HOME/dotfiles"

if grep -q Microsoft /proc/version 2>/dev/null; then
    echo "🌐 Detected WSL"
    bash "$DOTFILES/install/install-wsl.sh"
elif [[ "$OS" == "Darwin" ]]; then
    echo "🍎 Detected macOS"
    bash "$DOTFILES/install/install-mac.sh"
elif [[ "$OS" == "Linux" ]]; then
    echo "🐧 Detected Linux (non-WSL). No script yet."
else
    echo "🛑 Unsupported OS: $OS"
    exit 1
fi
