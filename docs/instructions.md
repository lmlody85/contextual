# Instructions for AI Agents

## Documentation Structure

This project uses a simplified documentation system optimized for MVPs and internal tools.

### Core Documentation Files

**Always check these first:**
- `/docs/CURRENT.md` - What we're actively working on
- `/docs/FEATURES.md` - Simple list of all features
- `/docs/architecture/overview.md` - System architecture
- `/docs/guides/setup.md` - Setup and common tasks

**Feature documentation:**
- `/docs/features/FEAT-xxx.md` - Individual feature details
- Each feature has ONE file with complete context

**Domain knowledge:**
- `/docs/research/` - Research findings, algorithms, design principles
- See `/docs/research/README.md` for index of all research docs

### When Working on Features

1. **Before starting work:**
   - Read `/docs/CURRENT.md` to understand context
   - Find the relevant `FEAT-xxx.md` file
   - Check if related research exists in `/docs/research/`
   - Read `/docs/architecture/overview.md` if needed

2. **While implementing:**
   - Follow patterns in `FEAT-xxx.md` implementation notes
   - Apply principles from relevant research docs
   - Check "Files Changed" section for related code
   - Reference "Known Issues" for gotchas

3. **After making changes:**
   - Update the `FEAT-xxx.md` with implementation details
   - Update `/docs/CURRENT.md` with progress
   - Add to "Known Issues" if you found bugs
   - Update research docs if you discovered new findings

### Feature Documentation Format

Each `FEAT-xxx.md` contains:
- **What**: Feature description
- **Why**: Problem it solves
- **How**: Technical implementation
- **Research References**: Links to relevant research docs
- **Files Changed**: List of modified files
- **Known Issues & Resolutions**: Bugs and fixes
- **TODO**: Remaining work

### Research & Domain Knowledge

**Location:** `/docs/research/`

Contains foundational research, algorithms, design principles, and domain expertise that inform implementation decisions.

**Types of research docs:**
- **Algorithm research:** Technical approaches, comparisons, benchmarks
- **Design principles:** UX/UI guidelines, patterns, anti-patterns
- **Domain expertise:** Industry knowledge, standards, best practices
- **User research:** Behavior findings, usability studies
- **Technical standards:** Coding standards, API design, security approaches

**When to reference research:**
1. Before implementing features in the same domain
2. When making algorithmic or design decisions
3. When debugging domain-specific issues
4. When optimizing performance (check benchmarks)
5. Understanding "why we do it this way"

**In feature docs, always link to research:**
```markdown
## Technical Approach

Uses [algorithm name] for [purpose].
**See:** [Research Doc Name](../research/doc-name.md) for detailed approach and rationale.

**Key principles applied:**
- Principle 1 (Section X.X of research doc)
- Principle 2 (Section Y.Y of research doc)
```

**Update research docs when:**
- New findings emerge from implementation
- Algorithms or approaches change
- Edge cases are discovered and resolved
- Benchmarks are updated
- External research informs product decisions

### Code Organization
```
/src
  /api          # Express routes
  /services     # Business logic
  /models       # DB models (Prisma)
  /middleware   # Auth, validation
  /utils        # Helpers
```

### Conventions

**Naming:**
- Feature IDs: `FEAT-###`, `API-###`, `INFRA-###`
- Files: `kebab-case.ts`
- Classes: `PascalCase`
- Functions: `camelCase`

**Git:**
- Branch: `feat/FEAT-xxx-description` or `bug/FEAT-xxx-fix`
- Commits: `FEAT-xxx: Description of change`

**Testing:**
- Unit tests next to code: `file.test.ts`
- Run: `npm test`

### Common Tasks

**Adding a feature:**
1. Check `/docs/research/` for relevant domain knowledge
2. Create `/docs/features/FEAT-xxx.md`
3. Add to `/docs/FEATURES.md`
4. Update `/docs/CURRENT.md`
5. Implement following structure in `FEAT-xxx.md`
6. Link to relevant research docs in feature doc
7. Write tests
8. Update docs with implementation notes

**Fixing a bug:**
1. Find relevant `FEAT-xxx.md`
2. Add to "Known Issues & Resolutions" section
3. Implement fix
4. Document resolution and prevention
5. Update research docs if bug reveals new insights

**Adding research/domain knowledge:**
1. Create `/docs/research/{topic-name}.md`
2. Use research doc template (see existing research docs)
3. Update `/docs/research/README.md` index
4. Link from relevant `FEAT-xxx.md` files

**Database changes:**
```bash
# Edit schema.prisma
npm run db:migrate:create
npm run db:migrate
```

### Important Patterns

**Multi-tenant data:**
All queries must include workspace/team scoping.

**Authentication:**
JWT tokens, middleware in `/src/middleware/auth.ts`

**Error handling:**
Use standardized error classes in `/src/utils/errors.ts`

### When in Doubt

1. **Check if feature exists:** Read `/docs/FEATURES.md`
2. **Check domain knowledge:** Read `/docs/research/README.md` for relevant research
3. **Check how to do something:** Read `/docs/guides/setup.md`
4. **Check how system works:** Read `/docs/architecture/overview.md`
5. **Check feature details:** Read relevant `/docs/features/FEAT-xxx.md`
6. **Check why we do it this way:** Read relevant `/docs/research/{topic}.md`
