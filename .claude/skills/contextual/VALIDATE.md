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
# 1. Check structure exists
for file in AGENTS.md docs/CURRENT.md docs/FEATURES.md docs/FEATURE-MAP.md docs/research/README.md docs/architecture/overview.md; do
  if [ -f "$file" ]; then
    echo "EXISTS: $file"
  else
    echo "MISSING: $file"
  fi
done

# 2. List all feature docs
ls docs/features/FEAT-*.md 2>/dev/null || echo "No feature docs yet"

# 3. Check for orphaned features (in folder but not in FEATURES.md)
# Manual: Compare ls output with FEATURES.md content
```

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
