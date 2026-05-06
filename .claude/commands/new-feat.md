---
description: Scaffold a new FEAT-xxx.md document with the standard template
argument-hint: "<FEAT-id> <kebab-name>"
allowed-tools: Read Write Glob Bash
---

# Create New Feature Document

Scaffold a new feature document at `docs/features/$1-$2.md` using the standard Contextual template.

**Steps:**

1. Verify `$1` follows the naming convention (`FEAT-###`, `API-###`, or `INFRA-###`). If not, ask the user to clarify.

2. Check `docs/features/` for an existing file with the same ID. If one exists, stop and report it.

3. Read `docs/FEATURES.md` to determine the right category (Core / API / Infrastructure) for the new feature.

4. Create `docs/features/$1-$2.md` with the standard template:

```markdown
# $1: <Feature Name>

## What
<2-3 sentence description>

## Why
<Problem solved or value provided>

## How
<Technical approach and key components>

---

## Research References
None

## Feature Dependencies

**Depends on:** None

**Dependents:** None

---

## Files Changed
- <path/to/file> — <what changed>

## Known Issues
None

## TODO
- [ ] <First task>

---

## Implementation Notes
<Decisions, challenges, lessons learned>
```

5. After creating the file, ask the user to fill in the `What`, `Why`, and `How` sections — these are the highest-value parts to write before implementation begins.

6. Remind the user to update `docs/FEATURES.md` (under the appropriate category) and `docs/FEATURE-MAP.md` (if dependencies exist) once the feature has dependencies or starts being implemented.

**Reference:** [AGENTS.md](../../AGENTS.md) "Feature Documentation Format" section.
