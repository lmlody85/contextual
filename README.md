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

## How It Works

### Self-Contained Feature Docs

**Benefit:** AI loads only what it needs—no circular dependencies, no context pollution.

Each feature gets ONE document (`FEAT-xxx.md`) containing everything: what, why, how, dependencies, known issues, and decisions made.

```markdown
# FEAT-001: User Authentication

## What — Brief description
## Why — Problem it solves
## How — Technical approach
## Dependencies — What it connects to
## Known Issues — Bugs and resolutions
## Implementation Notes — Decisions and rationale
```

### Reusable Research Library

**Benefit:** Domain knowledge stays DRY—update once, referenced everywhere.

```
docs/research/
├── oauth-best-practices.md    → Referenced by FEAT-001, FEAT-003
├── caching-strategies.md      → Referenced by FEAT-012, FEAT-015
└── api-design-principles.md   → Referenced by all API features
```

### Dependency Tracking

**Benefit:** Understand impact before making changes—see what breaks if you modify a feature.

```
FEAT-001 (Login)
  ↓ provides tokens to
FEAT-002 (Session Management)
  ↓ provides session data to
FEAT-015 (User Profile)
```

### Works With Any AI Tool

- **Claude Code** — Full automation with hooks and sub-agents
- **Cursor, Copilot, others** — Via universal `AGENTS.md` instructions

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

## Performance

### Token Efficiency

AI spends more time coding, less time reading:

| Task | Contextual | Single README | Wiki |
|------|------------|---------------|------|
| Fix bug | ~1,000 tokens | 5000+ | 2000+ |
| Add feature | ~1,700 tokens | 5000+ | 4000+ |
| Understand arch | ~2,000 tokens | 5000+ | 3000+ |

### Scalability

| Project Size | Status | Notes |
|-------------|--------|-------|
| **1-30 features** | ✅ Ideal | Current structure perfect |
| **30-60 features** | ✅ Excellent | Quick Find indexes scale well |
| **60-100 features** | ✅ Good | Consider subdirectories |
| **100+ features** | ⚠️ Needs work | Hierarchical structure recommended |

System scales linearly—individual docs don't grow with feature count.

---

## For Claude Code Users

Full automation via hooks and sub-agents:

- **Auto-validation** — Hooks detect feature completion, prompt to validate, sub-agent checks everything
- **Progress tracking** — TodoWrite integration with validation as final step
- **Prompt chaining** — Break complex work into focused steps ([guide](docs/guides/prompt-chaining.md))
- **Clarification strategy** — AI asks before implementing ([guide](docs/guides/clarification-strategy.md))

**See:** [CLAUDE.md](CLAUDE.md) for setup details.

---

## For Other AI Tools

All AI tools work via `AGENTS.md` — the universal instruction file.

To add tool-specific features, copy the multi-agent template:
- **Cursor:** `.cursorrules`
- **Copilot:** `.github/copilot-instructions.md`

**See:** [docs/guides/multi-agent-support.md](docs/guides/multi-agent-support.md) for setup.

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
