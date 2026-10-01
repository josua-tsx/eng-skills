#!/usr/bin/env bash
# Static contract for /learn-system-design. Does not parse skill headings.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
VAULT="${SYSTEM_DESIGN_LEARN_VAULT:-$HOME/Developer/projects/personal/system-design-learn}"

fail() {
	echo "FAIL: $*" >&2
	exit 1
}

skill="$ROOT/skills/learn-system-design/SKILL.md"
cmd="$ROOT/commands/learn-system-design.md"
policy="$ROOT/skills/learn-system-design/agents/openai.yaml"

[[ -f "$skill" ]] || fail "missing skill file"
grep -q '^disable-model-invocation: true' "$skill" || fail "skill must be user-invoked"
grep -q 'learn-system-design' "$cmd" || fail "command shim must name learn-system-design"
[[ -f "$policy" ]] || fail "missing openai.yaml"
grep -q 'allow_implicit_invocation: false' "$policy" || fail "implicit invocation must be false"

for f in README.md USAGE.md skills/ask-eng/SKILL.md UPSTREAM.md; do
	grep -q 'learn-system-design' "$ROOT/$f" || fail "$f must list learn-system-design"
done

grep -q 'system-design-learn' "$skill" || fail "skill must name the standalone vault"
grep -q 'There is no required CRM lab' "$skill" || fail "skill must not require the CRM lab"

for f in ROADMAP.md progress.md SOURCES.md FIELD-GUIDE.md DESIGN-CHECKLIST.md sessions/_template.md assessments/00-initial-diagnostic.md case-studies/README.md experiments/README.md; do
	[[ -f "$VAULT/$f" ]] || fail "vault missing $f"
done

echo "OK pack=$ROOT vault=$VAULT"
