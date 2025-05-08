#!/bin/bash

# TMUX Setup Script
# This script installs tmux, dependencies, and sets up the plugin manager

set -e  # Exit on error

echo "=== Starting tmux setup ==="

# Determine the package manager
if command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
    INSTALL_CMD="sudo apt install -y"
elif command -v dnf &> /dev/null; then
    PKG_MANAGER="dnf"
    INSTALL_CMD="sudo dnf install -y"
elif command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
    INSTALL_CMD="sudo pacman -S --noconfirm"
elif command -v brew &> /dev/null; then
    PKG_MANAGER="brew"
    INSTALL_CMD="brew install"
else
    echo "No supported package manager found. Please install tmux and xclip manually."
    exit 1
fi

echo "=== Detected package manager: $PKG_MANAGER ==="

# Install tmux and clipboard utility based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "=== Installing tmux on macOS ==="
    $INSTALL_CMD tmux
else
    echo "=== Installing tmux and xclip on Linux ==="
    $INSTALL_CMD tmux xclip
fi

# Create config directory if it doesn't exist
mkdir -p ~/.config/tmux/plugins

# Install TPM if not already installed
if [ ! -d ~/.config/tmux/plugins/tpm ]; then
    echo "=== Installing Tmux Plugin Manager (TPM) ==="
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
else
    echo "=== TPM already installed ==="
fi

# Install the configured plugins
echo "=== Installing plugins ==="
~/.config/tmux/plugins/tpm/bin/install_plugins

echo "=== Setup complete! ==="
echo "Your tmux configuration has been set up. You can start tmux with the 'tmux' command."
echo "- Use prefix + I to install any new plugins defined in your tmux.conf"
echo "- Use prefix + r to reload your tmux configuration"
echo "- Your prefix key is configured as Ctrl+s"