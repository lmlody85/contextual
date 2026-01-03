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

### How to Add Research

When you discover important domain knowledge:

1. **Copy the template**: Use `_TEMPLATE.md` in this directory as a starting point
2. **Create a new file**: Save as `topic-name.md` (use descriptive kebab-case name)
3. **Add to this README**: Link from the appropriate category below
4. **Link from feature docs**: Reference from relevant `FEAT-xxx.md` files

---

## Categories

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
