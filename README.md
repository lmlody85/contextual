# Contextual

> A documentation framework that teaches AI to document as it builds

**Describe what you want to build. AI creates the architecture, features, and documentation—asking clarifying questions along the way. You stay in control while AI handles the paperwork.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

---

## The Problem

AI-assisted development without structure leads to chaos:

❌ **No documentation** → AI forgets context between sessions, repeats mistakes
❌ **AI guesses instead of asks** → Builds wrong thing, requires rework
❌ **Manual docs** → You spend time writing instead of building
❌ **Documentation drift** → Docs become stale, AI gets confused

**Result:** You either skip documentation (and pay later) or waste time maintaining it yourself.

---

## The Solution

Contextual teaches AI to **create and maintain documentation automatically**:

✅ **AI asks first** → Clarifies requirements before building
✅ **AI documents as it builds** → Architecture, features, decisions captured automatically
✅ **AI maintains consistency** → Updates indexes, validates links, tracks dependencies
✅ **You stay in control** → Review and approve, but don't write boilerplate
✅ **Token-efficient** → AI navigates your codebase in ~1,000-2,000 tokens

---

## Key Features

### Context-Efficient Navigation

```
Fix a bug: ~1,000 tokens (Quick Ref + FEAT-xxx.md)
Add a feature: ~1,500-1,800 tokens (Quick Ref + indexes + research + template)
Understand architecture: ~2,000 tokens (Quick Ref + architecture + FEATURE-MAP)
```

**How?** Optimized entry points + hub-and-spoke design + self-contained feature docs.

### Automated Validation (Claude Code)

Hooks detect when you complete major work and prompt for validation. A sub-agent then checks indexes, dependencies, and links automatically.

