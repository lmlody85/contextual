# Documentation Automation Overview

This document explains how documentation validation is automated in this project.

---

## The Problem

When implementing features, it's easy to forget to update all documentation:
- Create `FEAT-023.md` — Done
- Update `FEATURES.md` index — **Forgot!**
- Update `FEATURE-MAP.md` — **Forgot!**
- Result: Orphaned features, broken relationships

---

## The Solution: Smart Automation

Instead of relying on memory, the system **automatically detects major feature work** and **prompts validation**.

### How It Works

```
1. You create/update feature
        ↓
2. Hook detects: "New FEAT file" or "Feature marked complete"
        ↓
3. AI agent asks: "Would you like me to validate docs?"
        ↓
4. You say: "validate docs" or "yes"
        ↓
5. Validator runs and reports results
```

---

## Key Components

### 1. PostToolUse Hook
**File:** `.claude/hooks/post-feature-reminder.md`

**Detects:**
- New `FEAT-xxx.md` file created
- Feature marked "Feature complete"
- Multiple doc files updated

**Action:** Makes AI agent prompt validation

### 2. Docs Validator Agent
**File:** `.claude/agents/docs-validator.md`

**Triggered by:**
- User saying "validate docs"
- Automatic prompt from hook

**Checks:**
- All FEAT files in FEATURES.md index
- Dependencies are bidirectional
- Research links are valid
- Feature map includes dependencies
- No orphaned files

**Output:** Detailed report with specific fix instructions

---

## Design Decisions

### Why Ask Instead of Auto-Run?

**Ask-first approach (chosen):**
```
Hook → Prompts AI to ask user → User decides → Validator runs
```

**Benefits:**
- User stays in control
- Non-intrusive (easy to decline)
- Only runs when user wants it
- Automatic reminder prevents forgetting

**Auto-run approach (rejected):**
```
Hook → Automatically runs validator → Reports issues
```

**Problems:**
- Interrupts workflow
- Noisy (runs even for minor edits)
- User loses control

### Why Hook-Based Detection?

**Hook-based (chosen):**
```
Hook automatically detects conditions → AI agent prompted
```

**Benefits:**
- Always detects major feature work
- Consistent behavior
- No reliance on AI memory
- Works across sessions

**Manual approach (rejected):**
```
AI agent must remember to ask about validation
```

**Problems:**
- AI might forget
- Inconsistent behavior
- Requires perfect memory

---

## Benefits

### For Users
- Never forget to validate documentation
- Stay in control (prompted, not auto-run)
- Catch errors before they accumulate
- Non-intrusive workflow

### For AI Agents
- Clear signal when to offer validation
- No need to remember across turns
- Consistent behavior
- Reduced cognitive load

### For Documentation Quality
- Always up-to-date indexes
- No orphaned features
- Bidirectional dependencies maintained
- Reduced documentation drift

---

## Configuration

**For details on customization and troubleshooting:** See [.claude/README.md](../../.claude/README.md)

---

## Summary

**Smart automation = Best of both worlds**

- Automatic detection (no need to remember)
- User control (ask, don't auto-run)
- Non-intrusive (easy to decline)
- Always timely (right after major work)

The system ensures documentation stays consistent without interrupting your workflow or removing your control.
