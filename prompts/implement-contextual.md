# Implement Contextual Documentation Framework

You are implementing the Contextual documentation framework on this repository. This is an AI-native documentation system that helps AI agents work more effectively with the codebase.

---

## Step 0: Understanding Test (BEFORE)

**Run this test BEFORE creating any documentation.**

Answer these questions based on your current understanding of the codebase. Be honest about uncertainty. Save your answers for comparison later.

### Questions

1. **Architecture:** Describe the system's architecture in 2-3 sentences. What are the main components and how do they interact?

2. **Entry points:** What are the main entry points to this application? (e.g., API routes, CLI commands, main functions)

3. **Dependencies:** Pick any feature/module - what other parts of the codebase does it depend on? What depends on it?

4. **Tech stack:** List the languages, frameworks, and key libraries used. How confident are you in this list?

5. **Design decisions:** What architectural or design decisions can you identify? Why were they made?

6. **Bug fix scenario:** If asked to fix a bug in [pick a specific area], which files would you need to read? How confident are you?

7. **New feature scenario:** If asked to add a new feature that integrates with existing functionality, where would you start? What would you need to understand first?

### Scoring (self-assess 1-5)

| Question | Confidence | Completeness |
|----------|------------|--------------|
| Architecture | _/5 | _/5 |
| Entry points | _/5 | _/5 |
| Dependencies | _/5 | _/5 |
| Tech stack | _/5 | _/5 |
| Design decisions | _/5 | _/5 |
| Bug fix scenario | _/5 | _/5 |
| New feature scenario | _/5 | _/5 |
| **Total** | _/35 | _/35 |

---

## Step 1: Implementation

## Your Task

1. Analyze the existing codebase structure
2. Create the documentation framework
3. Document existing features (create FEAT-xxx.md for each major feature)
4. Populate architecture overview
5. Update all indexes

## Directory Structure to Create

```
├── AGENTS.md                      # Main AI instructions
├── CLAUDE.md                      # Claude Code supplement (if applicable)
└── docs/
    ├── CURRENT.md                 # Active work tracking
    ├── FEATURES.md                # Feature index
    ├── FEATURE-MAP.md             # Dependency graph
    ├── features/
    │   └── FEAT-001-xxx.md        # One per major feature
    ├── research/
    │   └── README.md              # Domain knowledge index
    └── architecture/
        ├── overview.md            # System design
        ├── contracts.md           # API patterns, data schemas (optional)
        └── testing.md             # Test strategy (optional)
```

## File Contents

### AGENTS.md

```markdown
# AI Agent Instructions

> **You create and maintain documentation as you build**

When the user describes what they want, you:
1. **Ask clarifying questions** before implementing
2. **Create documentation** (architecture, features, research) as you work
3. **Keep everything in sync** (indexes, dependencies, links)
4. **Validate consistency** after major work

---

## Core Principles

| Principle | Action |
|-----------|--------|
| **Ask before assuming** | Clarify ambiguous requirements |
| **Document before coding** | Create FEAT-xxx.md first, then implement |
| **Update as you go** | Keep "Implementation Notes" current during work |
| **Chain complex tasks** | Clarify → Research → Document → Implement → Test → Validate → Commit |

---

## Common Workflows

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
3. **Fix the bug** — Implement the solution
4. **Update Known Issues** — Document what happened and the fix

### Continuing Previous Work
`Read Context → Resume → Update`

1. **Read CURRENT.md** — What was in progress? Any blockers?
2. **Read relevant FEAT-xxx.md** — Refresh on Implementation Notes
3. **Resume work** — Continue from where you left off
4. **Update CURRENT.md** — Before ending session, capture state

---

## Key Files

| File | Purpose | When to Read |
|------|---------|--------------|
| `/docs/CURRENT.md` | Active work, blockers | If continuing work |
| `/docs/FEATURES.md` | Feature index | Finding features |
| `/docs/FEATURE-MAP.md` | Feature relationships | Understanding dependencies |
| `/docs/features/FEAT-xxx.md` | Individual feature docs | Working on feature |
| `/docs/architecture/overview.md` | System design | Understanding architecture |

---

## Naming Conventions

- `FEAT-###` - User-facing features
- `API-###` - API endpoints or integrations
- `INFRA-###` - Infrastructure or tooling

