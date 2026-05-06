---
description: Scaffold the Contextual documentation framework in this project
allowed-tools: Read Write Edit Glob Bash
---

# Scaffold Contextual Framework

Initialize the Contextual documentation framework in the current project. This invokes the `contextual` skill's setup procedure.

**Steps:**

1. Check whether `AGENTS.md` and `docs/` already exist. If so, stop and ask the user whether to overwrite, augment, or abort.

2. Use the Skill tool to invoke `contextual` with the user's argument (`$ARGUMENTS`) — the skill handles scaffolding via [SETUP.md](../skills/contextual/SETUP.md).

3. After scaffolding, suggest the user run `/validate-docs` to confirm the structure is consistent.

4. Recommend they add a tool-specific supplement next:
   - For Claude Code: ensure `CLAUDE.md` is in place (this project ships with one)
   - For Cursor: create `.cursorrules` from AGENTS.md
   - For Copilot: create `.github/copilot-instructions.md`

**Reference:** [SETUP.md](../skills/contextual/SETUP.md), [implement-contextual.md](../../prompts/implement-contextual.md)
