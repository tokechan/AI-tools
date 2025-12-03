#!/bin/bash

# Codex CLI Configuration Setup Script (Mac/Linux)
# This script copies AGENTS.md to the Codex CLI configuration directory

set -e

CODEX_DIR="$HOME/.codex"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Codex CLI Configuration Setup"
echo "=================================="
echo ""

# Check if .codex directory exists
if [ ! -d "$CODEX_DIR" ]; then
    echo "⚠️  Warning: $CODEX_DIR does not exist."
    echo "   Creating directory..."
    mkdir -p "$CODEX_DIR"
fi

# Copy AGENTS.md
if [ -f "$SCRIPT_DIR/AGENTS.md" ]; then
    echo "📝 Copying AGENTS.md to $CODEX_DIR/"
    cp "$SCRIPT_DIR/AGENTS.md" "$CODEX_DIR/AGENTS.md"
    echo "✅ AGENTS.md has been installed successfully!"
else
    echo "❌ Error: AGENTS.md not found in $SCRIPT_DIR"
    exit 1
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "  - Verify the configuration: cat $CODEX_DIR/AGENTS.md"
echo "  - Start using Codex CLI with your global rules"
echo ""

