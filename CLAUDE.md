# Claude Code Instructions

> **Supplement to [AGENTS.md](AGENTS.md)** — Claude Code automation only

## Automated Validation

- PostToolUse hook detects feature work
- Prompts: "Would you like me to validate docs?"
- Say `validate docs` to run manually

**Config:** [.claude/README.md](.claude/README.md)

## TodoWrite Integration

Include "Validate documentation" as final step in todo lists.

## Smart Hooks

**post-feature-reminder** detects:
- New FEAT files created
- Features marked complete
- Major doc updates

Then prompts validation (ask, don't auto-run).
