# AI Agent Instructions

> **Universal documentation guide for all AI coding assistants**

This file contains the **complete documentation system** for all AI tools. After reading this, check for tool-specific optimizations:
- **Claude Code:** See [CLAUDE.md](CLAUDE.md) for hooks, sub-agents, and automation
- **Cursor:** See [.cursorrules](.cursorrules) (if exists)
- **Copilot:** See [.github/copilot-instructions.md](.github/copilot-instructions.md) (if exists)

---

## Core Principles for AI Agents

**Before starting any work, internalize these principles:**

### 1. Ground Truth Over Assumptions

**For non-trivial tasks, reach ground truth understanding before coding.**

**Process:**
```
Simple tasks → Execute immediately
Complex tasks → Research → Ask questions → Confirm → Document → Execute
```

**Complex tasks include:**
- Refactors affecting multiple files
- New features with ambiguous requirements
- Architectural decisions
- Integration with existing systems

**Use AskUserQuestion to clarify:**
- Multiple valid approaches exist
- Architectural impact unclear
- Requirements can be interpreted 2+ ways

**Document decisions in feature docs** ("Implementation Notes" section)

### 2. Measure, Don't Guess

**Never guess numerical values - benchmark instead.**

**Examples:**
- ❌ "This should take ~100ms" → ✅ "Let me benchmark to get actual numbers"
- ❌ "Will handle ~1000 req/s" → ✅ "I'll measure under realistic load"

**Document measurements:**
```markdown
### Performance Benchmarks
- Response time: 45ms (target: < 100ms) ✓
- Load test: 2,400 req/s sustained
- Test setup: [environment, tools]
```

---

## Documentation System Overview

**Core principle:** Self-contained, navigable docs with minimal context loading.

### Entry Points

**Start here for any task:**
1. Read `/docs/CURRENT.md` - Active work (< 1KB)
2. Check `/docs/research/` - Domain knowledge & principles
3. Read relevant `/docs/features/FEAT-xxx.md` - Feature details
4. Update docs as you implement

### Key Files

| File | Purpose | When to Read |
|------|---------|--------------|
| `/docs/CURRENT.md` | Active work, blockers, context | Always read first |
| `/docs/FEATURES.md` | Feature index | Finding features |
| `/docs/FEATURE-MAP.md` | Feature relationships | Understanding dependencies |
| `/docs/research/README.md` | Domain knowledge index | Before implementing |
| `/docs/features/FEAT-xxx.md` | Individual feature docs | Working on feature |
| `/docs/architecture/overview.md` | System design | Understanding architecture |
| `/docs/instructions.md` | Complete AI guide | Full reference |

---

## Quick Start Workflows

### Fix a Bug
```
1. Find feature: grep -r "feature name" docs/features/
2. Read FEAT-xxx.md (focus on "Known Issues")
3. Implement fix
4. Update "Known Issues & Resolutions" section
5. Update research docs if bug revealed insights
```

### Add a New Feature
```
1. Check similar features: Browse /docs/FEATURES.md
2. Check domain knowledge: /docs/research/README.md "Quick Find"
3. Review dependencies: /docs/FEATURE-MAP.md
4. Create feature doc: Copy /docs/features/_TEMPLATE.md
5. Implement following template structure
6. Update indexes: FEATURES.md, FEATURE-MAP.md (if dependencies)
7. Link research docs in "Research References"
8. Validate documentation
```

### Understand System Architecture
```
1. Read /docs/architecture/overview.md
2. Check /docs/FEATURE-MAP.md for relationships
3. Grep for topics: grep -r "[topic]" docs/research/
4. Read relevant research docs
```

---

## Documentation Rules

### Required Actions

**When creating features:**
- ✓ Create `/docs/features/FEAT-xxx.md` from template
- ✓ Add to `/docs/FEATURES.md` index
- ✓ Add to `/docs/FEATURE-MAP.md` if has dependencies
- ✓ Link to relevant research docs
- ✓ Update `/docs/CURRENT.md` if active work

**When fixing bugs:**
- ✓ Document in FEAT-xxx.md "Known Issues" section
- ✓ Describe fix and prevention strategy
- ✓ Update research docs if bug revealed insights

**When implementing:**
- ✓ Update "Implementation Notes" as you work
- ✓ Document decisions made and rationale
- ✓ Note challenges and solutions
- ✓ Link research docs that informed decisions

