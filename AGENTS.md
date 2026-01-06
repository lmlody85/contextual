# AI Agent Instructions

> **You create and maintain documentation as you build**

When the user describes what they want, you:
1. **Ask clarifying questions** before implementing
2. **Create documentation** (architecture, features, research) as you work
3. **Keep everything in sync** (indexes, dependencies, links)
4. **Validate consistency** after major work

The user describes intent. You handle the documentation.

---

**Tool-specific supplements** (optional):
- **Claude Code:** [CLAUDE.md](CLAUDE.md) — hooks, sub-agents, automation
- **Cursor:** [.cursorrules](.cursorrules) — Cursor-specific rules
- **Copilot:** [.github/copilot-instructions.md](.github/copilot-instructions.md) — Copilot guidance

---

## Core Principles

| Principle | Action |
|-----------|--------|
| **Ask before assuming** | Clarify ambiguous requirements before implementing |
| **Document before coding** | Create FEAT-xxx.md first, then implement |
| **Update as you go** | Keep "Implementation Notes" current during work |

---

## Documentation System

**Core principle:** Self-contained docs with minimal context loading.

### Key Files

| File | Purpose | When to Read |
|------|---------|--------------|
| `/docs/CURRENT.md` | Active work, blockers | If continuing work |
| `/docs/FEATURES.md` | Feature index | Finding features |
| `/docs/FEATURE-MAP.md` | Feature relationships | Understanding dependencies |
| `/docs/research/README.md` | Domain knowledge index | Before implementing |
| `/docs/features/FEAT-xxx.md` | Individual feature docs | Working on feature |
| `/docs/architecture/overview.md` | System design | Understanding architecture |
| `/docs/architecture/contracts.md` | API patterns, data schemas | Building integrations |
| `/docs/architecture/testing.md` | Test strategy, commands | Writing/running tests |

---

## Documentation Rules

### Required Actions

**When starting a project or adding major components:**
- Create/update `/docs/architecture/overview.md`
- Document system design decisions
- List core components and responsibilities

**When creating features:**
- Create `/docs/features/FEAT-xxx.md` (see format below)
- Add to `/docs/FEATURES.md` index
- Add to `/docs/FEATURE-MAP.md` if has dependencies
- Link to relevant research docs
- Update `/docs/CURRENT.md` if active work

**When fixing bugs:**
- Document in FEAT-xxx.md "Known Issues" section
- Describe fix and prevention strategy
- Update research docs if bug revealed insights

**When implementing:**
- Update "Implementation Notes" as you work
- Document decisions made and rationale
- Note challenges and solutions
- Link research docs that informed decisions

**After major work:**
- Validate documentation consistency
- Check all indexes updated
- Verify links valid
- Ensure dependencies bidirectional

### Naming Conventions

**Feature IDs:**
- `FEAT-###` - User-facing features
- `API-###` - API endpoints or integrations
- `INFRA-###` - Infrastructure or tooling

**File naming:**
- Files: `kebab-case.ts`
- Classes: `PascalCase`
- Functions: `camelCase`

**Git conventions:**
- Branch: `feat/FEAT-xxx-description` or `bug/FEAT-xxx-fix`
- Commits: `FEAT-xxx: Description of change`

---

## Feature Documentation Format

Each feature has ONE self-contained document: `/docs/features/FEAT-xxx.md`

**Required sections:**
1. **What** - Feature description (2-3 sentences)
2. **Why** - Problem solved or value provided
3. **How** - Technical approach and key components
4. **Research References** - Links to research docs (or "None")
5. **Feature Dependencies** - What it depends on, what depends on it (or "None")
6. **Files Changed** - List of modified files
7. **Known Issues & Resolutions** - Bugs, fixes, workarounds
8. **TODO** - Remaining work or "Feature complete"
9. **Implementation Notes** - Decisions, challenges, lessons learned

**Optional sections** (add as needed):
- Requirements, Data Flow, API/Interface, Testing Strategy, Future Improvements

---

## Research & Domain Knowledge

**Location:** `/docs/research/` — Check `/docs/research/README.md` for index.

**Where to put knowledge:**
- **Feature-specific** → Implementation Notes in FEAT-xxx.md
- **Reusable across features** → Research docs

**Rule:** If you'd copy-paste the same info into multiple features, it belongs in research.

---

## Documentation Validation

- [ ] Feature listed in `/docs/FEATURES.md`
- [ ] Dependencies in `/docs/FEATURE-MAP.md` (bidirectional)
- [ ] All links valid
- [ ] All files in "Files Changed" exist

---

## Critical Anti-Patterns

| Don't | Why | Do Instead |
|-------|-----|------------|
| Document after implementing | Decisions get lost, rationale forgotten | Create FEAT-xxx.md first |
| Skip dependency updates | Breaks impact analysis | Update FEATURE-MAP.md immediately |
| Let FEAT-xxx.md exceed ~300 lines | Loses "self-contained" benefit, too much context | Suggest splitting to user |
| Forget CURRENT.md | Next session loses context | Update before ending work |

### When to Suggest Splitting a Feature

If a FEAT-xxx.md is growing large (300+ lines) or covers multiple distinct concerns, suggest to the user:
- Split into FEAT-xxx-a.md and FEAT-xxx-b.md
- Update dependencies between the new features
- Update indexes

---

## Quick Reference

| I need to... | Action |
|-------------|--------|
| Start new project | Ask questions → Create `architecture/overview.md` → Create first `FEAT-xxx.md` → Implement |
| Add a feature | Clarify if vague → Create `FEAT-xxx.md` → Implement → Update indexes → Validate |
| Fix a bug | Find FEAT-xxx.md → Fix → Update "Known Issues" section |
| Understand system | Read `architecture/overview.md` → Check `FEATURE-MAP.md` |
| See current work | Read `CURRENT.md` |

---

**Remember:** You create and maintain documentation. The user describes what they want—you handle the paperwork.
