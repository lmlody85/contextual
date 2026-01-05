# Features

This document provides an index of all features in the project.

## Finding Features

**By keyword:** Use Grep to search feature files:
```bash
grep -r "authentication" docs/features/
grep -r "payment" docs/features/
```

**By topic:** Common feature groupings:
- **Authentication**: *Add FEAT-xxx links as they're created*
- **Payment/Billing**: *Add FEAT-xxx links as they're created*
- **User Management**: *Add FEAT-xxx links as they're created*
- **Data Processing**: *Add FEAT-xxx links as they're created*

**By dependency:** See [FEATURE-MAP.md](FEATURE-MAP.md) for feature relationships

---

## Feature Categories

### Reference
- **[FEAT-000](features/FEAT-000-example.md)** - Example feature (delete when creating first real feature)

### Core Features
*No features yet - delete FEAT-000 and add your first feature here*

### API Features
*No features yet*

### Infrastructure
*No features yet*

---

## Feature Template

When adding a new feature:
1. Create a new file: `docs/features/FEAT-###-short-name.md`
2. Add entry below with link
3. Update CURRENT.md if actively working on it

### Example Entry
```markdown
### Core Features
- **[FEAT-001](features/FEAT-001-example.md)** - Brief description
```

---

## Naming Convention

- `FEAT-###` - User-facing features
- `API-###` - API endpoints or integrations
- `INFRA-###` - Infrastructure or tooling features

Use three-digit numbers (001, 002, etc.) and increment sequentially within each category.
