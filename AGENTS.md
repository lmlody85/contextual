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
| **Ask before assuming** | Use AskUserQuestion for ambiguous requirements, multiple approaches, or architectural decisions |
| **Document as you go** | Create FEAT-xxx.md before implementing; update "Implementation Notes" during work |
| **Chain complex tasks** | Clarify → Research → Document → Implement → Test → Validate → Commit |

---

## Starting a New Project

1. **Ask clarifying questions** — Scope, tech stack, requirements
2. **Create architecture doc** — `docs/architecture/overview.md`
3. **Create first feature doc** — `docs/features/FEAT-001-xxx.md`
4. **Update indexes** — `FEATURES.md`, `FEATURE-MAP.md`
5. **Implement** — Follow your documentation

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
- Create `/docs/features/FEAT-xxx.md` (use template as guide)
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

**Location:** `/docs/research/`

Contains algorithms, design principles, and domain expertise that inform features.

### When to Check Research

Before implementing domain features, making design decisions, debugging domain issues, or understanding "why we do it this way".

### Finding Research

**Quick Find:** Check `/docs/research/README.md` "Quick Find by Topic" section

**Keyword Search:** `grep -r "keyword" docs/research/`

**From Features:** Follow "Research References" links in FEAT-xxx.md files

### Where to Put Knowledge

**In Feature Docs (Implementation Notes):**
- Decisions specific to THIS feature only
- Why Option A was chosen over B for this case
- Lessons learned during this implementation
- Challenges and solutions specific to this feature

**In Research Docs:**
- Knowledge that applies to MULTIPLE features
- General principles, patterns, or best practices
- Domain expertise worth preserving and reusing
- Information you'd reference from other features

**Rule of thumb:** If you'd copy-paste the same info into another feature doc, it belongs in research.

---

## Documentation Validation

Catches missing indexes, broken links, and invalid dependencies.

**For Claude Code:** Say "validate docs" or wait for automatic prompt

**For other tools, check manually:**

- [ ] Feature is listed in `/docs/FEATURES.md`
- [ ] Feature is in `/docs/FEATURE-MAP.md` if it has dependencies
- [ ] All dependencies are bidirectional (A depends on B → B lists A as dependent)
- [ ] All research doc links are valid
- [ ] All files in "Files Changed" section exist

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
