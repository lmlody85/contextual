# Post-Feature Validation Reminder

> **Note:** This document describes the intended hook behavior. The AI agent should follow these guidelines when completing feature work.

This describes when to remind users about documentation validation after completing feature work.

## Trigger Conditions

Check if any of these conditions are met:

### Condition 1: New Feature Document Created
- A new file matching `docs/features/FEAT-*.md` was just created (Write tool)
- This indicates a new feature has been documented

### Condition 2: Feature Marked Complete
- An existing `docs/features/FEAT-*.md` was edited (Edit tool)
- The TODO section changed to include "Feature complete" or all TODOs are checked
- This indicates feature implementation finished

### Condition 3: Multiple Documentation Files Updated
- 2+ documentation files were modified in the recent conversation turn
- Files include: FEATURES.md, FEATURE-MAP.md, CURRENT.md, or research/*.md
- This indicates comprehensive documentation updates

## Action to Take

If ANY condition is met, append this reminder to your next response to the user:

```
---

**Documentation Validation Recommended**

I've completed major feature work. Would you like me to validate the documentation consistency?

I can check:
- All features are properly indexed
- Dependencies are bidirectional
- Research links are valid
- Feature map is up-to-date

Just say "validate docs" or "yes" to run validation.
```

## Important Notes

- Only trigger this reminder ONCE per feature work session
- Don't interrupt the current response - append at the end
- Make it easy to decline (user can ignore if not needed)
- Keep the message concise and actionable

## Examples

### Example 1: New Feature Created
```
User: "Add payment gateway integration"
AI: [creates FEAT-023-payment.md, updates indexes]
Hook detects: New FEAT file created
AI adds to response: "Would you like me to validate docs?"
```

### Example 2: Feature Completed
```
User: "Finish the authentication feature"
AI: [updates FEAT-001.md TODO to "Feature complete"]
Hook detects: Feature marked complete
AI adds to response: "Would you like me to validate docs?"
```

### Example 3: Comprehensive Doc Update
```
User: "Document the new search feature and its dependencies"
AI: [creates FEAT-015.md, updates FEATURES.md, FEATURE-MAP.md]
Hook detects: 3 doc files modified
AI adds to response: "Would you like me to validate docs?"
```

## Why This Approach

**Benefits:**
- ✅ Automatic detection (AI doesn't need to remember)
- ✅ User stays in control (asks, doesn't auto-run)
- ✅ Only triggers for major work (not every edit)
- ✅ Non-intrusive (easy to decline)
- ✅ Timely reminder (right after completion)

**Avoids:**
- ❌ Running validation on every file change
- ❌ Interrupting workflow with validation reports
- ❌ Requiring perfect AI agent memory
- ❌ Manual checklist reading every time
