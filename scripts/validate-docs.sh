#!/usr/bin/env bash
# Deterministic checks for the Contextual documentation structure.
#
# Usage: scripts/validate-docs.sh [project-root]
#
# Prints one line per check result:
#   OK    - check passed
#   ISSUE - must fix (exit code 1)
#   WARN  - should review (does not affect exit code)
#
# The script covers everything that is mechanical (files exist, links
# resolve, indexes are complete, dependencies are bidirectional). Judgment
# calls (is a feature in the right category, is a FEATURE-MAP entry
# accurate) are left to the reader of this output.

set -u
ROOT="${1:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
cd "$ROOT" || exit 2

issues=0
warns=0
ok() { echo "OK: $*"; }
issue() { echo "ISSUE: $*"; issues=$((issues + 1)); }
warn() { echo "WARN: $*"; warns=$((warns + 1)); }

feature_id() { basename "$1" | grep -oE '^(FEAT|API|INFRA)-[0-9]+'; }
feature_file() { ls docs/features/"$1"-*.md 2>/dev/null | head -n 1; }
# IDs mentioned on the first "**<Label>:**" line of a feature doc.
ids_on_line() { grep -m1 -E "^\*\*$2:\*\*" "$1" 2>/dev/null | grep -oE '(FEAT|API|INFRA)-[0-9]+' | sort -u; }

echo "== Structure"
for f in AGENTS.md docs/CURRENT.md docs/FEATURES.md docs/FEATURE-MAP.md docs/research/README.md docs/architecture/overview.md; do
  [ -f "$f" ] && ok "$f exists" || issue "$f is missing"
done
[ -d docs/features ] && ok "docs/features/ exists" || issue "docs/features/ is missing"

features=$(ls docs/features/FEAT-*.md docs/features/API-*.md docs/features/INFRA-*.md 2>/dev/null)

echo "== Feature index (docs/FEATURES.md)"
if [ -z "$features" ]; then
  ok "no feature docs yet"
else
  for f in $features; do
    b=$(basename "$f")
    grep -qF "features/$b" docs/FEATURES.md 2>/dev/null \
      && ok "$b is listed in FEATURES.md" \
      || issue "$b exists but is not listed in docs/FEATURES.md"
  done
fi
for link in $(grep -oE '\]\(features/[^)]+\.md\)' docs/FEATURES.md 2>/dev/null | sed -E 's/^\]\((.*)\)$/\1/'); do
  [ -f "docs/$link" ] || issue "docs/FEATURES.md links to docs/$link, which does not exist"
done

echo "== Feature dependencies"
for f in $features; do
  id=$(feature_id "$f")
  for dep in $(ids_on_line "$f" "Depends on"); do
    depfile=$(feature_file "$dep")
    if [ -z "$depfile" ]; then
      issue "$id depends on $dep, but no docs/features/$dep-*.md exists"
    elif ids_on_line "$depfile" "Dependents" | grep -qx "$id"; then
      ok "$id -> $dep is bidirectional"
    else
      issue "$id depends on $dep, but $(basename "$depfile") does not list $id under **Dependents:**"
    fi
  done
  for dependent in $(ids_on_line "$f" "Dependents"); do
    depfile=$(feature_file "$dependent")
    if [ -z "$depfile" ]; then
      issue "$id lists dependent $dependent, but no docs/features/$dependent-*.md exists"
    elif ! ids_on_line "$depfile" "Depends on" | grep -qx "$id"; then
      issue "$id lists dependent $dependent, but $(basename "$depfile") does not list $id under **Depends on:**"
    fi
  done
  if [ -n "$(ids_on_line "$f" "Depends on")$(ids_on_line "$f" "Dependents")" ] && [ -f docs/FEATURE-MAP.md ]; then
    # Ignore fenced code blocks so the format example in the template does not count as a mention.
    awk '/^```/{code=!code; next} !code' docs/FEATURE-MAP.md | grep -q "$id" \
      || warn "$id has dependencies but is not mentioned in docs/FEATURE-MAP.md"
  fi
done

echo "== Files Changed"
for f in $features; do
  id=$(feature_id "$f")
  # Lines like "- `path/to/file` - what changed" between "## Files Changed" and the next heading.
  for p in $(awk '/^## Files Changed/{on=1; next} /^## /{on=0} on' "$f" | grep -oE '^- `[^`*]+`' | sed -E 's/^- `(.*)`$/\1/'); do
    [ -e "$p" ] && ok "$id: $p exists" || issue "$id lists $p under Files Changed, but it does not exist"
  done
done

echo "== Research index (docs/research/README.md)"
for f in $(ls docs/research/*.md 2>/dev/null | grep -v '/README.md$'); do
  b=$(basename "$f")
  grep -qF "$b" docs/research/README.md 2>/dev/null \
    && ok "research/$b is indexed" \
    || issue "docs/research/$b exists but is not listed in docs/research/README.md"
done

echo "== Markdown links"
for f in AGENTS.md CLAUDE.md README.md $(find docs -name '*.md' 2>/dev/null); do
  [ -f "$f" ] || continue
  dir=$(dirname "$f")
  for target in $(grep -oE '\]\([^)#: ]+(#[^)]*)?\)' "$f" | sed -E 's/^\]\(([^)#]+).*\)$/\1/' | sort -u); do
    case "$target" in /*) path="${target#/}" ;; *) path="$dir/$target" ;; esac
    [ -e "$path" ] || issue "$f links to $target, which does not exist"
  done
done

echo "== Summary"
echo "issues=$issues warnings=$warns"
[ "$issues" -eq 0 ]
