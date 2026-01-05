# Claude Code Instructions

> **⚠️ READ THIS FIRST:** Before reading this file, read [AGENTS.md](AGENTS.md) for the complete documentation system. This file contains **Claude Code-specific features only** (hooks, sub-agents, automation).

---

## Reading Order

1. **First:** Read [AGENTS.md](AGENTS.md) - Core documentation system (required)
2. **Then:** Read this file - Claude Code optimizations (recommended)

**AGENTS.md provides:**
- Documentation structure & navigation
- Core principles (Ground Truth, Measure Don't Guess)
- Feature format & research system
- Complete workflows & best practices

**This file adds:**
- Automated validation (hooks + sub-agents)
- TodoWrite integration
- Claude Code-optimized shortcuts

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

**post-feature-validation-reminder** (`.claude/hooks/post-feature-reminder.md`):
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
| [AGENTS.md](AGENTS.md) | Universal documentation system (start here) |
| [docs/instructions.md](docs/instructions.md) | Complete AI agent guide |
| [.claude/README.md](.claude/README.md) | Claude Code configuration |
| [docs/guides/](docs/guides/) | Specialized techniques & strategies |

---

**Remember:** Claude Code's hooks and sub-agents automate validation and reduce cognitive load. Trust the automation, but stay in control - you approve all actions.
