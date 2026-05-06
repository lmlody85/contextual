# CI Validation Strategy

## Why Three Layers

Claude Code hooks only fire during active Claude sessions. Merges that happen in the terminal, GitHub UI, or by other developers are invisible to Claude. This doc describes a three-layer strategy that covers all cases.

---

## Layer 1: In-Session Hooks (Claude Code)

Configured in `.claude/settings.json`. Catches doc issues during active Claude sessions.

| Hook | Trigger | Action |
|------|---------|--------|
| SessionStart | Every session | Checks git log for drift from external changes |
| PostToolUse (Write/Edit) | File path matches FEAT-*.md or index docs | Suggests `/validate-docs` |
| PostToolUse (Bash) | Command starts with `gh pr (create\|merge)` or `git (merge\|pull)` | Suggests running docs-validator |

**Best for:** Active development work inside Claude Code.

---

## Layer 2: Session Start Drift Check

On every session start, the SessionStart hook runs `git log --oneline -5` and flags if recent commits may have caused doc drift.

**Best for:** Catching external changes made since the last session (terminal work, other developers).

**Limitation:** Only runs when a new Claude session starts — not in real time.

---

## Layer 3: GitHub Actions (`.github/workflows/docs-validation.yml`)

Runs on every pull request to `main`. Four checks in sequence:

1. **Required structure** — All framework files exist (AGENTS.md, CURRENT.md, FEATURES.md, etc.)
2. **Feature index consistency** — Every FEAT-*.md is in FEATURES.md and vice versa
3. **Internal links** — All markdown links in `docs/` resolve to real files
4. **Research index** — All research docs are listed in research/README.md

PRs fail if any check finds issues. This is the **only reliable way** to catch merges that happen entirely outside Claude.

**Best for:** Team environments, CI/CD pipelines, merges from GitHub UI or other developers.

---

## Coverage Map

| Scenario | Layer 1 (Hooks) | Layer 2 (SessionStart) | Layer 3 (CI) |
|----------|-----------------|------------------------|--------------|
| Feature work in Claude | ✅ | — | ✅ on PR |
| `git merge` via Claude | ✅ | — | ✅ on PR |
| `git merge` in terminal | ❌ | ✅ next session | ✅ on PR |
| Merge from GitHub UI | ❌ | ✅ next session | ✅ on PR |
| Another developer's PR | ❌ | ✅ next session | ✅ on PR |

---

## Customizing the Workflow

The workflow at `.github/workflows/docs-validation.yml` is a starting point. Common customizations:

**Add dependency checking:**
```bash
# After feature index check, verify bidirectional deps
for feat in $FEAT_FILES; do
  # Extract "Depends on:" entries and verify reverse links
done
```

**Post results as PR comment** (requires `pull-requests: write` permission):
```yaml
- uses: actions/github-script@v7
  if: failure()
  with:
    script: |
      github.rest.issues.createComment({
        issue_number: context.issue.number,
        owner: context.repo.owner,
        repo: context.repo.repo,
        body: '❌ Documentation validation failed. Run `validate docs` in Claude Code to see details.'
      })
```

**Only run when docs changed:**
```yaml
on:
  pull_request:
    branches: [main]
    paths:
      - 'docs/**'
      - 'AGENTS.md'
      - '**.md'
```
