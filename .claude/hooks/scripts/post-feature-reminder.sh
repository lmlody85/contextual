#!/usr/bin/env bash
# PostToolUse hook for Write|Edit.
# Exits silently unless the edited file is a feature/index doc that warrants
# a "consider running /validate-docs" reminder.
#
# Contract:
#   stdin  → tool call JSON
#   stdout → empty (exit 0) | JSON with hookSpecificOutput.additionalContext (exit 0)
#   stderr → empty
#   exit   → 0 always (advisory only, never blocks)

set -euo pipefail

# Read tool input from stdin
INPUT=$(cat)

# Extract file path — works for both Write (file_path) and Edit (file_path)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# No file path → silent exit
[ -z "$FILE_PATH" ] && exit 0

# Match: new FEAT doc, index files, or research docs
case "$FILE_PATH" in
  */docs/features/FEAT-*.md|*/docs/FEATURES.md|*/docs/FEATURE-MAP.md|*/docs/CURRENT.md|*/docs/research/*.md)
    cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "PostToolUse",
    "additionalContext": "Documentation file modified. If feature work is complete, consider running /validate-docs to check consistency."
  }
}
EOF
    exit 0
    ;;
  *)
    # Not a tracked doc file — silent exit, no context injection
    exit 0
    ;;
esac
