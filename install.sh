#!/bin/bash

set -e

PLUGIN_DIR="$HOME/.claude/plugins/claude-code-digest"
SKILL_DIR="$HOME/.claude/skills"

echo "Installing Claude Code Digest..."

if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is required but not installed."
    echo "Install with: brew install gh"
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "Error: jq is required but not installed."
    echo "Install with: brew install jq"
    exit 1
fi

if ! gh auth status &> /dev/null; then
    echo "Error: GitHub CLI is not authenticated."
    echo "Run: gh auth login"
    exit 1
fi

mkdir -p "$PLUGIN_DIR"
mkdir -p "$SKILL_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp -r "$SCRIPT_DIR/scripts" "$PLUGIN_DIR/"
cp -r "$SCRIPT_DIR/skills" "$PLUGIN_DIR/"

chmod +x "$PLUGIN_DIR/scripts/digest.sh"

if [ ! -L "$SKILL_DIR/analyze-digest.md" ]; then
    ln -sf "$PLUGIN_DIR/skills/analyze-digest.md" "$SKILL_DIR/analyze-digest.md"
fi

echo ""
echo "Installation complete!"
echo ""
echo "Usage:"
echo "  1. Generate digest:  $PLUGIN_DIR/scripts/digest.sh [DAYS] [OUTPUT_DIR]"
echo "  2. Ask Claude:       'Analyze the Claude Code digest on my Desktop'"
echo ""
echo "Optional: Add to PATH:"
echo "  echo 'export PATH=\"\$PATH:$PLUGIN_DIR/scripts\"' >> ~/.zshrc"
