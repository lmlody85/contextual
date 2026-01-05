---
name: contextual
description: AI-native documentation framework. Use when scaffolding docs for a new project, validating existing documentation structure, or when asked about Contextual framework setup and best practices.
---

# Contextual

AI-native documentation framework with structured context management.

## When to Use

- **`/contextual init`** — Scaffold documentation structure in a new project
- **`/contextual validate`** — Check existing docs for issues
- **Answering questions** — About Contextual setup, structure, or best practices

## Quick Reference

**Core files:**
- `AGENTS.md` — Main AI instructions (always read first)
- `CLAUDE.md` — Claude Code automation supplement
- `docs/CURRENT.md` — Active work status
- `docs/FEATURES.md` — Feature index
- `docs/FEATURE-MAP.md` — Dependency graph
- `docs/features/FEAT-xxx.md` — Individual feature docs
- `docs/research/` — Domain knowledge

**Naming conventions:**
- Features: `FEAT-001`, `FEAT-002`
- API features: `API-001`, `API-002`
- Infrastructure: `INFRA-001`, `INFRA-002`

## Commands

### Initialize New Project

When user says `/contextual init` or asks to set up Contextual:

1. Read [SETUP.md](SETUP.md) for the scaffolding procedure
2. Create the directory structure
3. Copy template files
4. Guide user through customization

### Validate Documentation

When user says `/contextual validate` or asks to check docs:

1. Read [VALIDATE.md](VALIDATE.md) for the validation checklist
2. Run each check
3. Report issues found
4. Suggest fixes

## Architecture

```
project/
├── AGENTS.md              # AI reads this first
├── CLAUDE.md              # Claude Code automation
└── docs/
    ├── CURRENT.md         # What's being worked on
    ├── FEATURES.md        # Feature index
    ├── FEATURE-MAP.md     # Dependencies
    ├── features/
    │   ├── _TEMPLATE.md
    │   └── FEAT-xxx.md
    ├── research/
    │   └── README.md
    └── architecture/
        └── overview.md
```

## Design Principles

1. **Hub-and-spoke** — AGENTS.md links to everything, features are self-contained
2. **Progressive disclosure** — Load only what's needed for the task
3. **Indexes are data** — No instructions in index files, just links
4. **Self-documenting** — Feature docs include their own context
