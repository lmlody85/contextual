# Prompt Chaining Guide

**What is prompt chaining?** Breaking complex tasks into sequential, focused prompts instead of one large prompt.

---

## Why Chain Prompts?

**Without:** One big prompt → AI tries everything at once → May skip docs, miss patterns, more errors

**With:** Sequential focused prompts → Each step clear → Context maintained → Docs stay synced → Fewer mistakes

**Example chain:** Research → Create doc → Implement → Test → Validate

---

## Common Prompt Chains

### Chain 1: Adding a New Feature

```
Step 1: Research & Planning
"I need to add [feature name]. First, help me research:
 1. Check if similar features exist in FEATURES.md
 2. Find relevant research docs in research/README.md
 3. Check FEATURE-MAP.md for related features
 4. Summarize what you found"

Step 2: Feature Documentation
"Based on your research, create FEAT-XXX-[name].md:
 - Use the template from docs/features/_TEMPLATE.md
 - Link to the research docs you found
 - Document dependencies on related features
 - Add to FEATURES.md and FEATURE-MAP.md"

Step 3: Implementation
"Now implement the feature following the doc:
 - Follow the technical approach in the feature doc
 - Apply principles from linked research docs
 - Update 'Implementation Notes' as you code"

Step 4: Testing & Validation
"Complete the feature:
 - Write tests covering main functionality
 - Update 'Files Changed' section in feature doc
 - Mark TODO as 'Feature complete'
 - Run 'validate docs' to check consistency"
```

**Total tokens:** ~1800 vs 5000+ for one big prompt

### Chain 2: Fixing a Bug

```
Step 1: Investigation
"Help me investigate this bug:
 1. Find the relevant FEAT-xxx.md file
 2. Check 'Known Issues' section for similar bugs
 3. Review 'Files Changed' to locate code
 4. Analyze the problem"

Step 2: Fix Implementation
"Implement the fix:
 - Apply the solution we discussed
 - Follow patterns in the feature doc
 - Write a test that would have caught this bug"

Step 3: Documentation
"Document this fix:
 - Add to 'Known Issues & Resolutions' in FEAT-xxx.md
 - Describe the bug, fix, and prevention
 - Update research docs if this revealed new insights"
```

---

## Chaining Strategies

### Strategy 1: Break by Documentation Type

```
1. Read index (FEATURES.md, research/README.md)
2. Read specific feature (FEAT-xxx.md)
3. Read related research (linked from feature)
4. Take action (implement, fix, document)
```

**Why this works:** Each step loads < 1000 tokens, maintains context efficiently.

### Strategy 2: Break by Task Phase

```
1. Understand (read docs, analyze)
2. Plan (create feature doc, outline approach)
3. Implement (write code)
4. Validate (test, document, check consistency)
```

**Why this works:** Natural workflow, prevents rushing ahead.

### Strategy 3: Break by Scope

```
1. Focus on one feature at a time
2. Complete all documentation for that feature
3. Move to next feature
```

**Why this works:** Prevents context switching, keeps docs synchronized.

---

## Best Practices

- **Start with research** - Load context before implementing
- **One task per prompt** - Keep prompts focused
- **Reference docs explicitly** - "Read FEAT-001.md" not "check the auth feature"
- **End with validation** - Always verify consistency
- **Use TodoWrite** - Track progress through the chain (Claude Code)
- **Include documentation steps** - Don't jump straight to code
- **Update indexes** - FEATURES.md, FEATURE-MAP.md as part of chain

---

## Integration with Documentation System

This system enables chaining through self-contained docs (< 600 tokens each), clear indexes (FEATURES.md, FEATURE-MAP.md), and validation endpoint. Each chain step loads < 1000 tokens.

### Chaining + Automation (Claude Code)

```
Your chain: Prompt 1 → Prompt 2 → Prompt 3
              ↓           ↓           ↓
Hook detects: Major work → Feature complete → Prompts validation
              ↓
Sub-agent: Validates everything automatically
```

**Best of both worlds:**
- You control the chain (focused prompts)
- System automates validation (safety net)

---

**Remember:** Chain prompts = focused prompts = better results. Use chains from this guide, always end with validation.