---

## Critical Anti-Patterns

| Don't | Do Instead |
|-------|------------|
| Document after implementing | Create FEAT-xxx.md first |
| Skip dependency updates | Update FEATURE-MAP.md immediately |
| Let FEAT-xxx.md exceed ~300 lines | Suggest splitting to user |
| Forget CURRENT.md | Update before ending work |
```

### docs/CURRENT.md

```markdown
# Current Work

## Active
*Nothing active*

## Blocked
*No blockers*

## Next
*No upcoming tasks*

## Notes
*Context, constraints, reminders*
```

### docs/FEATURES.md

```markdown
# Features

## Core
*List core features here with links to FEAT-xxx.md*

## API
*List API features here*

## Infrastructure
*List infrastructure features here*

---

**Dependencies:** See [FEATURE-MAP.md](FEATURE-MAP.md)
```

### docs/FEATURE-MAP.md

```markdown
# Feature Map

## Relationships

*Document feature dependencies here*

```
Format:
FEAT-001 (Name)
  ↓ provides X to
FEAT-002 (Name)
```

## Critical Dependencies

*Features that many others depend on*

## Isolated Features

*Standalone features with no dependencies*
```

### Feature Doc Format (FEAT-xxx.md)

```markdown
# FEAT-###: Feature Name

## What
*Brief description (2-3 sentences)*

## Why
*Problem solved or value provided*

## How
*Technical approach and key components*

---

## Research References
*Links to research docs, or "None"*

## Feature Dependencies

**Depends on:** *FEAT-xxx links, or "None"*

**Dependents:** *Features that use this, or "None"*

---

## Files Changed
- `path/to/file` - What changed

## Known Issues
*Current issues and resolutions, or "None"*

## TODO
*Remaining work, or "Feature complete"*

---

## Implementation Notes
*Decisions made, challenges, lessons learned*
```

### docs/research/README.md

```markdown
# Research & Domain Knowledge

Knowledge that applies to multiple features. Feature-specific decisions go in FEAT-xxx.md.

## Quick Find

*Add categories relevant to this project*

## All Research (Alphabetical)

*No research documents yet*
```

### docs/architecture/overview.md

```markdown
# Architecture Overview

## System Overview

*Describe what this system does - fill this in based on codebase analysis*

## Components

*List major components and their responsibilities*

## Technology Stack

**Languages:** *List languages used*
**Frameworks:** *List frameworks used*
**Infrastructure:** *List infrastructure (databases, cloud services, etc.)*

## Key Decisions

*Document major architectural decisions and rationale here*

---

## Related Docs

| Doc | Purpose |
|-----|---------|
| [contracts.md](contracts.md) | API patterns, data schemas |
| [testing.md](testing.md) | Test strategy, commands |
```

### docs/architecture/contracts.md (optional)

```markdown
# Contracts & Patterns

Shared interfaces and patterns used across features.

## API Patterns

### Request/Response Format
*Document standard API format*

### Error Handling
*Document error response structure*

## Data Contracts

### Entity: *Name*
*Schema or type definition*

**Used by:** FEAT-xxx, FEAT-yyy

## Agent Contracts (if applicable)

### Agent Configuration
*Standard config structure*

### Agent Communication
**Input:** *format*
**Output:** *format*
```

### docs/architecture/testing.md (optional)

```markdown
# Testing Strategy

## Quick Reference

| Test Type | Command | Location |
|-----------|---------|----------|
| Unit | *cmd* | *path* |
| Integration | *cmd* | *path* |
| E2E | *cmd* | *path* |

## Writing Tests

### Unit Tests
**When:** Pure functions, utilities
**Pattern:** *show convention*

