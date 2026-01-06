# Contextual

> An AI-native documentation framework

Structured docs that stay current—so AI spends time coding, not re-reading your codebase.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

**+127% context confidence.** 5 doc files vs. 50+ source files. Tested on a real multi-agent project.

---

## The Problem

AI-assisted development creates context chaos:

- **Context loss** — AI forgets between sessions, repeats the same mistakes
- **Messy artifacts** — Docs pile up without structure, AI can't find what it needs
- **Constant re-reading** — AI scans the whole codebase to understand one feature
- **Lost decisions** — Why was this built this way? Nobody remembers

**Result:** As your project grows, AI gets slower and less reliable.

---

## The Solution

Contextual gives AI **structured context that scales with your project**:

- **Self-contained docs** — Each feature in one file, AI loads only what it needs
- **Always current** — AI updates docs as it builds, no manual maintenance
- **Dependency tracking** — AI knows what connects to what, avoids breaking changes
- **Decision history** — Implementation notes preserve the "why" forever

AI creates and maintains everything. You review and approve.

---

## How It Works

### One Feature, One File

**Context benefit:** AI loads only what it needs—no circular dependencies, no context pollution.

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

### Shared Knowledge Library

**Context benefit:** Domain knowledge stays DRY—update once, referenced everywhere.

```
docs/research/
├── oauth-best-practices.md    → Referenced by FEAT-001, FEAT-003
├── caching-strategies.md      → Referenced by FEAT-012, FEAT-015
└── api-design-principles.md   → Referenced by all API features
```

### Dependency Graph

**Context benefit:** AI understands impact before making changes—sees what breaks if it modifies a feature.

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

For each new feature, describe what you need. AI maintains context automatically—docs, indexes, and dependencies stay in sync.

**4. Context grows with you:**

Every decision gets captured. Next session, AI picks up exactly where you left off—no re-explaining, no repeated mistakes.

### Option B: Claude Code Skill

Best for adding to existing projects with Claude Code.

```bash
git clone https://github.com/lmlody85/contextual.git
cp -r contextual/.claude/skills/contextual ~/.claude/skills/
```

Then in your project, ask: "Set up Contextual docs" or "Validate documentation"

### Option C: Implementation Prompt

Best for existing projects with any AI tool. Includes before/after understanding test.

1. Copy [prompts/implement-contextual.md](prompts/implement-contextual.md)
2. Paste into AI session in your target repo
3. AI runs understanding test, implements framework, runs test again
4. Compare scores to measure effectiveness

See [tested results](#tested-results) for real-world improvement metrics.

---

## Context Structure

```
your-project/
├── AGENTS.md              # AI agent instructions (start here)
├── docs/
│   ├── features/          # Self-contained feature docs (FEAT-xxx.md)
│   ├── research/          # Reusable domain knowledge
│   └── architecture/
│       ├── overview.md    # System design
│       ├── contracts.md   # API patterns, data schemas (optional)
│       └── testing.md     # Test strategy, commands (optional)
├── prompts/               # Reusable prompts for AI agents
└── .claude/               # Claude Code automation (optional)
```

Full structure details in [AGENTS.md](AGENTS.md).

---

## Tested Results

Real-world implementation on a multi-agent AI project (7 features, ~50 source files):

| Metric | Before | After | Change |
|--------|--------|-------|--------|
| **Context confidence** | 15/35 | 34/35 | +127% |
| **Context completeness** | 15/35 | 34/35 | +127% |

**Biggest context gains:**
- Architecture understanding: 2/5 → 5/5
- Dependency mapping: 1/5 → 5/5
- Bug fix confidence: 2/5 → 5/5

Test methodology: [prompts/implement-contextual.md](prompts/implement-contextual.md)

---

## Performance

### Context Efficiency

AI spends time coding, not re-reading:

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
