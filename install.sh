#!/usr/bin/env bash
# Install the anti-hallucination skill into ~/.claude/
# Places SKILL.md (and reference docs) under ~/.claude/skills/anti-hallucination/
# and the slash command under ~/.claude/commands/hallucination-check.md
#
# Idempotent: safe to re-run after pulling updates.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${HOME}/.claude/skills/anti-hallucination"
COMMANDS_DIR="${HOME}/.claude/commands"

mkdir -p "${SKILLS_DIR}" "${COMMANDS_DIR}"

# Copy skill files (SKILL.md is the entrypoint Claude Code reads)
cp "${REPO_DIR}/SKILL.md" "${SKILLS_DIR}/SKILL.md"
cp "${REPO_DIR}/README.md" "${SKILLS_DIR}/README.md"
cp -r "${REPO_DIR}/docs" "${SKILLS_DIR}/docs"

# Install the slash command
cp "${REPO_DIR}/commands/hallucination-check.md" "${COMMANDS_DIR}/hallucination-check.md"

echo "Installed:"
echo "  Skill:         ${SKILLS_DIR}/SKILL.md"
echo "  Slash command: ${COMMANDS_DIR}/hallucination-check.md"
echo
echo "Verify with: /hallucination-check in a new Claude Code session."
echo
echo "Optional: append the CLAUDE.md snippet from README.md to ~/.claude/CLAUDE.md"
echo "to enable the silent self-check before every substantive response."
