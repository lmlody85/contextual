# Claude Code Instructions

> **Supplement to [AGENTS.md](AGENTS.md)** — Claude Code automation only

## Quick Reference

| Asset | Location | Trigger |
|-------|----------|---------|
| Docs Validator Agent | `.claude/agents/docs-validator.md` | "validate docs", `/validate-docs`, auto on PR/merge |
| Slash Commands | `.claude/commands/` | `/new-feat`, `/validate-docs`, `/scaffold-contextual` |
| Contextual Skill | `.claude/skills/contextual/` | "set up Contextual", "scaffold docs", auto in `docs/` |
| Hooks (3) | `.claude/settings.json` | See Hooks section below |

**Full config overview:** [.claude/README.md](.claude/README.md)

---

## Session Management

| Command | Use Case |
|---------|----------|
| `claude --continue` | Resume last session with full context |
| `claude --resume <id>` | Resume specific session by ID or name |
| `claude -n <name>` | Start a named session |
| `/plan` | Enter plan mode for complex features |
| `Ctrl+B` | Run task in background while continuing |
| `/resume` | Switch sessions interactively (with picker) |

**Cross-tool handoff:** CURRENT.md remains authoritative for handoffs to other AI tools (Cursor, Copilot). Update it before ending sessions.

---

## Custom Agents

### docs-validator

Validates documentation consistency across the project.

**Invoke:** "validate docs", "check documentation", "lint docs", "are my docs in sync"

**Also auto-invoked** after `gh pr create`, `gh pr merge`, `git merge`, or `git pull` (via PostToolUse hook).

**Checks:**
- All features indexed in FEATURES.md
- Dependencies bidirectional in FEATURE-MAP.md
- All internal links valid
- Research docs indexed in research/README.md
- Files in "Files Changed" exist

---

## Skills

### contextual

AI-native documentation framework scaffolding and validation.

**Location:** `.claude/skills/contextual/`

**Commands:**
- "set up Contextual" or "scaffold docs" — Initialize framework in a new project
- "validate docs" — Run validation checks

**Auto-suggested** when working in `docs/`, `AGENTS.md`, or `CLAUDE.md` (via `paths` frontmatter).

**Note:** Skills hot-reload automatically — edits take effect immediately, no restart needed.

---

## Hooks

Hooks are configured in `.claude/settings.json`. See `.claude/hooks/README.md` for design rationale.

### 1. Session Drift Check (SessionStart)
Runs `git log --oneline -5` at the start of every session. If recent commits touched source files without corresponding doc updates, flags potential drift and suggests running `/validate-docs`.

### 2. Post-Feature Reminder (PostToolUse on Write/Edit)
Script: `.claude/hooks/scripts/post-feature-reminder.sh`

Suggests `/validate-docs` when the edited file is `docs/features/FEAT-*.md`, an index file (`FEATURES.md`, `FEATURE-MAP.md`, `CURRENT.md`), or a research doc.

### 3. PR/Merge Validation (PostToolUse on Bash)
Script: `.claude/hooks/scripts/pr-merge-validator.sh`

Suggests running docs-validator when the command starts with `gh pr create`, `gh pr merge`, `git merge`, or `git pull`.

**Limitation:** Only catches commands run inside a Claude Code session. For external merges, see the GitHub Actions workflow below.

---

## External Merge Validation

For merges that happen outside Claude Code (terminal, GitHub UI, other developers), a GitHub Actions workflow runs the same checklist on every PR to main. See:
- **Workflow:** `.github/workflows/docs-validation.yml`
- **Strategy doc:** `docs/architecture/ci-validation.md`

---

## TodoWrite Integration

When creating todo lists for feature work, always include validation as the final step:

```
1. Research existing patterns
2. Create FEAT-xxx.md
3. Implement feature
4. Update indexes
5. Validate documentation  ← always include
```

---

## AskUserQuestion Guidance

Use `AskUserQuestion` proactively for clarification before starting work:

**For new features:** scope boundaries, technical approach trade-offs, integration points, user experience decisions

**For research:** depth vs breadth, which aspects to prioritize, output format

**Rule:** One round of clarifying questions per task — batch them, don't ask one at a time.

See AGENTS.md "Clarifying Questions" section for specific prompts.
