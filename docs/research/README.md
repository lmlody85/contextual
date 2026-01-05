# Research & Domain Knowledge

This directory contains domain knowledge, research findings, and principles that guide our implementation decisions.

---

## Purpose

Research docs answer the "why" questions:
- Why did we choose this approach?
- What are the best practices for this domain?
- What principles should guide our decisions?
- What did we learn that affects multiple features?

---

## Research Documents

*No research documents yet*

### Quick Find by Topic

When looking for research, search by relevant keywords:

**Authentication & Authorization:**
*No research yet - add [oauth-best-practices.md], [session-security.md], etc.*

**API Design:**
*No research yet - add [rest-principles.md], [error-handling.md], etc.*

**Performance & Optimization:**
*No research yet - add [caching-strategies.md], [db-optimization.md], etc.*

**Data & Storage:**
*No research yet - add [data-modeling.md], [migration-patterns.md], etc.*

**Frontend & UX:**
*No research yet - add [component-architecture.md], [state-management.md], etc.*

**Testing & Quality:**
*No research yet - add [testing-strategy.md], [ci-cd-patterns.md], etc.*

**Security:**
*No research yet - add [security-checklist.md], [vulnerability-prevention.md], etc.*

**Domain-Specific:**
*No research yet - add domain-specific research files*

---

### How to Add Research

When you discover important domain knowledge:

1. **Copy the template**: Use `_TEMPLATE.md` in this directory as a starting point
2. **Create a new file**: Save as `topic-name.md` (use descriptive kebab-case name)
3. **Add to this README**:
   - Link from the appropriate "Quick Find" category above
   - Add to the "All Research" list below
4. **Link from feature docs**: Reference from relevant `FEAT-xxx.md` files

---

## All Research Documents (Alphabetical)

*No research documents yet*

---

## Categories Reference

### Architecture & Design
*Research about system design, patterns, and architecture*

### Performance
*Research about optimization, scaling, and performance*

### Security
*Research about security best practices and considerations*

### User Experience
*Research about UX principles and best practices*

### Domain-Specific
*Research specific to the problem domain of this project*

---

## Best Practices

### When to Create Research Docs
✅ **Do create** when:
- You've researched a topic that affects multiple features
- You've discovered best practices worth documenting
- You need to explain why we chose an approach
- You want to preserve important domain knowledge

❌ **Don't create** when:
- Information is specific to one feature (put in feature doc instead)
- It's basic information easily found elsewhere
- It's implementation details (put in code comments instead)

### Linking Research
Always link research docs from feature docs:
```markdown
## Related Research
- [Performance Best Practices](../research/performance.md) - Guides our caching strategy
- [API Design Principles](../research/api-design.md) - Informs endpoint structure
```

### Keeping Research Current
- Update research docs when you discover new information
- Archive outdated research (move to `archive/` subdirectory)
- Review periodically to ensure accuracy
