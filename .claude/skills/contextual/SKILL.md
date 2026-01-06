---
name: contextual
description: AI-native documentation framework. Use when scaffolding docs for a new project, validating existing documentation structure, or when asked about Contextual framework setup and best practices.
---

# Contextual

AI-native documentation framework with structured context management.

## When to Use

- **"Set up Contextual"** or **"scaffold docs"** — Create documentation structure
- **"Validate docs"** or **"check documentation"** — Find and fix issues
- **Questions about Contextual** — Setup, structure, best practices

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

When user asks to set up Contextual, scaffold docs, or create documentation structure:

1. Read [SETUP.md](SETUP.md) for the scaffolding procedure
2. Create the directory structure
3. Create initial files (AGENTS.md, CURRENT.md, FEATURES.md, etc.)
4. Guide user through customization

### Validate Documentation

When user asks to validate docs, check documentation, or find doc issues:

1. Read [VALIDATE.md](VALIDATE.md) for the validation checklist
2. Run each check
3. Report issues found
4. Suggest fixes

## More Info

Full documentation: Read `AGENTS.md` in the project root.
