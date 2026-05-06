# Claude Code Configuration

## Hooks

Hooks are configured in `.claude/settings.json` under the `hooks` key. PostToolUse hooks are **command-type** — they call shell scripts in `hooks/scripts/` that pre-filter and exit silently when conditions don't match. See `hooks/README.md` for design rationale.

| Hook | Event | Trigger | Action |
|------|-------|---------|--------|
| Session drift check | SessionStart | Once per session | Checks git log for untracked doc drift |
| Post-feature reminder | PostToolUse (Write/Edit) | File path matches FEAT-*.md or index docs | Suggests `/validate-docs` |
| PR/merge validation | PostToolUse (Bash) | Command starts with `gh pr (create\|merge)` or `git (merge\|pull)` | Suggests running docs-validator |

## Slash Commands

| Command | Purpose |
|---------|---------|
| `/new-feat <id> <name>` | Scaffold a new FEAT-xxx.md document |
| `/validate-docs` | Run the docs-validator agent |
| `/scaffold-contextual` | Initialize the framework in a new project |

## Agents

### docs-validator
**Trigger:** "validate docs", `/validate-docs`, "check documentation", "lint docs", "are my docs in sync"
**Location:** `.claude/agents/docs-validator.md`
**Purpose:** Checks feature indexes, bidirectional dependencies, link validity, research doc completeness

## Skills

### contextual
**Location:** `.claude/skills/contextual/`
**Triggers:** "set up Contextual", "scaffold docs", "validate docs" — also auto-suggested when working in `docs/`
**Purpose:** Initialize framework in new projects, validate existing docs

## External Validation

For merges that happen outside Claude Code sessions, a GitHub Actions workflow runs the same validation checklist on every PR. See `.github/workflows/docs-validation.yml` and `docs/architecture/ci-validation.md`.
