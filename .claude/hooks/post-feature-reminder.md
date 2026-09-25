# Post-Feature Validation Reminder

> **Note:** This is a prompt-level convention that Claude follows via CLAUDE.md, not a Claude Code hook (Claude Code only runs hooks configured in `.claude/settings.json`). To make it automatic, wire a PostToolUse hook that runs `scripts/validate-docs.sh`; see [.claude/README.md](../README.md).

## Trigger Conditions

Any of these means a piece of feature work is finishing:

- A new `docs/features/FEAT-*.md` (or `API-*`, `INFRA-*`) file was created
- A feature doc's TODO section now says "Feature complete"
- Two or more of FEATURES.md, FEATURE-MAP.md, CURRENT.md, or `docs/research/*.md` changed in this piece of work

## Action

Before ending the turn, run `scripts/validate-docs.sh` from the project root and fix what it reports. The script is read-only and cheap, so run it rather than asking the user whether to. Mention the result in one line of your summary (for example: "Validation: clean" or "Validation: fixed a missing FEATURE-MAP entry").

Run it once per piece of work, not after every edit.
