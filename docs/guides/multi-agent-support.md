# Multi-Agent Support Guide

This project supports multiple AI coding assistants through a hybrid documentation approach.

---

## Documentation Structure

### Universal Instructions: `AGENTS.md`

**Purpose:** Core instructions that work with ANY AI coding assistant

**Contains:**
- Documentation system overview
- Quick start workflows
- Documentation rules
- Feature format
- Research system
- Validation procedures
- Best practices

**Read by:** All AI agents

### Tool-Specific Files

**Purpose:** Leverage unique capabilities of specific tools

| Tool | File | Purpose |
|------|------|---------|
| **Claude Code** | `CLAUDE.md` | Hooks, sub-agents, TodoWrite, automation |
| **Cursor AI** | `.cursorrules` | Cursor-specific rules and preferences |
| **GitHub Copilot** | `.github/copilot-instructions.md` | Copilot-specific guidance |
| **Aider** | `.aider.conf.yml` | Aider configuration |
| **Other** | `AGENTS.md` | Fallback for tools without specific config |

---

## How It Works

### For Claude Code

```
Claude Code starts
  ↓
Reads CLAUDE.md (tool-specific)
  ↓
References AGENTS.md (universal instructions)
  ↓
Leverages Claude-specific features:
  - PostToolUse hooks
  - Sub-agents (docs-validator)
  - TodoWrite integration
  - Automated validation prompts
```

### For Other AI Tools

```
Tool starts
  ↓
Looks for tool-specific file (.cursorrules, etc.)
  ↓
If not found, reads AGENTS.md
  ↓
Follows universal instructions:
  - Documentation system
  - Feature format
  - Research system
  - Manual validation
```

---

## File Relationships

```
AGENTS.md (Universal)
    ↑
    └─ Referenced by tool-specific files:
       │
       ├─ CLAUDE.md
       │  ├─ Adds: Hooks, sub-agents, automation
       │  └─ References: AGENTS.md for core instructions
       │
       ├─ .cursorrules
       │  ├─ Adds: Cursor-specific rules
       │  └─ References: AGENTS.md for core instructions
       │
       └─ .github/copilot-instructions.md
          ├─ Adds: Copilot-specific guidance
          └─ References: AGENTS.md for core instructions
```

---

## Why This Approach?

### Benefits

**1. No Duplication (DRY)**
- Core instructions written once in AGENTS.md
- Tool-specific files are thin wrappers
- Easy to maintain (update one place)

**2. Tool Optimization**
- Claude Code gets hooks + sub-agents
- Cursor gets Cursor-specific rules
- Each tool leverages its unique features

**3. Universal Fallback**
- New/unknown tools can read AGENTS.md
- Works with any AI coding assistant
- Future-proof design

**4. Clear Separation**
- Universal vs tool-specific is obvious
- No confusion about what goes where
- Easy to understand structure

### Alternative Approaches (Why Not Used)

**Single file (CLAUDE.md only):**
- Problem: Locks you into one tool
- Problem: Other tools can't use it
- Problem: Not future-proof

**Multiple independent files:**
- Problem: Duplication (same instructions repeated)
- Problem: Hard to maintain consistency
- Problem: Updates must happen in multiple places

**Tool-agnostic only (AGENTS.md only):**
- Problem: Can't leverage tool-specific features
- Problem: Misses optimization opportunities
- Problem: One-size-fits-all compromises

---

## Adding Support for New Tools

### Example: Adding Cursor AI Support

1. **Create `.cursorrules`:**

```
# Cursor AI Instructions

This project uses a structured documentation system.

**For complete instructions:** See AGENTS.md

## Cursor-Specific Rules

- Use fuzzy search to find features: Cmd+P → "FEAT"
- Auto-complete feature IDs with "@FEAT-"
- Lint docs on save (optional)

## Quick Start

Before working on anything:
1. Read `/docs/CURRENT.md` - active work
2. Check `/docs/research/` - domain knowledge
3. Read relevant `/docs/features/FEAT-xxx.md` - feature details

## Validation

Cursor doesn't have sub-agents, so validate manually:
- After creating features, check `/docs/guides/docs-validation.md`
- Run validation checklist
- Verify all indexes are updated

**For full documentation system:** See AGENTS.md
```

2. **Update `docs/guides/multi-agent-support.md`:**

Add Cursor to the supported tools table.

3. **Test it:**

Open project in Cursor and verify `.cursorrules` is loaded.

### Example: Adding GitHub Copilot Support

1. **Create `.github/copilot-instructions.md`:**

