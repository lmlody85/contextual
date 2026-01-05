# Instructions for AI Agents

**Quick start:** See [AGENTS.md](../AGENTS.md) in the repository root.

**Claude Code specific:** See [CLAUDE.md](../CLAUDE.md) for hooks, sub-agents, and automation.

**Multi-agent support:** See [guides/multi-agent-support.md](guides/multi-agent-support.md) for adding other AI tools.

---

## Documentation Structure

This project uses a structured documentation system optimized for AI agents.

### Core Files

**Always check these first:**
- `/docs/CURRENT.md` - Active work
- `/docs/FEATURES.md` - Feature list
- `/docs/architecture/overview.md` - System architecture
- `/docs/guides/setup.md` - Setup and common tasks

**Feature documentation:**
- `/docs/features/FEAT-xxx.md` - Individual feature details
- Each feature has ONE self-contained file

**Domain knowledge:**
- `/docs/research/` - Research findings, algorithms, design principles
- See `/docs/research/README.md` for index

---

## When Working on Features

**Before starting:**
1. Read `/docs/CURRENT.md` to understand context
2. Find relevant `FEAT-xxx.md` file
3. Check related research in `/docs/research/`
4. Read `/docs/architecture/overview.md` if needed

**While implementing:**
1. Follow patterns in `FEAT-xxx.md` implementation notes
2. Apply principles from research docs
3. Check "Files Changed" for related code
4. Reference "Known Issues" for gotchas

**After changes:**
1. Update `FEAT-xxx.md` with implementation details
2. Update `/docs/CURRENT.md` with progress
3. Add to "Known Issues" if you found bugs
4. Update research docs if you discovered new findings

---

## Feature Documentation Format

Each `FEAT-xxx.md` has required and optional sections.

**Required:**
- **What**: Feature description
- **Why**: Problem solved
- **How**: Technical approach and key components
- **Research References**: Links to research docs (if applicable)
- **Files Changed**: List of modified files
- **Known Issues & Resolutions**: Bugs, fixes, workarounds
- **TODO**: Remaining work or "Feature complete"
- **Implementation Notes**: Decisions, challenges, lessons learned

**Optional** (add as needed):
- Requirements, Data Flow, API/Interface, Testing Strategy, Future Improvements

**See:** `docs/features/_TEMPLATE.md` for complete template

---

## Research & Domain Knowledge

**Location:** `/docs/research/`

Contains algorithms, design principles, and domain expertise that inform features.

**When to check:**
1. Before implementing features in same domain
2. When making algorithmic or design decisions
3. When debugging domain-specific issues
4. When optimizing performance
5. Understanding "why we do it this way"

**In feature docs, always link:**
```markdown
## Technical Approach
Uses [algorithm name] for [purpose].
**See:** [Research Doc](../research/doc-name.md) for approach and rationale.
```

---

## Conventions

**Naming:**
- Feature IDs: `FEAT-###`, `API-###`, `INFRA-###`
- Files: `kebab-case.ts`
- Classes: `PascalCase`
- Functions: `camelCase`

**Git:**
- Branch: `feat/FEAT-xxx-description` or `bug/FEAT-xxx-fix`
- Commits: `FEAT-xxx: Description of change`

**Testing:**
- Unit tests: `file.test.ts`
- Run: `npm test`

---

## Common Tasks

**Adding a feature:**
1. Check `/docs/research/` for relevant knowledge
2. Create `/docs/features/FEAT-xxx.md`
3. Add to `/docs/FEATURES.md`
4. Update `/docs/CURRENT.md`
5. Implement following structure in `FEAT-xxx.md`
6. Link to research docs
7. Write tests
8. Update docs with implementation notes

**Fixing a bug:**
1. Find relevant `FEAT-xxx.md`
2. Add to "Known Issues & Resolutions"
3. Implement fix
4. Document resolution and prevention
5. Update research docs if bug reveals insights

**Validating documentation:**
- **Claude Code:** Say "validate docs" or wait for automatic prompt
- **Other agents:** Use checklist in `/docs/guides/docs-validation.md`

---

## Quick Reference: Context-Efficient Navigation

### Fix a bug
```bash
grep -r "feature name" docs/features/
# Read FEAT-xxx.md (< 600 tokens)
# Update "Known Issues"
```

### Understand system
```
Read: architecture/overview.md → FEATURE-MAP.md → relevant FEATs
```

### Add feature
```
Browse FEATURES.md → Check research/README.md → Create from _TEMPLATE.md
```

### Find research
```
Check research/README.md "Quick Find" → grep if needed
```

### See current work
```
Read CURRENT.md (< 1KB)
```

---

**For complete details:** See [AGENTS.md](../AGENTS.md) and tool-specific files.
