# AI Agent Instructions

> **You create and maintain documentation as you build**

When the user describes what they want, you:
1. **Ask clarifying questions** before implementing
2. **Create documentation** (architecture, features, research) as you work
3. **Keep everything in sync** (indexes, dependencies, links)
4. **Validate consistency** after major work

The user describes intent. You handle the documentation.

---

**Tool-specific supplements** (create as needed):
- **Claude Code:** [CLAUDE.md](CLAUDE.md) — hooks, sub-agents, automation
- **Cursor:** `.cursorrules` — Cursor-specific rules
- **Copilot:** `.github/copilot-instructions.md` — Copilot guidance

---

## Core Principles

| Principle | Action |
|-----------|--------|
| **Ask before assuming** | Clarify ambiguous requirements (use AskUserQuestion or equivalent) |
| **Document before coding** | Create FEAT-xxx.md first, then implement |
| **Update as you go** | Keep "Implementation Notes" current during work |
| **Chain complex tasks** | Clarify → Research → Document → Implement → Test → Validate → Commit |

---

## Clarifying Questions

Before starting work, ask questions when requirements are ambiguous. Use your tool's question mechanism (AskUserQuestion, chat, etc.).

### For New Features

| Uncertainty | Example Questions |
|-------------|-------------------|
| **Scope** | "Should this include X, or is that a separate feature?" |
| **Users** | "Who is the primary user? Are there secondary users?" |
| **Behavior** | "What should happen when [edge case]?" |
| **Technical approach** | "Should we use [A] or [B]? Trade-offs are..." |
| **Dependencies** | "This will require [X]. Should I include that, or assume it exists?" |
| **Priority** | "There are several approaches. Want me to document options first?" |

### For Research Tasks

| Uncertainty | Example Questions |
|-------------|-------------------|
| **Depth vs breadth** | "Deep dive on one aspect, or survey of the whole area?" |
| **Focus** | "Which aspect matters most: performance, security, UX?" |
| **Output** | "Summary doc, comparison table, or recommendation with rationale?" |
| **Sources** | "Should I stick to official docs, or include community resources?" |

### When NOT to Ask

- Requirements are clear and specific
- You've already asked about this topic
- The answer is obvious from context
- Asking would just delay obvious work

**Rule:** One round of clarifying questions per task. Batch your questions, don't ask one at a time.

---

## Common Workflows

### Starting a New Project
`Clarify → Document Architecture → Document First Feature → Implement`

1. **Ask clarifying questions** — Scope, tech stack, requirements
2. **Create architecture doc** — `docs/architecture/overview.md`
3. **Create first feature doc** — `docs/features/FEAT-001-xxx.md`
4. **Update indexes** — `FEATURES.md`, `FEATURE-MAP.md`
5. **Implement** — Follow your documentation

### Adding a Feature
`Clarify → Research → Document → Implement → Test → Update Indexes → Validate`

1. **Clarify requirements** — Ask if scope or approach is ambiguous
2. **Check research docs** — Look for relevant domain knowledge
3. **Create FEAT-xxx.md** — Document What/Why/How before coding
4. **Implement** — Update "Implementation Notes" as you work
5. **Test** — Verify feature works as documented
6. **Update indexes** — Add to `FEATURES.md`, `FEATURE-MAP.md`
7. **Validate** — Run documentation validation checklist

### Fixing a Bug
`Locate → Investigate → Fix → Document → Validate`

1. **Find the feature doc** — Which FEAT-xxx.md owns this code?
2. **Check Known Issues** — Has this been seen before?
3. **Investigate root cause** — Check research docs for domain context
4. **Fix the bug** — Implement the solution
5. **Update Known Issues** — Document what happened and the fix
6. **Update research docs** — If bug revealed reusable insights

### Continuing Previous Work
`Read Context → Resume → Update`

1. **Read CURRENT.md** — What was in progress? Any blockers?
2. **Read relevant FEAT-xxx.md** — Refresh on Implementation Notes
3. **Resume work** — Continue from where you left off
4. **Update CURRENT.md** — Before ending session, capture state

> **Tool-specific:** Some tools support native session resume (see supplements). CURRENT.md remains authoritative for cross-tool handoffs.

### Conducting Research
`Research → Document → Index`

1. **Do the research** — Gather information, analyze findings
2. **Create research doc** — `docs/research/[topic-name].md`
3. **Add to index** — Update `docs/research/README.md` (Quick Find + All Research)
4. **Link from features** — If relevant, add to FEAT-xxx.md Research References

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

## Naming Conventions

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

**Common categories:** User Research, Design, Domain, Technical, Market

### Finding Research

**Quick Find:** Check `/docs/research/README.md` "Quick Find by Topic" section

**Keyword Search:** `grep -r "keyword" docs/research/`

**From Features:** Follow "Research References" links in FEAT-xxx.md files

### Where to Put Knowledge

**In Feature Docs (Implementation Notes):**
- Decisions specific to THIS feature only
- Why Option A was chosen over B for this case
- Lessons learned during this implementation

**In Research Docs:**
- Knowledge that applies to MULTIPLE features
- General principles, patterns, or best practices
- Domain expertise worth preserving and reusing

**Rule:** If you'd copy-paste the same info into multiple features, it belongs in research.

---

## Documentation Validation

**How to run:** Claude Code users say `validate docs`. Other tools: use checklist below.

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

**Remember:** You create and maintain documentation. The user describes what they want—you handle the paperwork.
