# Contextual

> **Documentation that writes itself.** AI creates and maintains docs as you build.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

**+120% confidence. +127% completeness.** Tested on a real multi-agent AI project.

> "Reading 5 doc files (~15 min) gave me 94% confidence vs. exploring 50+ source files (estimated 2-3 hours)"

---

## The Problem

AI-assisted development without structure leads to chaos:

- **No documentation** — AI forgets context between sessions, repeats mistakes
- **AI guesses instead of asks** — Builds the wrong thing, requires rework
- **Manual documentation** — You spend time writing instead of building
- **Documentation drift** — Docs become stale, AI gets confused

**Result:** You either skip documentation (and pay later) or waste time maintaining it yourself.

---

## The Solution

Contextual is a documentation framework that **AI creates and maintains automatically**:

| You do | AI does |
|--------|---------|
| Describe what you want | Ask clarifying questions |
| Review and approve | Create architecture & feature docs |
| Make decisions | Update indexes, track dependencies |
| Build features | Keep everything in sync |

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

---

## Quick Start

### Option A: Repository Template

Best for new projects. Get the full structure with all files.

**1. Clone and initialize:**

```bash
git clone https://github.com/lmlody85/contextual.git my-project
cd my-project
rm -rf .git && git init
```

**2. Describe your project to AI:**

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

**3. Keep building:**

For each new feature, describe what you need. The AI handles documentation, indexes, and dependencies automatically.

**4. You stay in control:**

The AI asks before making big decisions:
- Which authentication approach? (OAuth, passwords, magic links)
- How should sharing work? (invite links, email, direct add)
- What permissions model? (view-only, edit, admin)

Your answers get documented in feature files for future reference.

### Option B: Claude Code Skill

Best for adding to existing projects with Claude Code.

```bash
cp -r .claude/skills/contextual ~/.claude/skills/
```

Then ask: "Set up Contextual docs" or "Validate documentation"

### Option C: Implementation Prompt

Best for existing projects with any AI tool. Includes before/after understanding test.

1. Copy [prompts/implement-contextual.md](prompts/implement-contextual.md)
2. Paste into AI session in your target repo
3. AI runs understanding test, implements framework, runs test again
4. Compare scores to measure effectiveness

See [tested results](#tested-results) for real-world improvement metrics.

---

## Documentation Structure

```
your-project/
├── AGENTS.md              # AI agent instructions (start here)
├── docs/
│   ├── features/          # Self-contained feature docs (FEAT-xxx.md)
│   ├── research/          # Reusable domain knowledge
│   └── architecture/      # System design, contracts, testing, ADRs
├── prompts/               # Reusable prompts for AI agents
└── .claude/               # Claude Code automation (optional)
```

Full structure details in [AGENTS.md](AGENTS.md).

### Architecture Docs (Optional)

| File | Purpose |
|------|---------|
| `contracts.md` | API patterns, data schemas, agent interfaces |
| `testing.md` | Test commands, patterns, coverage targets |

Create these when your project has established patterns worth documenting.

---

## Tested Results

Real-world implementation on a multi-agent AI project (7 features, ~50 source files):

| Metric | Before | After | Change |
|--------|--------|-------|--------|
| **Confidence** | 15/35 | 33/35 | +120% |
| **Completeness** | 15/35 | 34/35 | +127% |

**Where it helped most:**
- Architecture understanding: 2/5 → 5/5
- Dependency mapping: 1/5 → 4/5
- Bug fix confidence: 2/5 → 4/5

Test methodology: [prompts/implement-contextual.md](prompts/implement-contextual.md)

---

## Performance

### Token Efficiency

AI spends more time coding, less time reading:

| Task | Contextual | Single README | Wiki |
|------|------------|---------------|------|
| Add feature | ~2,000 tokens | 8,000+ | 5,000+ |
| Fix bug | ~1,900 tokens | 6,000+ | 4,000+ |
| Understand architecture | ~1,900 tokens | 5,000+ | 3,000+ |

*Contextual loads AGENTS.md (~1,700) + task-specific docs (~200-300)*

### Scalability

| Project Size | Status | Notes |
|-------------|--------|-------|
| **1-30 features** | Ideal | Current structure perfect |
| **30-60 features** | Excellent | Quick Find indexes scale well |
| **60-100 features** | Good | Consider subdirectories |
| **100+ features** | Fair | Hierarchical structure recommended |

System scales linearly—individual docs don't grow with feature count.

---

## AI Tool Support

Works with any AI coding assistant:

| Tool | Integration | Automation Level |
|------|-------------|------------------|
| **Claude Code** | Native via [CLAUDE.md](CLAUDE.md) + [Skill](.claude/skills/contextual/) | Full (hooks, skills, auto-validation) |
| **Cursor** | Via `.cursorrules` | Manual validation |
| **Copilot** | Via `.github/copilot-instructions.md` | Manual validation |
| **Others** | Via [AGENTS.md](AGENTS.md) | Manual validation |

---

## Who It's For

**Ideal:** Complex projects (10+ features), AI-assisted teams, long-term codebases.

**Skip if:** Simple scripts, throwaway prototypes, no AI tools.

---

## Get Started

1. [Clone the template](#option-a-repository-template) for new projects
2. [Install the skill](#option-b-claude-code-skill) for Claude Code
3. [Use the prompt](#option-c-implementation-prompt) for any AI tool

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

[GitHub](https://github.com/lmlody85/contextual) · [Issues](https://github.com/lmlody85/contextual/issues) · [Discussions](https://github.com/lmlody85/contextual/discussions)
