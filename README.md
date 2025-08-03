# Claudex - Claude CLI with Tmux Integration

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell Script](https://img.shields.io/badge/shell-bash-blue.svg)](https://www.gnu.org/software/bash/)
[![Tmux](https://img.shields.io/badge/tmux-compatible-green.svg)](https://github.com/tmux/tmux)

A powerful wrapper for the Claude CLI that automatically manages tmux sessions, making it easy to run multiple Claude instances and maintain persistent sessions.

## 🎯 Why Claudex?

- **Never lose your Claude sessions** - Tmux keeps them running even if you disconnect
- **Multi-project workflow** - Each folder gets its own organized session
- **Development-ready** - Pre-configured tmux with shortcuts for coding workflows
- **Zero configuration** - Works out of the box with sensible defaults

## Features

- 🚀 **Auto-session management**: Creates tmux sessions named after your current folder
- 🔄 **Session persistence**: Resume Claude sessions after disconnection
- 📁 **Multiple sessions**: Run different Claude instances per project
- ⚡ **Smart detection**: Lists existing sessions and handles duplicates
- 🎯 **Enhanced tmux config**: Optimized for development workflows

## Quick Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/claudex.git
cd claudex

# Run the installer
./install-claudex.sh
```

### One-line Install
```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/claudex/main/install-claudex.sh | bash
```

## Manual Installation

1. **Install claudex command:**
   ```bash
   cp claudex ~/.local/bin/claudex
   chmod +x ~/.local/bin/claudex
   ```

2. **Install tmux configuration:**
   ```bash
   cp tmux.conf ~/.tmux.conf
   ```

3. **Add to PATH** (if needed):
   ```bash
   echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
   source ~/.bashrc
   ```

## Usage

### Basic Usage
```bash
# Start Claude in a tmux session named after current folder
claudex

# Start Claude with a specific session suffix
claudex dev
claudex testing
claudex experimental

# Use predefined session types
claudex -c          # Creates 'folder_continue' session
claudex -r          # Creates 'folder_resume' session
claudex --continue  # Same as -c
claudex --resume    # Same as -r
```

### Example Workflow
```bash
# In project folder /home/user/myproject
cd myproject

# Start main Claude session
claudex
# Creates session: myproject

# In another terminal, start development session
claudex dev
# Creates session: myproject_dev

# List all sessions
tmux list-sessions

# Attach to specific session
tmux attach-session -t myproject_dev
```

## Tmux Configuration Features

### Key Bindings
- **Prefix key**: `Ctrl-b` (default tmux prefix)
- **Split panes**: 
  - `Ctrl-b |` - Split horizontally
  - `Ctrl-b -` - Split vertically
- **Navigate panes**: `Ctrl-b h/j/k/l` (vim-style)
- **Resize panes**: `Ctrl-b H/J/K/L` (hold and repeat)
- **Reload config**: `Ctrl-b r`

### Session Management
- **New Claude session**: `Ctrl-b C`
- **Choose session**: `Ctrl-b s`
- **New session**: `Ctrl-b S`

### Development Shortcuts
- **Development layout**: `Ctrl-b D` (splits for code, logs, git)
- **Git status**: `Ctrl-b G` (opens git status in split)

### Copy Mode (Vi-style)
- **Enter copy mode**: `Ctrl-b [`
- **Start selection**: `v`
- **Copy selection**: `y` (copies to system clipboard if xclip installed)

## Advanced Features

### Session Naming Logic
- Sessions are named after the current folder
- Special characters are converted to underscores
- Suffixes are added for different session types

### Smart Session Handling
- Shows existing sessions for the current folder
- Prevents duplicate sessions
- Auto-attaches to existing sessions
- Graceful fallback if tmux isn't available

### Environment Detection
- Detects if already in tmux (runs Claude directly)
- Checks for interactive terminal (handles scripts gracefully)
- Validates dependencies and provides helpful errors

## Dependencies

### Required
- **tmux**: Terminal multiplexer
- **Claude CLI**: Anthropic's Claude command-line interface

### Optional
- **xclip** (Linux): For clipboard integration in copy mode

### Installation Commands
```bash
# Ubuntu/Debian
sudo apt install tmux xclip

# macOS
brew install tmux

# CentOS/RHEL
sudo yum install tmux
```

## Troubleshooting

### Path Issues
If `claudex` command not found:
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Claude CLI Not Found
Install Claude CLI from: https://docs.anthropic.com/en/docs/build-with-claude/claude-code

### Session Not Attaching
Check if you're already in tmux:
```bash
echo $TMUX
# If output exists, you're already in tmux
```

### Configuration Not Loading
Reload tmux configuration:
```bash
tmux source-file ~/.tmux.conf
```

## Customization

### Modify Session Naming
Edit the `base_name` variable in claudex script:
```bash
# Current: uses folder name
base_name=$(basename "$PWD" | tr '.' '_' | tr ' ' '_')

# Custom: add prefix
base_name="claude_$(basename "$PWD" | tr '.' '_' | tr ' ' '_')"
```

### Change Tmux Prefix
Edit `~/.tmux.conf`:
```bash
# Change from Ctrl-b to Ctrl-a
set -g prefix C-a
bind-key C-a send-prefix
```

### Add Custom Claude Arguments
Modify the claude execution line in claudex:
```bash
# Current
claude --dangerously-skip-permissions "$@"

# Add custom flags
claude --dangerously-skip-permissions --custom-flag "$@"
```

## File Structure

```
claudex-package/
├── claudex              # Main command script
├── tmux.conf           # Tmux configuration
├── install-claudex.sh  # Installation script
└── CLAUDEX_README.md   # This documentation
```

## License

This tool is provided as-is for development convenience. Claude CLI is property of Anthropic.