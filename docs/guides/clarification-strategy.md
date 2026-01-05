# Clarification Strategy

> **Prevent assumptions, reduce rework, deliver what users actually want.**

This guide establishes when and how AI agents should ask clarifying questions before proceeding with work.

**Core principle:** "Assumptions are the enemy. For non-trivial tasks, reach ground truth understanding before coding."

---

## The Problem

**Without clarification:** AI assumes wrong approach (e.g., username/password when OAuth needed) → Complete rework ✗

**With clarification:** AI asks 2-3 key questions upfront → Builds exactly what's needed ✓

---

## When to Ask Clarifying Questions

### Rule 1: Always Ask for Ambiguous Requirements

**Trigger:** User request can be implemented in 2+ significantly different ways.

**Examples:**
- "Add search" → Full-text? Filters? Autocomplete?
- "Add payments" → Which provider? One-time or subscriptions?

**Action:** Use AskUserQuestion to present options.

### Rule 2: Ask Before Making Architectural Decisions

**Trigger:** Implementation choice affects multiple features or long-term architecture.

**Examples:**
- State management (Redux vs Context vs Zustand)
- Authentication strategy (JWT vs sessions)

**Action:** Use AskUserQuestion to discuss trade-offs.

### Rule 3: Ask When Multiple Valid Patterns Exist

**Trigger:** Research docs or codebase show multiple approaches to the same problem.

**Examples:**
- Found 2 different error handling patterns in codebase
- Research docs suggest 3 different caching strategies

**Action:** Ask which pattern to follow or if consolidation is needed.

### Rule 4: Don't Ask for Obvious Decisions

**Don't trigger:** Implementation detail that doesn't affect user or architecture.

**Examples:** Variable naming, code formatting, file organization

**Action:** Proceed with sensible defaults from conventions.

### Rule 5: Measure, Don't Guess (Performance & Numbers)

**Trigger:** User asks about performance, scalability, or makes numerical claims.

**Examples:** "How fast is it?" → Benchmark, "Can it handle 10K users?" → Load test

**Action:**
1. Ask which metrics matter (response time, throughput, memory)
2. Measure and report actual data: ✅ "Measured: 45ms" not ❌ "Should be ~50ms"
3. Document in feature docs ("Performance Benchmarks" section)

---

## Question Patterns

### Pattern 1: Multiple Choice (Recommended)

**When:** 2-4 clear options exist

```
What [aspect] should I use?
□ Option A (Recommended) - Why it's recommended
□ Option B - Trade-offs
□ Option C - When to use this
```

### Pattern 2: Trade-off Discussion

**When:** Significant architectural decision

```
[Feature] can be implemented with:

Approach A: [Description]
  ✅ Pros: [list]
  ❌ Cons: [list]

Approach B: [Description]
  ✅ Pros: [list]
  ❌ Cons: [list]

Which approach fits your needs better?
```

---

## Integration with Documentation System

### In Feature Docs

Add clarification section to "Implementation Notes":
```markdown
## Implementation Notes

### Decisions Made
- [Decision 1]: Chose [option] because [rationale]
  - Clarified with user: [reference to conversation]
- [Decision 2]: Went with [approach] over [alternative]
  - Reasoning: [why this fits better]
```

### In Research Docs

When research docs present multiple approaches:
```markdown
## Approaches

### Approach A: [Name]
**When to use:** [scenarios]
**Trade-offs:** [pros/cons]

### Approach B: [Name]
**When to use:** [scenarios]
**Trade-offs:** [pros/cons]

**⚠️ Decision required:** If both approaches are viable,
ask the user which to use via AskUserQuestion.
```

---

## Example Workflow

```
User: "Add authentication"

AI: Identifies 3 key decisions (auth method, session strategy, storage)
    Asks: "What authentication method?" with 4 options
User: "OAuth with Google"
AI: Documents decision in FEAT-001-auth.md, implements → Done right first time ✓
```

---

## Critical Anti-Pattern to Avoid

### ❌ Asking After Implementation

```
AI: [Implements entire feature]

AI: "By the way, did you want OAuth or username/password auth?"

User: "OAuth! Now I need to rewrite everything?"
```

**Fix:** Ask BEFORE implementation, not after. This is the most critical timing issue - all clarification must happen before coding begins.

---

## Best Practices Summary

### Best Practices

- **Ask before implementing** ambiguous features (timing is critical)
- **Present options with trade-offs** for architectural decisions
- **Limit questions to 2-4** key decision points (avoid overwhelming user)
- **Recommend an option** based on research and conventions
- **Document decisions** in "Implementation Notes"
- **Use AskUserQuestion tool** (Claude Code) for structured questions

---

## Tool Reference

### For Claude Code

Use the `AskUserQuestion` tool:

```typescript
AskUserQuestion({
  questions: [{
    question: "What caching approach should I use?",
    header: "Caching",
    options: [
      {
        label: "Redis (Recommended)",
        description: "Persistent, scalable, production-ready"
      },
      {
        label: "In-memory",
        description: "Simple, fast, resets on restart"
      },
      {
        label: "CDN",
        description: "Best for static content"
      }
    ],
    multiSelect: false
  }]
})
```

### For Other AI Tools

Use natural language clarification:

```markdown
Before proceeding, I need to clarify [aspect]:

Option A: [description]
- Pros: [list]
- Cons: [list]

Option B: [description]
- Pros: [list]
- Cons: [list]

Which option fits your needs better?
```

---

**Start using systematic clarification today to build better features faster.**
