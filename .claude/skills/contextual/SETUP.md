# Contextual Setup

Scaffold the documentation structure in a new project.

## Directory Structure

Create these directories:

```bash
mkdir -p docs/features docs/research docs/architecture
```

## Required Files

### 1. AGENTS.md (root)

Main AI instructions file. Customize the sections for your project:

```markdown
# Project Name

## Quick Start

1. Read `docs/CURRENT.md` for active work
2. Check `docs/features/FEAT-xxx.md` for feature context
3. Update docs as you implement

## Documentation Map

- `docs/CURRENT.md` — Active work
- `docs/FEATURES.md` — Feature index
- `docs/FEATURE-MAP.md` — Dependencies
- `docs/features/` — Feature documentation
- `docs/research/` — Domain knowledge
- `docs/architecture/` — System design

## Conventions

[Add project-specific conventions here]
```

### 2. CLAUDE.md (root, optional)

Only needed if using Claude Code automation:

```markdown
# Claude Code Instructions

> Supplement to [AGENTS.md](AGENTS.md)

[Claude-specific automation instructions]
```

### 3. docs/CURRENT.md

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

### 4. docs/FEATURES.md

```markdown
# Features

## Core
*No features yet*

## API
*No features yet*

## Infrastructure
*No features yet*

---

**Dependencies:** See [FEATURE-MAP.md](FEATURE-MAP.md)
```

### 5. docs/FEATURE-MAP.md

```markdown
# Feature Map

## Relationships
*No features with dependencies yet*

## Critical Dependencies
*Features that many others depend on*

## Isolated Features
*Standalone features with no dependencies*
```

### 6. docs/features/_TEMPLATE.md

```markdown
# FEAT-###: Feature Name

## What
*Brief description*

## Why
*Problem solved or value provided*

## How
*Technical approach*

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
*Current issues, or "None"*

## TODO
*Remaining work, or "Feature complete"*

---

## Implementation Notes
*Decisions, challenges, lessons learned*
```

### 7. docs/research/README.md

```markdown
# Research & Domain Knowledge

## Quick Find
**[Topic]:** *No research yet*

## All Research (Alphabetical)
*No research documents yet*
```

### 8. docs/architecture/overview.md

```markdown
# Architecture Overview

## System Overview
*Describe what this system does*

## Components
*Key components and their purposes*

## Technology Stack
**Languages:** *TBD*
**Frameworks:** *TBD*

## Key Decisions
*Architectural decisions and rationale*
```

## Post-Setup

After scaffolding:

1. Customize AGENTS.md with project-specific conventions
2. Fill in architecture/overview.md with system description
3. Add relevant categories to research/README.md
4. Create first feature doc when work begins
