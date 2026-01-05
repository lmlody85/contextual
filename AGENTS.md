# AI Agent Instructions

> **The single entry point for all AI coding assistants**

This file is the **primary and complete** documentation system. Read this first, then optionally check tool-specific supplements:
- **Claude Code:** [CLAUDE.md](CLAUDE.md) adds hooks, sub-agents, and automation
- **Cursor:** [.cursorrules](.cursorrules) adds Cursor-specific rules (if exists)
- **Copilot:** [.github/copilot-instructions.md](.github/copilot-instructions.md) adds Copilot guidance (if exists)

**Important:** Tool-specific files are additive supplements, not prerequisites. This file alone is sufficient.

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

### 2. Chain Complex Tasks

**Break complex work into focused steps:**
```
Clarify → Research → Document → Implement → Test → Validate → Commit
```

**Example - Adding a feature:**
1. **Clarify vague requests first** - Use AskUserQuestion if requirements unclear
2. Research existing patterns and dependencies
3. Create FEAT-xxx.md with approach
4. Implement following the doc
5. Write tests
6. Validate documentation (sub-agent: "validate docs")
7. Commit changes

**Use AskUserQuestion when:**
- Request is vague or ambiguous
- Multiple valid approaches exist
- Architectural decisions needed
- About to make an assumption that could be wrong

### 3. Measure, Don't Guess

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
4. **Research References** - Links to research docs (or "None")
5. **Feature Dependencies** - What it depends on, what depends on it (or "None")
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

### Why Validate

Catches missing indexes, broken links, and invalid dependencies.

### How to Validate

**For Claude Code:** Say "validate docs" or wait for automatic prompt

**For other AI agents:** See checklist in `/docs/guides/docs-validation.md`

---

## Tool-Specific Features

- **Claude Code:** [CLAUDE.md](CLAUDE.md) - Hooks, sub-agents, validation
- **Cursor:** [.cursorrules](.cursorrules) (create from multi-agent guide)
- **Copilot:** [.github/copilot-instructions.md](.github/copilot-instructions.md) (create from multi-agent guide)

**Advanced techniques:**
- [Prompt Chaining](docs/guides/prompt-chaining.md) - Break tasks into focused steps
- [Clarification Strategy](docs/guides/clarification-strategy.md) - Ask before implementing
- [Multi-Agent Support](docs/guides/multi-agent-support.md) - Add other AI tools

---

## Quick Reference

| I need to... | Action |
|-------------|--------|
| Fix a bug | `grep -r "feature" docs/features/` → Read FEAT-xxx.md → Update "Known Issues" |
| Add a feature | Clarify if vague → Copy `_TEMPLATE.md` → Implement → Update indexes → Link research → Validate (sub-agent) → Commit |
| Understand system | Read `architecture/overview.md` → Check `FEATURE-MAP.md` → Read FEATs |
| Find research | Check `research/README.md` Quick Find → `grep -r "topic" docs/research/` |
| See current work | Read `CURRENT.md` |
| Check dependencies | Read `FEATURE-MAP.md` → Check feature "Dependencies" sections |

---

**Remember:** This system prioritizes **context efficiency** and **self-contained docs** for AI agents at scale.