```markdown
# GitHub Copilot Instructions

This project uses a structured documentation system.

**For complete instructions:** See [AGENTS.md](../AGENTS.md)

## Copilot-Specific Guidance

- Suggest feature IDs based on existing patterns (FEAT-###)
- Auto-complete from research docs when implementing
- Follow conventions in AGENTS.md

## Quick Start

[Reference quick start from AGENTS.md with Copilot-specific notes]

## Validation

Copilot doesn't have validation tools, so:
- Manually check indexes after creating features
- See `/docs/guides/docs-validation.md` for checklist

**For full documentation system:** See [AGENTS.md](../AGENTS.md)
```

---

## Best Practices

### What Goes in AGENTS.md (Universal)

**Include:**
- Documentation system structure
- Feature documentation format
- Research documentation system
- Naming conventions
- Git conventions
- Validation procedures
- Navigation shortcuts
- Token efficiency guidelines

**Don't include:**
- Tool-specific features (hooks, sub-agents)
- Tool-specific commands
- Tool-specific workflows
- Tool-specific integrations

### What Goes in Tool-Specific Files

**Include:**
- Tool-specific features (hooks, sub-agents, etc.)
- Tool-specific commands
- Tool-specific workflows
- How to leverage tool's unique capabilities
- Reference to AGENTS.md for core instructions

**Don't include:**
- Core documentation system (duplicate from AGENTS.md)
- Universal instructions (already in AGENTS.md)
- Feature format (already in AGENTS.md)

### Maintenance

**When updating instructions:**

1. **Core documentation changes** → Update `AGENTS.md`
   - Feature format changes
   - New documentation conventions
   - Research system updates
   - Naming convention changes

2. **Tool-specific changes** → Update tool file (e.g., `CLAUDE.md`)
   - New hooks
   - New sub-agents
   - Tool-specific workflows
   - Integration updates

3. **Test** → Verify both universal and tool-specific still work

---

## Current Tool Support

### Fully Supported

**Claude Code** (`CLAUDE.md`)
- Automated validation via hooks
- Sub-agents for consistency checking
- TodoWrite integration
- Smart prompts after major work

**Universal** (`AGENTS.md`)
- Any AI coding assistant
- Manual validation
- Complete documentation system

### 🔧 Ready to Add

**Cursor AI** (Create `.cursorrules`)
- Fuzzy search integration
- Auto-complete support
- Manual validation

**GitHub Copilot** (Create `.github/copilot-instructions.md`)
- Suggestion improvements
- Pattern matching
- Manual validation

**Aider** (Create `.aider.conf.yml`)
- CLI-specific workflows
- Manual validation

---

## Migration Guide

### From CLAUDE.md-only to Multi-Agent

If you already have a `CLAUDE.md` file:

1. **Extract universal content** → Create `AGENTS.md`
   - Copy core documentation structure
   - Copy feature format
   - Copy research system
   - Copy validation procedures
   - Copy naming conventions

2. **Keep tool-specific content** → Update `CLAUDE.md`
   - Keep hooks documentation
   - Keep sub-agents documentation
   - Keep TodoWrite integration
   - Add reference to AGENTS.md at top

3. **Test** → Verify Claude Code still works

4. **Add other tools** → Create tool-specific files as needed

---

## FAQ

### Q: Which file should AI agents read first?

**A:** Tool-specific file if available (e.g., `CLAUDE.md`), otherwise `AGENTS.md`.

### Q: What if I only use one tool?

**A:** Still use both files. AGENTS.md provides universal base, tool file adds optimizations.

### Q: How do I know what to put where?

**A:** Ask: "Does this apply to ALL tools or just one specific tool?"
- All tools → AGENTS.md
- Specific tool → Tool-specific file

### Q: Can I skip AGENTS.md and just use CLAUDE.md?

**A:** Not recommended. AGENTS.md ensures future compatibility and reduces duplication.

### Q: What about new AI tools not yet created?

**A:** They can read AGENTS.md as a universal fallback. When the tool becomes popular, add a specific file.

---

## Summary

**The hybrid approach provides:**
- Universal compatibility (AGENTS.md)
- Tool optimization (tool-specific files)
- No duplication (DRY principle)
- Easy maintenance (update one place)
- Future-proof (new tools work out of the box)

**Structure:**
```
AGENTS.md              ← Universal (all tools)
├─ CLAUDE.md           ← Claude Code specific
├─ .cursorrules        ← Cursor specific
└─ .github/copilot-instructions.md ← Copilot specific
```

**Remember:** Core instructions in AGENTS.md, tool features in tool files.
