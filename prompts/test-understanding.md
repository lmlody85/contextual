# Contextual Understanding Test

Measure how well an AI agent understands your codebase before and after implementing Contextual.

---

## How to Use

1. **Run BEFORE implementing Contextual** — Answer questions, record scores
2. **Implement Contextual** — Use [implement-contextual.md](implement-contextual.md)
3. **Run AFTER implementing** — Answer same questions, compare scores

---

## Questions

Answer based on your current understanding of the codebase. Be honest about uncertainty.

1. **Architecture:** Describe the system's architecture in 2-3 sentences. What are the main components and how do they interact?

2. **Entry points:** What are the main entry points to this application? (e.g., API routes, CLI commands, main functions)

3. **Dependencies:** Pick any feature/module - what other parts of the codebase does it depend on? What depends on it?

4. **Tech stack:** List the languages, frameworks, and key libraries used. How confident are you in this list?

5. **Design decisions:** What architectural or design decisions can you identify? Why were they made?

6. **Bug fix scenario:** If asked to fix a bug in [pick a specific area], which files would you need to read? How confident are you?

7. **New feature scenario:** If asked to add a new feature that integrates with existing functionality, where would you start? What would you need to understand first?

---

## Scoring (self-assess 1-5)

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

## Compare Results

After running this test before AND after implementation:

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
