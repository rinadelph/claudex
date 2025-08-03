# Contributing to Claudex

Thank you for your interest in contributing to Claudex! This document provides guidelines for contributing to the project.

## How to Contribute

### Reporting Issues
- Use the GitHub issue tracker to report bugs
- Include your operating system, tmux version, and Claude CLI version
- Provide steps to reproduce the issue
- Include relevant error messages or logs

### Suggesting Features
- Open an issue with the "enhancement" label
- Describe the feature and its use case
- Explain how it would benefit other users

### Code Contributions

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**
4. **Test your changes**:
   - Test on different operating systems if possible
   - Ensure tmux integration works correctly
   - Verify Claude CLI compatibility
5. **Commit your changes**: `git commit -m 'Add amazing feature'`
6. **Push to the branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

### Code Style
- Follow existing bash scripting conventions
- Use meaningful variable names
- Add comments for complex logic
- Ensure scripts are POSIX-compliant when possible

### Testing
- Test on Linux and macOS if possible
- Verify tmux session management works correctly
- Check error handling and edge cases
- Test with and without tmux installed

## Development Setup

1. Clone your fork:
   ```bash
   git clone https://github.com/your-username/claudex.git
   cd claudex
   ```

2. Make the scripts executable:
   ```bash
   chmod +x claudex install-claudex.sh
   ```

3. Test locally:
   ```bash
   ./install-claudex.sh
   claudex --help
   ```

## Pull Request Process

1. Update documentation if needed
2. Add yourself to contributors if you'd like
3. Ensure CI passes (once set up)
4. Request review from maintainers

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help newcomers to the project
- Follow GitHub's community guidelines

## Questions?

Feel free to open an issue for questions about contributing!