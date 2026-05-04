---
description: Run the docs-validator agent to check documentation consistency
allowed-tools: Read Glob Grep Bash
---

# Validate Documentation

Invoke the `docs-validator` subagent to run the full validation checklist on the project's documentation.

The agent checks:
- All `docs/features/FEAT-*.md` files are listed in `docs/FEATURES.md`
- All entries in `FEATURES.md` correspond to actual files
- Feature dependencies are bidirectional (`Depends on` ↔ `Dependents`)
- All internal markdown links resolve to existing files
- Research docs are indexed in `docs/research/README.md`
- `Files Changed` paths exist in the repository

Use the Agent tool with `subagent_type: docs-validator` and pass the user's argument (`$ARGUMENTS`) as scope guidance if provided. If no arguments, run full validation.

**Reference:** [.claude/agents/docs-validator.md](../agents/docs-validator.md)
