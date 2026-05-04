#!/usr/bin/env bash
# PostToolUse hook for Bash.
# Exits silently unless the command was a PR/merge operation.
#
# Contract:
#   stdin  → tool call JSON
#   stdout → empty (exit 0) | JSON with hookSpecificOutput.additionalContext (exit 0)
#   stderr → empty
#   exit   → 0 always

set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

[ -z "$COMMAND" ] && exit 0

# Match the four PR/merge command prefixes (allow surrounding whitespace and args)
if echo "$COMMAND" | grep -qE '^[[:space:]]*(gh[[:space:]]+pr[[:space:]]+(create|merge)|git[[:space:]]+(merge|pull))(\b|$)'; then
  cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "PostToolUse",
    "additionalContext": "PR/merge command just executed. Run the docs-validator agent (or /validate-docs) to check that documentation is in sync with the merged changes."
  }
}
EOF
fi

exit 0
