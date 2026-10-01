#!/usr/bin/env bash
# Static contract for /learn-go (spec #2). Does not parse skill headings.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
VAULT="${GO_LEARN_VAULT:-$HOME/Developer/projects/personal/go-learn}"

fail() {
	echo "FAIL: $*" >&2
	exit 1
}

skill="$ROOT/skills/learn-go/SKILL.md"
cmd="$ROOT/commands/learn-go.md"
policy="$ROOT/skills/learn-go/agents/openai.yaml"

[[ -f "$skill" ]] || fail "missing skill file"
grep -q '^disable-model-invocation: true' "$skill" || fail "skill must be user-invoked"
grep -q 'learn-go' "$cmd" || fail "command shim must name learn-go"
[[ -f "$policy" ]] || fail "missing openai.yaml"
grep -q 'allow_implicit_invocation: false' "$policy" || fail "implicit invocation must be false"

for f in README.md USAGE.md skills/ask-eng/SKILL.md UPSTREAM.md; do
	grep -q 'learn-go' "$ROOT/$f" || fail "$f must list learn-go"
done

grep -q 'devops-lab' "$skill" || fail "skill must name the CRM lab"
grep -q 'go-learn' "$skill" || fail "skill must name the standalone vault"

for f in ROADMAP.md progress.md SOURCES.md FIELD-GUIDE.md PRODUCTION-CHECKLIST.md sessions/_template.md labs.md; do
	[[ -f "$VAULT/$f" ]] || fail "vault missing $f"
done

echo "OK pack=$ROOT vault=$VAULT"
