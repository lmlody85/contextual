# Claude Code Instructions

> **Supplement to [AGENTS.md](AGENTS.md)** - Claude Code-specific features only

This file adds Claude Code automation to the core system in AGENTS.md:
- Automated validation (hooks + sub-agents)
- TodoWrite integration
- Smart prompts after feature work

**Note:** AGENTS.md contains all core instructions. This file is additive.

---

## Claude Code Features

### Automated Validation

**How it works:**
- PostToolUse hook detects feature creation/completion
- AI agent prompts: "Would you like me to validate docs?"
- You say "validate docs" or "yes"
- Validator sub-agent checks consistency and reports issues

**Manual trigger:** Say `validate docs`, `check documentation`, or `lint docs`

**See:** [.claude/README.md](.claude/README.md) for configuration

### TodoWrite Integration

Always include "Validate documentation" as final todo step:

```markdown
Example:
- [ ] Create FEAT-xxx.md
- [ ] Implement feature
- [ ] Write tests
- [ ] Update indexes
- [ ] Validate documentation ← Always include!
```

### Smart Hooks

**post-feature-reminder** (`.claude/hooks/post-feature-reminder.md`):
- Detects new FEAT files, completed features, or major doc updates
- Prompts AI agent to offer validation
- Non-intrusive (ask, don't auto-run)

---

## Quick Reference

| Task | Action |
|------|--------|
| Start feature work | Create TodoWrite list with "Validate docs" as final step |
| Fix bug | Find FEAT → Fix → Update "Known Issues" → Auto-validation prompt |
| Add feature | Follow AGENTS.md workflow → Auto-validation prompt |
| Validate docs | Say "validate docs" (or wait for automatic prompt) |
| Find research | Check research/README.md Quick Find or grep |
| See current work | Read CURRENT.md (~200 tokens) |

---

## Advanced Techniques

**For complex tasks, use these strategies:**

- **Prompt Chaining:** Break tasks into focused steps - [docs/guides/prompt-chaining.md](docs/guides/prompt-chaining.md)
- **Clarification Strategy:** Ask questions before implementing - [docs/guides/clarification-strategy.md](docs/guides/clarification-strategy.md)
- **Automation Details:** How validation works - [docs/guides/automation-overview.md](docs/guides/automation-overview.md)

---

## Complete Documentation

| Resource | Purpose |
|----------|---------|
| [AGENTS.md](AGENTS.md) | Complete documentation system (start here) |
| [.claude/README.md](.claude/README.md) | Claude Code configuration |
| [docs/guides/](docs/guides/) | Specialized techniques & strategies |

---

**Remember:** Claude Code's hooks and sub-agents automate validation and reduce cognitive load. Trust the automation, but stay in control - you approve all actions.
