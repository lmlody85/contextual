# Testing Strategy

How to test this codebase.

> **Template:** Delete unused sections. Keep only what applies to your project.

---

## Quick Reference

| Test Type | Command | Location |
|-----------|---------|----------|
| Unit | `*command*` | `*path*` |
| Integration | `*command*` | `*path*` |
| E2E | `*command*` | `*path*` |

---

## Test Structure

```
tests/
├── unit/           # Isolated function tests
├── integration/    # Module interaction tests
└── e2e/            # Full flow tests
```

---

## Writing Tests

### Unit Tests

**When:** Test pure functions, utilities, transformations

**Pattern:**
```
*Show your test pattern/convention*
```

### Integration Tests

**When:** Test module boundaries, API endpoints, data flows

**Pattern:**
```
*Show your integration test pattern*
```

### E2E Tests

**When:** Test complete user flows

**Pattern:**
```
*Show your e2e pattern*
```

---

## Mocking

### External Services

*How to mock external APIs*

### Database/Storage

*How to mock data layer*

---

## Coverage

**Target:** *X%*
**Check:** `*coverage command*`

**Critical paths (must have tests):**
- *Path 1*
- *Path 2*

---

## CI/CD

**Runs on:** *When tests run (PR, push, etc.)*
**Config:** `*path to CI config*`
