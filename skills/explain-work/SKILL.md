---
name: explain-work
description: Teach me a shipped change from its spec and diff, then quiz me until I can explain it to the team.
disable-model-invocation: true
---

# Explain work

The user (or an agent) shipped a change they do not fully understand yet. Teach it to them from **evidence** — the spec and the diff, never memory of a chat — so they can explain it to a mixed team (engineers, ops, product) and learn something new from the task. The deliverable is their understanding; the documents are props for it.

## 1. Settle the inputs

Collect these before any teaching. Infer from the workspace where obvious (open repos, `.scratch/*/spec.md`, current branch), then confirm; ask for whatever is left:

1. **REPOS** — git repo roots involved in the change (comma-separated)
2. **SPEC_PATH** — path to the spec, or "none — use the diff only"
3. **BASE_BRANCH** — the fixed point, e.g. `origin/dev` or `main`
4. **OPTIONAL** — PR URL, ticket paths, extra repos the spec names that are not open

Done when all four have a confirmed value ("none" is a value).

## 2. Read the evidence

1. Read SPEC_PATH if it exists.
2. In each REPO run `git log BASE_BRANCH..HEAD --oneline` and `git diff BASE_BRANCH...HEAD`.
3. If the spec names a repo you cannot see, say so explicitly instead of guessing at its side.

Every claim you teach traces to the spec or the diff. Where they disagree, surface it: the **diff is what landed, the spec is what we meant**. Use the names the spec and code already use (statuses, endpoints, repo names). After each important idea, add one **"Open this"** pointer — a file plus what to look for — so the user learns from the code, not only from your prose.

## 3. Produce, in this order

1. **The problem** — plain English, why we bothered.
2. **Before vs after** — what existed, what this change added, what was deliberately out of scope.
3. **The flow** — the happy path in numbered steps a mixed room can follow.
4. **Visuals** (required) — mermaid, ≤15 nodes each, drawn from the change's real actors and states rather than file paths:
   - Happy-path sequence: trigger → done.
   - State diagram: statuses/phases this change touches, each transition's cause, the important rejects. If the change has no states, one line saying "none" and move on.
   - Repo handshake, only when two or more repos changed: who calls whom, sync vs async.
   Under each diagram: 2–3 plain-English bullets the user can say without reading the arrows aloud.
5. **How the repos connect** — each repo's job, what it calls or is called by, what happens if it is not deployed. One repo changed → say that in one line.
6. **Details they will get asked about** — guards, failure modes, what is reversible and what is not. Short.
7. **Standup script** — 3–5 minutes, first person, spoken, for a mixed room. File paths only where someone will ask.
8. **Slack / PR note** — one pasteable paragraph plus 4–8 bullets. Same facts as the standup, tighter.
9. **Engineer appendix** — endpoints or entry points, test seams, key types/statuses, deploy order. The only section that goes deep into implementation.
10. **What to learn from this task** — 2–4 concepts that are new or easy to miss (a pattern, a precondition, a cross-repo contract). For each: one sentence on why it matters and one file to open. Mandatory — a change with nothing worth learning means you have not looked hard enough.

## 4. Quiz

Ask 8–10 questions the user must answer without looking: the user-facing flow, a guard, a cross-repo fact, a risk, and one "what did we not build". Ask them, then **stop and wait** — the answer key stays with you until they answer. Grade their answers, correct the misses, and walk any missed part again from the code.

## Done when

The user has answered the quiz in their own words and named one thing they did not know before this task. Missed questions were re-taught from the evidence, not just answered.

## Notes

- Reusable across any feature, repo, or company — nothing feature-specific belongs in this file.
- Skill body is English; the user may answer in any language.

## House adaptations

- House-original skill (not from mattpocock/skills). Teach a shipped change from its Spec + diff, then quiz until the user can explain it.
- Part of [josua-tsx/eng-skills](https://github.com/josua-tsx/eng-skills).
