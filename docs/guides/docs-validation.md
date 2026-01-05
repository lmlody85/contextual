# Documentation Validation Guide

## Purpose

This guide describes how to validate documentation consistency using automated checks or manual review.

---

## Validation Checklist

Use this checklist after creating or updating documentation:

### Feature Documentation Validation

**After creating/updating FEAT-xxx.md:**
- [ ] Feature is listed in `/docs/FEATURES.md` under correct category
- [ ] Feature is added to `/docs/FEATURE-MAP.md` if it has dependencies
- [ ] All research doc links in feature are valid (files exist)
- [ ] All feature dependencies are bidirectional:
  - If FEAT-A depends on FEAT-B, then FEAT-B lists FEAT-A as dependent
- [ ] All files in "Files Changed" section actually exist
- [ ] If feature is active work, it's mentioned in `/docs/CURRENT.md`

### Research Documentation Validation

**After creating/updating research docs:**
- [ ] Research doc is listed in `/docs/research/README.md`
- [ ] Research doc is added to appropriate "Quick Find" category
- [ ] Research doc is added to "All Research Documents" list
- [ ] At least one FEAT-xxx.md links to this research (if applicable)
- [ ] All code examples in research compile/run correctly

### Index Validation

**Periodically check:**
- [ ] All features in FEATURES.md exist as files
- [ ] All features as files are listed in FEATURES.md
- [ ] All research docs in research/README.md exist
- [ ] All research files exist in research/README.md
- [ ] FEATURE-MAP.md relationships match FEAT-xxx.md dependencies
- [ ] No broken internal links (use link checker)

---

## Automated Validation

### Option 1: Smart Automation with Hook (Recommended)

**The system automatically prompts validation after major feature work!**

**How it works:**

```
1. You create/complete a feature
   └─> Hook detects: "New FEAT file" or "Feature complete"
       └─> AI agent asks: "Would you like me to validate docs?"
           └─> You say: "validate docs" or "yes"
               └─> Validator agent runs and reports issues
```

**Triggers automatic prompt when:**
- ✅ New `FEAT-xxx.md` file is created
- ✅ Feature TODO section marked "Feature complete"
- ✅ Multiple doc files updated (FEATURES.md, FEATURE-MAP.md, etc.)

**Benefits:**
- No need to remember to validate
- You stay in control (prompted, not auto-run)
- Only triggers for major work (not every edit)
- Non-intrusive (easy to decline)

**See:** [.claude/hooks/post-feature-reminder.md](../../.claude/hooks/post-feature-reminder.md) for hook configuration.

### Option 2: Manual Validation

**Location:** `.claude/agents/docs-validator.md`

**How to use:**
Simply say to Claude Code: `validate docs` or `check documentation`

The agent will:
- Scan all feature and research documentation
- Check for missing index entries
- Verify bidirectional dependencies
- Validate all internal links
- Report issues with specific fix instructions

**What it checks:**
1. All FEAT-xxx.md files are listed in FEATURES.md
2. All feature dependencies are bidirectional
3. All research doc links are valid
4. FEATURE-MAP.md includes features with dependencies
5. No orphaned files in docs/features/ or docs/research/
6. Research docs are properly indexed in research/README.md

**See:** [.claude/README.md](../../.claude/README.md) for details on the agent configuration.

### Option 3: Manual Validation Script

**Quick validation commands:**

```bash
# Check for orphaned feature files
diff <(ls docs/features/*.md | grep -v TEMPLATE | sed 's/.*\///' | sed 's/\.md//') \
     <(grep -o 'FEAT-[0-9]*' docs/FEATURES.md | sort -u)

# Check for broken research links in features
grep -r '\.\./research/' docs/features/ | while read line; do
  file=$(echo $line | cut -d: -f1)
  link=$(echo $line | grep -o '\.\./research/[^)]*')
  if [ ! -f "docs/research/$(basename $link)" ]; then
    echo "Broken link in $file: $link"
  fi
done

# Check for features not in FEATURE-MAP
grep -l "## Feature Dependencies" docs/features/*.md | while read file; do
  feat=$(basename $file .md)
  if ! grep -q "$feat" docs/FEATURE-MAP.md; then
    echo "Feature with dependencies not in map: $feat"
  fi
done
```

### Option 4: Pre-Commit Hook

Add to `.git/hooks/pre-commit`:

```bash
#!/bin/bash
# Validate documentation before committing

echo "🔍 Validating documentation..."

# Check if any FEAT files changed
if git diff --cached --name-only | grep -q 'docs/features/FEAT-.*\.md'; then
  echo "Feature docs changed, checking indexes..."

  # Add validation logic here
  # Exit 1 if validation fails
fi

echo "✓ Documentation validation passed"
```

---

## Common Issues and Fixes

### Issue: Feature exists but not in FEATURES.md

**Detection:**
```bash
ls docs/features/FEAT-*.md | xargs -n1 basename | \
  grep -v $(grep -o 'FEAT-[0-9]*' docs/FEATURES.md)
```

**Fix:**
Add missing feature to `/docs/FEATURES.md` under appropriate category

### Issue: Broken research link

**Detection:**
Manually check or use link validator

**Fix:**
- Create the missing research doc, OR
- Fix the link to point to correct file

### Issue: Bidirectional dependency missing

**Detection:**
Check "Feature Dependencies" section - if FEAT-A depends on FEAT-B,
check if FEAT-B lists FEAT-A in "Features that depend on this"

**Fix:**
Update the dependent feature doc to list the bidirectional relationship

### Issue: Orphaned research doc

**Detection:**
Check if any FEAT-xxx.md files link to the research doc

**Fix:**
- Add links from relevant features, OR
- Document why this research is standalone, OR
- Remove if truly unused

---

## Validation Frequency

**After every documentation change:** Run quick validation
**Before PR/commit:** Run full validation
**Weekly/monthly:** Audit all documentation for drift

---

## Future Enhancements

Consider adding:
- Automated link checker (e.g., markdown-link-check)
- Documentation coverage metrics (% of features with research links)
- Relationship graph generator (visualize dependencies)
- Dead code detection (features marked complete but TODO exists)
