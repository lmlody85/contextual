# Claude Code Configuration

## Loading

Claude Code reads `CLAUDE.md` and, through the `@AGENTS.md` import at the top of it, `AGENTS.md`. Without that import Claude Code ignores `AGENTS.md` whenever a `CLAUDE.md` exists. Run `/context` in a session and check **Memory files** to confirm both loaded.

## Validation script

`scripts/validate-docs.sh` runs the mechanical checks (indexes, bidirectional dependencies, Files Changed paths, research index, markdown links) and prints `OK` / `WARN` / `ISSUE` lines; exit code 1 means something must be fixed. It needs only bash, grep, sed, and awk. Any AI tool or a CI job can run it.

## Agents

### docs-validator
**Trigger:** "validate docs" or "check documentation"
**Location:** `.claude/agents/docs-validator.md`
**Does:** runs `scripts/validate-docs.sh`, then the checks that need judgment (categories, FEATURE-MAP accuracy, required sections), and reports fixes. Read-only.

## Skills

### contextual
**Location:** `.claude/skills/contextual/`
**Triggers:** "set up Contextual", "scaffold docs", "validate docs"
**Purpose:** scaffold the framework in a new project; validate existing docs. Runs in the main conversation so it can use what you've told Claude about the project.

## Post-feature validation

`.claude/hooks/post-feature-reminder.md` describes when Claude should run validation after feature work. It is a prompt-level convention, not a Claude Code hook. To make it automatic, add a `PostToolUse` hook in `.claude/settings.json` (matcher `Write|Edit`) whose command checks whether the edited path is under `docs/` and, if so, prints a `hookSpecificOutput.additionalContext` JSON telling Claude to run `scripts/validate-docs.sh`. See https://code.claude.com/docs/en/hooks for the hook input and output shapes.

## Handy session commands

| Command | Use |
|---------|-----|
| `claude --continue` | Resume the last session with full context |
| `claude --resume <id>` | Resume a specific session |
| `/plan` (or Shift+Tab) | Plan mode for larger features |
| `Ctrl+B` | Background a running command or agent |

Skills and agents hot-reload; no restart needed after editing them.
