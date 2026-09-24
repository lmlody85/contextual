# Claude Code Instructions

@AGENTS.md

> Claude Code reads only CLAUDE.md when one exists, so the import above is what loads AGENTS.md. Keep it. Everything below is Claude Code automation only.

## Automation

| Asset | Location | Trigger |
|-------|----------|---------|
| Validation script | `scripts/validate-docs.sh` | Run after feature work, or say "validate docs" |
| Docs Validator Agent | `.claude/agents/docs-validator.md` | "validate docs" — runs the script, then the judgment checks |
| Contextual Skill | `.claude/skills/contextual/` | "set up Contextual", "scaffold docs" |
| Post-feature validation | `.claude/hooks/post-feature-reminder.md` | After feature work, run `scripts/validate-docs.sh` yourself; don't ask whether to |

**Config:** [.claude/README.md](.claude/README.md)

---

## Session Handoff

Native session resume (`claude --continue`) restores your own context, but other tools can't read it. Update `docs/CURRENT.md` before ending a session.

---

## Task Lists

When you create a task list for feature work, the last task is validation:

```
1. Research existing patterns
2. Create FEAT-xxx.md
3. Implement feature
4. Update indexes
5. Run scripts/validate-docs.sh and fix what it reports
```

---

## Clarifying Questions

Use `AskUserQuestion` when different readings of the request would lead to materially different work: scope boundaries, a choice between technical approaches with real trade-offs, or an ambiguous integration point. Batch questions into one round. Otherwise make the call, proceed, and record the assumption in the feature doc's Implementation Notes.
