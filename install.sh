#!/bin/bash
# Install PRP Project Setup Skill to Claude Code

SKILL_DIR="$HOME/.claude/skills/prp-project-setup"

# Create directories
mkdir -p "$SKILL_DIR/references"

# Copy files
cp SKILL.md "$SKILL_DIR/"
cp references/* "$SKILL_DIR/references/"

echo "Installed to $SKILL_DIR"
