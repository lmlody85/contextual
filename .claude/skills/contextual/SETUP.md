# Contextual Setup

Scaffold the documentation structure in a new project.

## Quick Setup

```bash
mkdir -p docs/features docs/research docs/architecture
```

## Required Files

For full file templates, see [prompts/implement-contextual.md](../../../prompts/implement-contextual.md).

Create these files:

| File | Purpose |
|------|---------|
| `AGENTS.md` | Main AI instructions |
| `docs/CURRENT.md` | Active work tracking |
| `docs/FEATURES.md` | Feature index |
| `docs/FEATURE-MAP.md` | Dependency graph |
| `docs/research/README.md` | Domain knowledge index |
| `docs/architecture/overview.md` | System design |

## Minimal Starter Templates

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
*No features yet*

## API
*No features yet*

## Infrastructure
*No features yet*

---

**Dependencies:** See [FEATURE-MAP.md](FEATURE-MAP.md)
```

### docs/FEATURE-MAP.md

```markdown
# Feature Map

## Relationships
*No features with dependencies yet*

## Critical Dependencies
*Features that many others depend on*

## Isolated Features
*Standalone features with no dependencies*
```

### docs/research/README.md

```markdown
# Research & Domain Knowledge

## Quick Find
*Add categories relevant to this project*

## All Research (Alphabetical)
*No research documents yet*
```

### docs/architecture/overview.md

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

1. Copy AGENTS.md template from [implement-contextual.md](../../../prompts/implement-contextual.md)
2. Fill in architecture/overview.md with system description
3. Add relevant categories to research/README.md
4. Create first feature doc when work begins
