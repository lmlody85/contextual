# Claude Code Configuration

This directory contains configuration for Claude Code, including custom agents and hooks.

## Agents

### docs-validator

**Purpose:** Validates documentation consistency and reports issues

**Location:** `.claude/agents/docs-validator.md`

**Triggers:**
- Say "validate docs"
- Say "check documentation"
- Say "lint docs"
- Automatically prompted after major feature work (via hook)

**What it checks:**
- All FEAT files are indexed in FEATURES.md
- Feature dependencies are bidirectional
- Research docs are properly indexed
- All internal links are valid
- Feature map includes documented relationships

**How to use:**
After creating or updating documentation, simply say:
```
validate docs
```

The agent will scan your documentation and report any inconsistencies with specific fix instructions.

**Automatic reminders:** A PostToolUse hook detects major feature work and prompts the AI agent to offer validation. You'll see a message like:

```
Would you like me to validate the documentation consistency?
Just say "validate docs" or "yes" to run validation.
```

**See also:** [docs/guides/docs-validation.md](../docs/guides/docs-validation.md) for manual validation procedures.

---

## Hooks

### post-feature-validation-reminder

**Purpose:** Automatically prompts validation after major feature work

**Location:** `.claude/hooks/post-feature-reminder.md`

**Event:** PostToolUse (Write, Edit tools)

**Triggers when:**
- New FEAT-xxx.md file is created
- Feature TODO section marked "Feature complete"
- Multiple documentation files updated in one session

**What it does:**
Instead of auto-running validation, the hook makes the AI agent ask:
```
Would you like me to validate docs?
```

This gives you control while ensuring validation isn't forgotten.

**Why this approach:**
- ✅ Automatic detection (no need to remember)
- ✅ User stays in control (ask, don't auto-run)
- ✅ Only triggers for major work (not every edit)
- ✅ Non-intrusive (easy to decline)

## Adding More Agents

To add custom agents for this project:

1. Create a new `.md` file in `.claude/agents/`
2. Add frontmatter with agent configuration
3. Write the agent's system prompt
4. Document it in this README

See [Claude Code Agents Documentation](https://code.claude.com/docs/en/sub-agents) for details.
