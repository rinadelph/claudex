#!/bin/bash

# Installation script for claudex and tmux configuration
# Usage: ./install-claudex.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.local/bin"
CONFIG_DIR="$HOME"

echo "🚀 Installing claudex and tmux configuration..."

# Create install directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Copy claudex script
echo "📋 Installing claudex command..."
cp "$SCRIPT_DIR/claudex" "$INSTALL_DIR/claudex"
chmod +x "$INSTALL_DIR/claudex"

# Check if PATH includes .local/bin
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo "⚠️  Warning: $HOME/.local/bin is not in your PATH"
    echo "   Add this to your shell config (.bashrc, .zshrc, etc.):"
    echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

# Install tmux configuration
echo "⚙️  Installing tmux configuration..."
if [ -f "$CONFIG_DIR/.tmux.conf" ]; then
    echo "   Backing up existing tmux config to .tmux.conf.backup"
    cp "$CONFIG_DIR/.tmux.conf" "$CONFIG_DIR/.tmux.conf.backup"
fi

cp "$SCRIPT_DIR/tmux.conf" "$CONFIG_DIR/.tmux.conf"

# Check dependencies
echo "🔍 Checking dependencies..."

if ! command -v tmux &> /dev/null; then
    echo "⚠️  tmux is not installed. Install with:"
    echo "   Ubuntu/Debian: sudo apt install tmux"
    echo "   macOS: brew install tmux"
    echo "   CentOS/RHEL: sudo yum install tmux"
fi

if ! command -v claude &> /dev/null; then
    echo "⚠️  Claude CLI is not installed. Install from:"
    echo "   https://docs.anthropic.com/en/docs/build-with-claude/claude-code"
fi

if command -v xclip &> /dev/null; then
    echo "✅ xclip found - clipboard integration enabled"
else
    echo "💡 Optional: Install xclip for clipboard integration"
    echo "   Ubuntu/Debian: sudo apt install xclip"
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "📖 Usage examples:"
echo "   claudex                    # Start Claude in tmux session named after current folder"
echo "   claudex dev                # Start Claude in session named 'folder_dev'"
echo "   claudex -c                 # Start in 'continue' session"
echo "   claudex -r                 # Start in 'resume' session"
echo ""
echo "🎯 Tmux shortcuts:"
echo "   Ctrl-b |                   # Split horizontally"
echo "   Ctrl-b -                   # Split vertically"
echo "   Ctrl-b h/j/k/l             # Navigate panes (vim-style)"
echo "   Ctrl-b C                   # Create new Claude session"
echo "   Ctrl-b r                   # Reload tmux config"
echo "   Ctrl-b s                   # Choose session"
echo ""
echo "🔄 To reload tmux config: tmux source-file ~/.tmux.conf"