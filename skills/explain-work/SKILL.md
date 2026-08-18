---
name: explain-work
description: Teach me a shipped change from its spec and diff, write a note, then quiz me until I can explain it to the team.
disable-model-invocation: true
---

# Explain work

The user (or an agent) shipped a change they do not fully understand yet. Teach it from **evidence** — the spec and the diff, never memory of a chat — so they can explain it to a mixed team and learn something new. The durable deliverable is a **markdown note**. Chat is for settling inputs and the quiz, not the full write-up.

## 1. Settle the inputs

Collect these before any teaching. Infer from the workspace where obvious, then confirm; ask for whatever is left:

1. **REPOS** — git repo roots involved in the change (comma-separated)
2. **SPEC_PATH** — path to the spec, or "none — use the diff only". **Resolve the canonical spec first:** when the path has numbered siblings in its directory, or the file carries a REVERSAL / superseded / obsolete marker, work out which spec the diff actually implements and use that one. Numbered successors are the common case, not an edge case.
3. **BASE** — a fixed point: `origin/dev`, `main`, a tag, or a SHA. `HEAD` is not one — resolve it with `git rev-parse HEAD` and record the SHA. Uncommitted work is fine; it makes the note provisional.
4. **OPTIONAL** — PR URL, ticket paths, extra repos the spec names that are not open
5. **OUTPUT_PATH** — where to write the note. Infer a default, then confirm:
   - Spec exists → same directory as the spec, file `explain.md`
   - No spec → `<primary-repo>/.scratch/explain-work/<yyyy-mm-dd>-<slug>.md`
   - The user may override to any path, including a vault. Do not default to a vault.
   - One note, one path. When a second home comes up, write the note once and leave a one-line pointer at the other.

Done when all five have a confirmed value ("none" is a value for OPTIONAL / SPEC_PATH).

## 2. Read the evidence

1. Read SPEC_PATH if it exists. When you set a superseded sibling aside, name it once in the note so a reader following an old link is warned.
2. In each REPO run `git log BASE..HEAD --oneline` and `git diff BASE...HEAD`.
3. If the spec names a repo you cannot see, say so explicitly instead of guessing at its side.

Every claim traces to the spec or the diff. Where they disagree, surface it: the **diff is what landed, the spec is what we meant**. Use the names the spec and code already use. After each important idea in the note, add one **"Open this"** pointer — a file plus what to look for.

## 3. Write the note

Write **one** markdown file at OUTPUT_PATH. Do not dump the full note into chat.

Obsidian-friendly: YAML frontmatter; GitHub-flavored mermaid fences (```mermaid); ATX headings; no HTML, no Cursor-only widgets. Frontmatter fields: `type: explain`, `repos` (list), `spec` (canonical path or `none`), `base` (branch, tag, or SHA — never `HEAD`), `created` (ISO date), plus `provisional: true` when the diff is uncommitted.

Note sections, in this order:

1. **The problem** — plain English, why we bothered.
2. **Before vs after** — what existed, what this change added, what was deliberately out of scope.
3. **The flow** — the happy path in numbered steps a mixed room can follow.
4. **Visuals** (required) — mermaid, ≤15 nodes each, real actors and states, no file-path maps:
   - Happy-path sequence: trigger → done.
   - State diagram: statuses/phases this change touches, each transition's cause, the important rejects. If the change has no states, one line saying "none" and move on.
   - Repo handshake, only when two or more repos changed: who calls whom, sync vs async.
   Under each diagram: 2–3 plain-English bullets the user can say without reading the arrows aloud.
5. **Counterfactuals** (required) — the section that teaches. One entry per design choice a competent engineer would plausibly have made differently, in three parts:
   - **Naive** — the obvious design, one line.
   - **What breaks** — a numbered timeline with real actors and values, at least three steps, ending in the bad state.
   - **The guard** — what in the diff prevents it, named by file and symbol.
   Two entries minimum. When the change genuinely holds fewer, write the one and say plainly that the rest of the diff is unsurprising.
6. **Worked example** (required) — one named subject carried end to end with real values: a slug, an id, a job. Show every branch the change added being taken or skipped for that subject, and what the old code did with the same input. Toy data is fine; `<placeholder>` names are not.
7. **How the repos connect** — each repo's job, what it calls or is called by, what happens if it is not deployed. One repo changed → say that in one line.
8. **APIs added or changed** — every HTTP, RPC, or CLI entry point the diff added or changed. One bullet each: method + path (or command), and one sentence on what it is for. Include removed or behavior-changed entry points the same way. If the diff added none, write `none`.
9. **Details they will get asked about** — guards, failure modes, what is reversible and what is not. Short.
10. **Standup script** — 3–5 minutes, first person, spoken, for a mixed room.
11. **Slack / PR note** — one pasteable paragraph plus 4–8 bullets.
12. **Engineer appendix** — test seams, key types/statuses, deploy order. Do not re-list the APIs from section 8.
13. **Quiz** — 8–10 questions, no answers in this section. Mix: user-facing flow, a guard, a cross-repo fact, a risk, a new API's purpose, and one "what did we not build". At least three are **transfer** questions: a situation found in neither the note nor the diff, answerable only by applying a constraint from Counterfactuals.
14. **Quiz answers** — after a horizontal rule. First line: `Try the quiz in chat before reading this.` Then the answers, numbered to match, each citing its evidence.

Done when the file exists at OUTPUT_PATH, contains every section above, and every Counterfactual entry has all three parts.

## 4. Chat, then quiz

In chat, only:

1. Confirm the note path (one line).
2. Ask the same 8–10 quiz questions.
3. **Stop and wait.** Do not paste the answer key in chat.

After they answer: grade against the key. For each miss, re-teach from the evidence — the spec line or the code, not the note's summary of it — then ask a **fresh** question on the same idea. Repeat until it lands. Point them at the matching heading in the note.

## Done when

The note is on disk, the user has answered the quiz in their own words, every miss was re-taught from the evidence and then answered correctly on a second, different question, and they have named one thing they did not know before this task.

## Notes

- Reusable across any feature, repo, or company — nothing feature-specific belongs in this file.
- Skill body is English; the user may answer in any language.

## House adaptations

- House-original skill (not from mattpocock/skills). Teach a shipped change from its Spec + diff; write an Obsidian-friendly note; quiz in chat.
- Part of [josua-tsx/eng-skills](https://github.com/josua-tsx/eng-skills).
