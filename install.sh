#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.claude
ln -sf "$DOTFILES_DIR/dot-claude/commands" ~/.claude/commands

echo "Dotfiles installed."
