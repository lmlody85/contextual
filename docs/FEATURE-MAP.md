# Feature Map

This document visualizes relationships between features to help understand system architecture and change impact.

---

## Purpose

**Use this map to:**
- Understand how features connect and depend on each other
- Assess impact before making changes (changing FEAT-X affects which features?)
- Navigate to related features quickly
- Identify critical path features that many others depend on

---

## When to Update This Map

**Add a feature when:**
- It has ANY dependencies (depends on OR is depended upon)
- It's part of a feature flow (e.g., login -> session -> profile)
- Changing it would affect other features

**Don't add when:**
- Feature is completely standalone with no dependencies
- No other features interact with it

**Format rules:**
- `A -> B` means "A depends on B" (A uses B)
- `A <- B` means "B depends on A" (B uses A)
- `A <-> B` means bidirectional dependency
- Group by functional cluster first, then show cross-cluster dependencies

---

## Feature Relationships

*As features are added, document their relationships here using the format below*

### Example: Authentication Flow
```
FEAT-001 (User Login)
  ↓ provides tokens to
FEAT-002 (Session Management)
  ↓ provides session data to
FEAT-015 (User Profile)
  ↓ feeds data to
FEAT-022 (Settings Dashboard)
```

### Example: Payment Processing
```
FEAT-034 (Shopping Cart)
  ↓ sends order to
FEAT-041 (Checkout)
  ↓ calls
API-012 (Stripe Integration)
  ↓ triggers
FEAT-045 (Order Confirmation)
```

---

## Feature Clusters

Group related features by functional area:

### User Management
*Add features here as they're created*
- FEAT-XXX → FEAT-YYY → FEAT-ZZZ

### Data Processing
*Add features here as they're created*
- FEAT-XXX → FEAT-YYY

### API & Integrations
*Add features here as they're created*
- API-XXX → API-YYY

### Infrastructure
*Add features here as they're created*
- INFRA-XXX → INFRA-YYY

---

## Critical Dependencies

**Core features that many others depend on:**
*Document high-impact features here as system grows*

- **FEAT-XXX (Feature Name)**: Used by FEAT-A, FEAT-B, FEAT-C, API-D
  - **Impact**: Changes here affect 4+ features
  - **Test carefully**: Requires integration testing across multiple features

---

## Isolated Features

**Features with no dependencies** (safe to modify):
*List standalone features here*

- FEAT-XXX - No dependencies
- FEAT-YYY - Completely isolated

---

## How to Update This Map

**When creating a new feature:**
1. Add it to the relevant "Feature Cluster"
2. Show dependencies using arrows (→)
3. Update "Critical Dependencies" if many features depend on it
4. Add to "Isolated Features" if it has no dependencies

**When modifying a feature:**
1. Check this map to see what features depend on it
2. Review those feature docs for potential impact
3. Update the map if relationships change

**Format for showing relationships:**
```
FeatureA → FeatureB          (A depends on B)
FeatureA ← FeatureB          (B depends on A)
FeatureA ↔ FeatureB          (bidirectional dependency)
FeatureA ⤏ FeatureB         (A indirectly affects B)
```

---

## Tips for Complex Systems

**Reducing complexity:**
- If too many features depend on one feature, consider breaking it apart
- Circular dependencies (A→B→C→A) indicate design issues
- Long chains (A→B→C→D→E) make changes risky

**Visualizing relationships:**
- Use indentation to show dependency depth
- Group by functional area first, then show cross-area dependencies
- Mark optional vs required dependencies

**Example of complex relationship:**
```
Core Auth System
├─ FEAT-001 (Login) [REQUIRED by 12 features]
│   ├─ Used by → FEAT-015, FEAT-022, FEAT-034
│   └─ Optional for → FEAT-018 (Guest Mode)
└─ FEAT-002 (Session) [REQUIRED by 8 features]
    └─ Used by → FEAT-015, FEAT-022, FEAT-045
```
