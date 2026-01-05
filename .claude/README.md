# Claude Code Configuration

## Agents

### docs-validator
**Trigger:** "validate docs" or "check documentation"
**Location:** `.claude/agents/docs-validator.md`
**Purpose:** Checks indexes, dependencies, links for consistency

## Hooks

### post-feature-reminder
**Event:** PostToolUse (Write, Edit)
**Location:** `.claude/hooks/post-feature-reminder.md`
**Triggers on:** New FEAT files, "Feature complete" in TODO, major doc updates
**Action:** Prompts "Would you like me to validate docs?"

## Skills

### contextual
**Location:** `.claude/skills/contextual/`
**Triggers:** "set up Contextual", "scaffold docs", "validate documentation"
**Purpose:** Initialize framework in new projects, validate existing docs