**Result:** Never forget to update indexes. See [For Claude Code Users](#for-claude-code-users) for details.

### AI Agent Guidance

Built-in strategies for effective AI-assisted development:

- **Clarify First:** AI asks questions BEFORE implementing ambiguous features
- **Chain Prompts:** Break complex tasks into focused steps (< 1000 tokens each)
- **Measure, Don't Guess:** Benchmark performance, document actual data

See [guides/](docs/guides/) for detailed strategies.

### Smart Documentation Structure

```
Feature docs (FEAT-xxx.md)
  ↓ Links to
Research docs (algorithms, design principles)
  ↓ Organized by
Topic-based indexes (Quick Find)
  ↓ Validated by
Automated consistency checks
```

### Multi-Agent Support

Works out-of-the-box with:
- **Claude Code** (with hooks, sub-agents, automation)
- **Cursor AI** (ready to add)
- **GitHub Copilot** (ready to add)
- **Any AI tool** (via universal `AGENTS.md`)

---

## Quick Start

### 1. Copy This Template

```bash
# Clone this repository
git clone https://github.com/lmlody85/contextual.git my-project
cd my-project

# Remove git history (start fresh)
rm -rf .git
git init
```

### 2. Describe Your Project to AI

Just tell your AI assistant what you want to build:

```
"I want to build a task management app with user authentication"
```

**The AI will:**
1. Ask clarifying questions (OAuth vs password? What features?)
2. Create `docs/architecture/overview.md` based on your answers
3. Create your first feature doc (`FEAT-001-auth.md`)
4. Implement the feature
5. Update all indexes automatically
6. Prompt you to validate docs

### 3. Keep Building

For each new feature, just describe what you need:

```
"Add the ability to share tasks with other users"
```

**The AI handles:**
- Creating feature documentation
- Updating architecture as the system grows
- Maintaining indexes and dependencies
- Validating consistency

### 4. You Stay in Control

The AI asks before making big decisions:
- Which authentication approach? (OAuth, passwords, magic links)
- How should sharing work? (invite links, email, direct add)
- What permissions model? (view-only, edit, admin)

Your answers get documented in feature files for future reference.

---

## Documentation Structure

```
your-project/
├── AGENTS.md                    # Universal AI agent instructions
├── CLAUDE.md                    # Claude Code specific features
├── docs/
│   ├── CURRENT.md               # Active work tracker
│   ├── FEATURES.md              # Feature index
│   ├── FEATURE-MAP.md           # Feature relationships
│   ├── features/
│   │   ├── _TEMPLATE.md         # Feature documentation template
│   │   └── FEAT-*.md            # Individual feature docs
│   ├── research/
│   │   ├── README.md            # Research index with Quick Find
│   │   └── *.md                 # Domain knowledge, algorithms, principles
│   ├── architecture/
│   │   └── overview.md          # System architecture
│   └── guides/
│       ├── setup.md             # Getting started
│       ├── docs-validation.md   # Validation procedures
│       ├── prompt-chaining.md   # Break complex tasks into steps
│       ├── clarification-strategy.md  # Ask before implementing
│       └── multi-agent-support.md     # Multi-tool support guide
└── .claude/                     # Claude Code configuration (optional)
    ├── agents/
    │   └── docs-validator.md    # Validation sub-agent
    └── hooks/
        └── post-feature-reminder.md   # Auto-validation prompts
```

---

## Core Concepts

### Feature Documentation (FEAT-xxx.md)

Each feature gets ONE self-contained document:

```markdown
# FEAT-001: User Authentication

## What
Brief description (2-3 sentences)

## Why
Problem it solves

## How
Technical approach + key components

## Feature Dependencies
What it depends on, what depends on it

## Files Changed
List of modified files

## Known Issues & Resolutions
Bugs, fixes, workarounds

## TODO
Remaining work or "Feature complete"

## Implementation Notes
Decisions, challenges, lessons learned
```

**Benefits:**
- Self-contained (no circular dependencies)
- AI loads only what it needs (< 600 tokens per feature)
- Documents WHY, not just WHAT

### Research Documentation

Domain knowledge separated from features:

```
docs/research/
├── README.md                    # Quick Find by topic
├── oauth-best-practices.md      # Referenced by FEAT-001, FEAT-003
├── caching-strategies.md        # Referenced by FEAT-012, FEAT-015
└── api-design-principles.md     # Referenced by all API features
```

**Benefits:**
- Reusable across features (DRY principle)
- Easy to update when research evolves
- AI loads only relevant research (on-demand)

### Feature Map

Visual representation of dependencies:

```markdown
## Authentication Flow
FEAT-001 (Login)
  ↓ provides tokens to
FEAT-002 (Session Management)
  ↓ provides session data to
FEAT-015 (User Profile)
```

**Benefits:**
- Understand change impact (changing FEAT-001 affects which features?)
- Navigate to related features quickly
- Identify critical dependencies

---

## Token Efficiency Comparison

| Task | This System | Single README | Wiki System |
|------|------------|---------------|-------------|
| Fix bug | ~1,000 tokens | 5000+ tokens | 2000+ tokens |
| Add feature | ~1,500-1,800 tokens | 5000+ tokens | 4000+ tokens |
| Understand arch | ~2,000 tokens | 5000+ tokens | 3000+ tokens |

**Why this matters:** AI models have context limits. More efficient navigation = more room for actual code and implementation.

---

## Scalability

Tested and optimized for projects of all sizes:

| Project Size | Status | Notes |
|-------------|--------|-------|
| **1-30 features** | ✅ Perfect | Current structure is ideal |
| **30-60 features** | ✅ Excellent | Quick Find indexes work great |
| **60-100 features** | ✅ Good | May want subdirectories |
| **100+ features** | ⚠️ Fair | Need hierarchical feature map |

**Key insight:** System scales linearly. Individual docs don't grow with feature count.

---

## What You Get

✓ **Token efficiency:** 1,000-2,000 tokens for most tasks
✓ **Clear navigation:** Unambiguous entry points
✓ **Context isolation:** Only read what you need
✓ **Automated validation:** Catches errors proactively (Claude Code)
✓ **Multi-agent support:** Works with Claude, Cursor, Copilot, and more

---

## For Claude Code Users

This system includes **Claude Code-specific automation**:

### Automated Validation

```
After creating a feature:
  ↓
Hook detects major work
  ↓
AI prompts: "Validate docs?"
  ↓
You confirm
  ↓
Sub-agent validates everything
```

### Smart Features

- **PostToolUse hooks** → Auto-detect feature completion
- **Sub-agents** → Validate documentation consistency
- **TodoWrite integration** → Track progress with validation as final step

**See:** [CLAUDE.md](CLAUDE.md) for Claude-specific features.

### Advanced Techniques

**Prompt Chaining:**
- Break complex features into focused steps
- Load < 1000 tokens per step
- Maintain context efficiently
- **Guide:** [docs/guides/prompt-chaining.md](docs/guides/prompt-chaining.md)

**Systematic Clarification:**
- Ask questions before implementing ambiguous features
- Present options with trade-offs
- Document decisions in feature docs
- **Guide:** [docs/guides/clarification-strategy.md](docs/guides/clarification-strategy.md)

**Result:** Build exactly what users want, first time.

---

## For Other AI Tools

### Universal Support

All AI tools can use this system via `AGENTS.md`:

```
Your AI tool reads AGENTS.md
  ↓
Follows documentation structure
  ↓
Uses manual validation checklist
  ↓
Full compatibility ✓
```

### Add Tool-Specific Optimizations

```bash
# Example: Add Cursor support
cp docs/guides/multi-agent-support.md .cursorrules
# Customize for Cursor-specific features

# Example: Add Copilot support
mkdir -p .github
cp docs/guides/multi-agent-support.md .github/copilot-instructions.md
# Customize for Copilot-specific features
```

**See:** [docs/guides/multi-agent-support.md](docs/guides/multi-agent-support.md) for details.

---

## Use Cases

### ✅ Perfect For

- **Complex software projects** with 10+ features
- **AI-assisted development** with Claude, Cursor, Copilot
- **Team projects** where documentation must stay synchronized
- **Long-term projects** where documentation drift is a problem
- **Open-source projects** that want AI-friendly contribution guides

### ⚠️ Overkill For

- **Single-file scripts** or very simple projects
- **Projects with < 5 features** (use a simple README)
- **Throwaway prototypes** or POCs
- **Projects without AI assistance**

---

## Contributing

This is a template/framework project. Ways to contribute:

1. **Share your experience** - Open an issue describing how you used it
2. **Report bugs** - If something doesn't work as documented
3. **Suggest improvements** - Better ways to organize or validate
4. **Add AI tool support** - Examples for Cursor, Copilot, etc.
5. **Write guides** - Additional documentation on best practices

**Pull requests welcome!** Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.

---

## FAQ

### Q: Why not just use a wiki or Notion?

**A:** Wikis create circular dependencies and force AI to load many pages. This system is optimized for token efficiency and self-contained docs.

### Q: Can I use this without AI assistance?

**A:** Yes! The structure works well for human developers too. But it's optimized for AI agent navigation.

### Q: What if I'm already using a different documentation system?

**A:** You can migrate gradually. Start with high-priority features in this format, keep old docs as-is.

### Q: Does this work with languages other than English?

**A:** Yes! The structure is language-agnostic. Just write your docs in your preferred language.

### Q: How do I handle private/sensitive documentation?

**A:** Keep sensitive info in separate files outside this structure. Use `.gitignore` or private repos.

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Contact & Support

- **Issues:** [GitHub Issues](https://github.com/lmlody85/contextual/issues)
- **Discussions:** [GitHub Discussions](https://github.com/lmlody85/contextual/discussions)
- **Twitter:** [@lmlody](https://twitter.com/lmlody)

---

**If you find this useful, consider starring the repository to help others discover it.**
