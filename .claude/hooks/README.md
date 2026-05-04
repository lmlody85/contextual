# Hooks — Design Rationale

> **Hooks are configured in `.claude/settings.json`. The actual logic lives in `scripts/`.**
> This file documents the design thinking behind each hook.

## Architecture

PostToolUse hooks use command-type with shell scripts that pre-filter via `$TOOL_INPUT` JSON on stdin. The scripts exit silently when conditions don't match.

| Hook | Script | Filter |
|------|--------|--------|
| Post-feature reminder | `scripts/post-feature-reminder.sh` | File path matches `docs/features/FEAT-*.md`, `FEATURES.md`, `FEATURE-MAP.md`, `CURRENT.md`, or `research/*.md` |
| PR/merge validator | `scripts/pr-merge-validator.sh` | Command starts with `gh pr (create\|merge)` or `git (merge\|pull)` |

The SessionStart hook stays prompt-type — it fires once per session and is non-disruptive by design.

---

## Why These Hooks Exist

The Contextual framework relies on documentation staying in sync with code. Without automation, this falls apart — the AI forgets to remind, the user forgets to validate. These hooks make consistency a background process rather than a manual checklist.

---

## Hook 1: Post-Feature Reminder (PostToolUse on Write/Edit)

**Detects:**
- New `docs/features/FEAT-*.md` file created
- TODO section changed to "Feature complete"
- 2+ documentation files modified in one turn

**Why:** Feature completion is the highest-risk moment for doc drift. This is the natural checkpoint — docs are fresh in context, the work is done, validation is cheap.

**Design choice — ask, don't auto-run:** Validation is lightweight but adds noise if triggered constantly. Asking gives the user control while ensuring the option is surfaced.

---

## Hook 2: PR/Merge Validation (PostToolUse on Bash)

**Detects:** `gh pr create`, `gh pr merge`, `git merge`, `git pull`

**Why:** Merges are the highest-risk moment for cross-feature doc drift. Dependencies shift, files move, indexes go stale. Running validation at merge time catches issues before they compound.

**Design choice — PR creation over branch merge:** PR creation is a deliberate, in-session action. Branch merges often happen outside Claude Code (terminal, GitHub UI), making them unreliable as triggers. PR creation is the most reliable in-session signal.

**Limitation:** Only catches merges that happen inside Claude Code sessions. For fully external merges, see `.github/workflows/docs-validation.yml`.

---

## Hook 3: Session Drift Detection (SessionStart)

**Detects:** Recent git commits that touched source files without corresponding doc updates

**Why:** External changes (other developers, out-of-session terminal work) can cause silent drift. Flagging this at session start, before any new work begins, prevents compounding drift.

**Design choice — lightweight check only:** Full validation on every session start would be noisy. `git log` is fast; prompting the user to validate if drift is suspected keeps the signal-to-noise ratio high.
