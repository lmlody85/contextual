# Documentation Validation

Check documentation for completeness and consistency.

## Validation Checklist

### Structure Checks

- [ ] `AGENTS.md` exists at project root
- [ ] `docs/` directory exists
- [ ] `docs/CURRENT.md` exists
- [ ] `docs/FEATURES.md` exists
- [ ] `docs/FEATURE-MAP.md` exists
- [ ] `docs/features/` directory exists
- [ ] `docs/research/README.md` exists
- [ ] `docs/architecture/overview.md` exists

### Feature Documentation

For each `FEAT-xxx.md` file:

- [ ] Feature is listed in `docs/FEATURES.md`
- [ ] Feature appears in `docs/FEATURE-MAP.md` (if it has dependencies)
- [ ] All "Depends on" features exist
- [ ] All "Dependents" features list this as a dependency (bidirectional)
- [ ] All "Research References" links are valid
- [ ] All "Files Changed" paths exist in codebase

### Dependency Integrity

- [ ] No circular dependencies in FEATURE-MAP.md
- [ ] All dependencies are bidirectional:
  - If A depends on B, then B lists A as dependent
- [ ] Critical dependencies section is accurate

### Research Documentation

- [ ] All research files are indexed in `research/README.md`
- [ ] Quick Find categories link to actual documents
- [ ] No orphaned research files

## Validation Procedure

```bash
scripts/validate-docs.sh
```

The script covers every mechanical item above (structure, index membership, bidirectional dependencies, Files Changed paths, research index, link validity) and exits 1 when something must be fixed. What it cannot judge, check by reading:

- Features sit under the right heading in FEATURES.md (Core / API / Infrastructure)
- FEATURE-MAP.md relationships match the feature docs
- Research docs appear in both Quick Find and All Research
- No circular dependencies

If the script is missing, copy it from the Contextual repo (`scripts/validate-docs.sh`) or work through the checklist manually.

## Common Issues

### Missing from index
Feature file exists but not listed in FEATURES.md.
**Fix:** Add entry to appropriate category in FEATURES.md.

### Broken dependency link
Feature references FEAT-xxx that doesn't exist.
**Fix:** Create the dependency or remove the reference.

### One-way dependency
A depends on B, but B doesn't list A as dependent.
**Fix:** Add A to B's "Dependents" section.

### Stale file references
"Files Changed" lists paths that no longer exist.
**Fix:** Update paths or remove if feature was refactored.

### Orphaned research
Research file exists but not in README.md index.
**Fix:** Add entry to Quick Find and All Research sections.