### Integration Tests
**When:** Module boundaries, APIs
**Pattern:** *show convention*

## Coverage
**Target:** *X%*
**Check:** *command*
```

## Implementation Steps

1. **Create directory structure:**
   ```bash
   mkdir -p docs/features docs/research docs/architecture
   ```

2. **Create index files** (CURRENT.md, FEATURES.md, FEATURE-MAP.md, research/README.md)

3. **Analyze the codebase** to identify:
   - Major features/modules
   - Dependencies between them
   - Technology stack
   - Architecture patterns

4. **Create FEAT-xxx.md** for each major feature found:
   - Use descriptive names: `FEAT-001-authentication.md`, `FEAT-002-api-gateway.md`
   - Fill in What/Why/How based on code analysis
   - Document dependencies between features
   - List key files for each feature

5. **Populate docs/FEATURES.md** with links to all feature docs

6. **Populate docs/FEATURE-MAP.md** with dependency relationships

7. **Fill in docs/architecture/overview.md** with:
   - System description
   - Component list
   - Tech stack
   - Any obvious architectural decisions

8. **Optional: Fill in architecture details** (if patterns exist):
   - `contracts.md` — Document API patterns, data schemas, agent interfaces
   - `testing.md` — Document test commands, patterns, coverage targets

9. **Verify consistency:**
   - Every FEAT file is listed in FEATURES.md
   - Dependencies are bidirectional
   - All file paths in "Files Changed" exist

## Guidelines

- Be thorough but concise in feature descriptions
- Focus on "What" and "Why" more than implementation details
- Capture dependencies accurately - this is critical for the framework
- Don't create research docs yet - only create them when knowledge applies to multiple features
- If existing documentation exists, incorporate relevant content into the new structure

---

## Step 2: Understanding Test (AFTER)

**Run this test AFTER completing the documentation.**

Answer the same questions again. Compare with your "before" answers.

### Questions

1. **Architecture:** Describe the system's architecture in 2-3 sentences. What are the main components and how do they interact?

2. **Entry points:** What are the main entry points to this application?

3. **Dependencies:** Pick the same feature/module as before - what other parts of the codebase does it depend on? What depends on it?

4. **Tech stack:** List the languages, frameworks, and key libraries used. How confident are you in this list?

5. **Design decisions:** What architectural or design decisions can you identify? Why were they made?

6. **Bug fix scenario:** If asked to fix a bug in the same area as before, which files would you need to read? How confident are you?

7. **New feature scenario:** If asked to add a new feature that integrates with existing functionality, where would you start? What would you need to understand first?

### Scoring (self-assess 1-5)

| Question | Confidence | Completeness |
|----------|------------|--------------|
| Architecture | _/5 | _/5 |
| Entry points | _/5 | _/5 |
| Dependencies | _/5 | _/5 |
| Tech stack | _/5 | _/5 |
| Design decisions | _/5 | _/5 |
| Bug fix scenario | _/5 | _/5 |
| New feature scenario | _/5 | _/5 |
| **Total** | _/35 | _/35 |

---

## Step 3: Compare Results

### Score Comparison

| Metric | Before | After | Δ |
|--------|--------|-------|---|
| Confidence | _/35 | _/35 | +_ |
| Completeness | _/35 | _/35 | +_ |

### Qualitative Comparison

For each question, note:
- What did you learn that you didn't know before?
- What was unclear before but is now documented?
- What gaps remain?

### Expected Outcomes

After implementing Contextual, you should see improvement in:

| Area | Expected Change |
|------|-----------------|
| Dependencies | Should be explicit and bidirectional |
| Design decisions | Captured in feature docs and architecture |
| Bug fix confidence | "Known Issues" sections provide history |
| New feature planning | Clear entry points and dependency map |

### Red Flags

If scores didn't improve significantly, check:
- [ ] Are feature docs detailed enough?
- [ ] Are dependencies documented bidirectionally?
- [ ] Is architecture overview filled in?
- [ ] Are "Implementation Notes" capturing decisions?