**After major work:**
- ✓ Validate documentation consistency
- ✓ Check all indexes updated
- ✓ Verify links valid
- ✓ Ensure dependencies bidirectional

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
4. **Research References** - Links to research docs (if applicable)
5. **Feature Dependencies** - What it depends on, what depends on it
6. **Files Changed** - List of modified files
7. **Known Issues & Resolutions** - Bugs, fixes, workarounds
8. **TODO** - Remaining work or "Feature complete"
9. **Implementation Notes** - Decisions, challenges, lessons learned

**Optional sections** (add as needed):
- Requirements, Data Flow, API/Interface, Testing Strategy, Future Improvements

**See:** `/docs/features/_TEMPLATE.md` for complete template

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

### Linking Research

Link from feature docs to research:
```markdown
Uses [algorithm] for [purpose].
**See:** [Research Doc](../research/doc-name.md) - Principle 1 (§X.X), Principle 2 (§Y.Y)
```

---

## Documentation Validation

### Why Validate

Catches missing indexes, broken links, and invalid dependencies.

### How to Validate

**For Claude Code:** Say "validate docs" or wait for automatic prompt

**For other AI agents:** See checklist in `/docs/guides/docs-validation.md`

---

## Context-Efficient Navigation

**Token usage targets:**

| Task | Target | Typical Files |
|------|--------|---------------|
| Fix bug | < 1000 | CURRENT.md + FEAT-xxx.md |
| Add feature | < 2000 | CURRENT.md + FEATURES.md + research + FEAT-xxx.md |
| Understand arch | < 2500 | architecture/overview.md + FEATURE-MAP.md + FEATs |

**Navigation:**
- Feature: `grep -r "keyword" docs/features/` or browse FEATURES.md or FEATURE-MAP.md
- Research: Check research/README.md "Quick Find" or `grep -r "keyword" docs/research/`

---

## Best Practices

### Token Efficiency
- ✓ Only read files needed for current task
- ✓ Use grep for searching (0 tokens)
- ✓ Use indexes to find what you need
- ✓ Feature docs are self-contained

### Clarification Before Implementation
- ✓ Ask when requirements ambiguous
- ✓ Present options with trade-offs
- ✓ Identify decision points first
- ✓ Document choices in "Implementation Notes"
- ✓ Ask BEFORE implementing (not after)

**See:** [docs/guides/clarification-strategy.md](docs/guides/clarification-strategy.md)

### Documentation Maintenance
- ✓ Update docs as you code (not after)
- ✓ Keep feature docs self-contained
- ✓ Link to research (don't duplicate)
- ✓ Document bugs in "Known Issues" immediately
- ✓ Validate after major work

### Code Implementation
- ✓ Read feature docs before modifying code
- ✓ Follow patterns in "Implementation Notes"
- ✓ Apply principles from research docs
- ✓ Update "Files Changed" section
- ✓ Document decisions made
- ✓ Check "Known Issues" section for warnings

---

## For Complete Details

**Full guide:** [docs/instructions.md](docs/instructions.md)

**Tool-specific features:**
- Claude Code: [CLAUDE.md](CLAUDE.md) - Hooks, sub-agents, validation
- Cursor: [.cursorrules](.cursorrules)
- Copilot: [.github/copilot-instructions.md](.github/copilot-instructions.md)

**Advanced techniques:**
- [Prompt Chaining](docs/guides/prompt-chaining.md) - Break tasks into focused steps
- [Clarification Strategy](docs/guides/clarification-strategy.md) - Ask before implementing
- [Multi-Agent Support](docs/guides/multi-agent-support.md) - Add other AI tools

---

## Quick Reference

| I need to... | Action |
|-------------|--------|
| Fix a bug | `grep -r "feature" docs/features/` → Read FEAT-xxx.md → Update "Known Issues" |
| Add a feature | Copy `_TEMPLATE.md` → Implement → Update indexes → Link research → Validate |
| Understand system | Read `architecture/overview.md` → Check `FEATURE-MAP.md` → Read FEATs |
| Find research | Check `research/README.md` Quick Find → `grep -r "topic" docs/research/` |
| See current work | Read `CURRENT.md` |
| Check dependencies | Read `FEATURE-MAP.md` → Check feature "Dependencies" sections |

---

**Remember:** This system prioritizes **context efficiency** and **self-contained docs** for AI agents at scale.
