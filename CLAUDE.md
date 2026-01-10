# Claude Code Instructions

> **Supplement to [AGENTS.md](AGENTS.md)** — Claude Code automation only

## Quick Reference

| Asset | Location | Trigger |
|-------|----------|---------|
| Docs Validator Agent | `.claude/agents/docs-validator.md` | "validate docs" |
| Contextual Skill | `.claude/skills/contextual/` | "set up Contextual", "scaffold docs", "validate docs" |
| Post-Feature Hook | `.claude/hooks/post-feature-reminder.md` | Auto (PostToolUse) |

**Config:** [.claude/README.md](.claude/README.md)

---

## Session Management

Claude Code supports native session continuation:

| Command | Use Case |
|---------|----------|
| `claude --continue` | Resume last session with full context |
| `claude --resume <id>` | Resume specific session |
| `/plan` | Enter plan mode for complex features |
| `Ctrl+B` | Run task in background while continuing |

**Cross-tool handoff:** CURRENT.md remains authoritative for handoffs to other AI tools (Cursor, Copilot). Update it before ending sessions.

---

## Custom Agents

### docs-validator
Validates documentation consistency across the project.

**Invoke:** "validate docs" or "check documentation"

**Checks:**
- All features indexed in FEATURES.md
- Dependencies bidirectional in FEATURE-MAP.md
- All links valid
- Files in "Files Changed" exist

---

## Skills

### contextual
AI-native documentation framework scaffolding and validation.

**Location:** `.claude/skills/contextual/`

**Commands:**
- "set up Contextual" or "scaffold docs" — Initialize framework
- "validate docs" — Run validation checks

**Note:** Skills hot-reload automatically (no restart needed).

---

## Hooks

### post-feature-reminder (PostToolUse)

Automatically detects feature work completion and prompts validation.

**Triggers on:**
- New `FEAT-*.md` file created
- TODO section changed to "Feature complete"
- 2+ documentation files modified

**Action:** Prompts "Would you like me to validate docs?" (asks, doesn't auto-run)

---

## TodoWrite Integration

When creating todo lists for feature work, include validation as final step:

```
1. Research existing patterns
2. Create FEAT-xxx.md
3. Implement feature
4. Update indexes
5. Validate documentation  ← Always include
```

---

## AskUserQuestion Guidance

Claude Code has access to `AskUserQuestion` for interactive clarification. Use it proactively:

**For new features:**
- Scope boundaries unclear
- Multiple valid technical approaches
- User experience trade-offs
- Integration points ambiguous

**For research:**
- Depth vs breadth trade-off
- Which aspects to prioritize
- Output format preferences

See AGENTS.md "Clarifying Questions" section for specific prompts.
