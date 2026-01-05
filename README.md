# Contextual

> An AI-native documentation framework with structured context management

**Describe what you want to build. AI creates the architecture, features, and documentation—asking clarifying questions along the way. You stay in control while AI handles the paperwork.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

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

Contextual teaches AI to **create and maintain documentation automatically**:

- **AI asks first** — Clarifies requirements before building
- **AI documents as it builds** — Architecture, features, decisions captured automatically
- **AI maintains consistency** — Updates indexes, validates links, tracks dependencies
- **You stay in control** — Review and approve, but don't write boilerplate
- **Minimal context overhead** — AI navigates your codebase quickly, spends time coding

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
| `decisions/` | Architecture Decision Records (ADRs) |

Create these when your project has established patterns worth documenting.

---

## Tested Results

Real-world implementation on a multi-agent AI project (7 features, ~50 source files):

| Metric | Before | After | Change |
|--------|--------|-------|--------|
| **Confidence** | 15/35 | 33/35 | +120% |
| **Completeness** | 15/35 | 34/35 | +127% |

> "Reading 5 doc files (~15 min) gave me 94% confidence vs. exploring 50+ source files (estimated 2-3 hours)"

**Key improvements:**
- Architecture: 2/5 → 5/5 (visual diagrams + rationale)
- Dependencies: 1/5 → 4/5 (explicit, bidirectional)
- Bug fix confidence: 2/5 → 4/5 ("Known Issues" history)

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

## Use Cases

**Best for:**
- Complex software projects with 10+ features
- AI-assisted development with Claude, Cursor, Copilot
- Team projects where documentation must stay synchronized
- Long-term projects where documentation drift is a problem

**Not designed for:**
- Single-file scripts or simple utilities
- Throwaway prototypes
- Projects without AI assistance

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

[Report an issue](https://github.com/lmlody85/contextual/issues) · [View on GitHub](https://github.com/lmlody85/contextual)
