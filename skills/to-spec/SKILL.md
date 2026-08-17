---
name: to-spec
description: Turn the current conversation into a spec and publish it to the project issue tracker — no interview, just synthesis of what you've already discussed.
disable-model-invocation: true
---

This skill takes the current conversation context and codebase understanding and produces a spec. Do NOT interview the user — just synthesize what you already know.

The issue tracker and triage label vocabulary should have been provided to you — run `/setup-eng-skills` if not.

## Process

1. Explore the repo to understand the current state of the codebase, if you haven't already. Use the project's domain glossary vocabulary throughout the spec, and respect any ADRs in the area you're touching.

2. Sketch out the seams at which you're going to test the feature. Existing seams should be preferred to new ones. Use the highest seam possible. If new seams are needed, propose them at the highest point you can. The fewer seams across the codebase, the better - the ideal number is one.

Check with the user that these seams match their expectations.

3. Write the spec using the template below, then publish it. With an issue tracker configured, publish there and apply the `ready-for-agent` triage label - no need for additional triage. Without one, write it to `.scratch/<feature>/<spec-name>.md` alongside any existing `spec.md` for that feature, and carry the same value as a `status:` field in the frontmatter.

4. Check your own draft before publishing:

- Frontmatter present, with every repo the change touches listed in `repos`.
- No `Status:` prose line — status lives on the triage label, or on the frontmatter `status:` field where there is no tracker.
- `## Visuals` present with both numbered subheadings, `none` as the body where a diagram does not apply.
- No line ends mid-phrase (see the line-break rule below).
- No user story whose truth follows from another's, and none that a single test would satisfy alongside its neighbour.
- Further Notes carries nothing already said above — read it against the earlier sections and delete every bullet whose point is already made there.
- List, to yourself, the external facts the spec leans on — a third-party behaviour, a quota, a timing window, a capability you did not read in this repo. Each one either states how you know it or carries `ASSUMPTION:`. Any fact that has neither is the bug this check exists to catch.

Where a sibling spec already exists in the same folder or tracker, this template wins. Do not mirror an older spec's formatting just because it is adjacent — earlier specs predate these rules.

## Writing rules

These apply to every section of the template.

**Frontmatter is required.**
List every repo the change touches in `repos`, not just the one you are sitting in — an agent opening the spec in a sibling repo has no other way to tell it applies there.
It renders as two horizontal rules on a GitHub or GitLab tracker; emit it anyway, since agents read it far more often than humans look at it.

**Mark what you inferred.**
This skill synthesises without interviewing, so gaps get filled by inference.
Prefix any claim not established in the conversation or verified against code with `ASSUMPTION:`, and give anything you did verify a one-clause how-we-know ("read off the deploy config").
A labelled inference can be checked in seconds; an unlabelled one gets laundered into a requirement.

**Each fact belongs to exactly one section.**
Problem Statement and Solution own the narrative, User Stories own the acceptance contract, Implementation Decisions own the how, Testing Decisions own the seams.
Argue a point once, in the section that owns it, and let the other sections rely on it.
A fact restated in three sections reads as three requirements and gets implemented as three.

**One sentence per line.**
Break at meaning, never at a column width: every line ends at a sentence boundary, or at a clause boundary marked by `;`, `—`, or a conjunction.
Do NOT reflow prose to fit 80 or 100 characters — a 250-character sentence stays on one 250-character line, however ragged that looks in the editor.
This keeps a one-word edit to a one-line diff while the spec is being cleared by hand; hard wrapping gives you the wide diff anyway and reads worse than a plain paragraph.
Applies to Problem Statement, Solution, Implementation Decisions, Testing Decisions, Out of Scope, and Further Notes.

<spec-template>

---
repos: [<every repo this spec governs>]
base: origin/dev
created: YYYY-MM-DD
status: <ready-for-agent — only when there is no issue tracker to carry the triage label>
---

## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## Visuals

Mermaid of behaviour — the actors and states the user would recognise, ≤15 nodes each. Under each diagram: 2–3 plain-English bullets.

Always emit this heading and both numbered subheadings, even when neither diagram applies — put the literal word `none` as the body. A skipped section is invisible; a section containing `none` is a decision someone can disagree with.

1. **Happy-path sequence** — trigger → done. Draw it when two or more actors take part, or the path has a step someone could get wrong; otherwise write `none`.
2. **State diagram** — statuses or phases this change introduces, each transition's cause, the important rejects. Draw every legal transition, including retries and returns to an earlier state, since prose can list statuses while silently omitting an edge. No statuses → write `none`.

## User Stories

A numbered list of user stories. Each user story should be in the format of:

1. As an <actor>, I want a <feature>, so that <benefit>

<user-story-example>
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending
</user-story-example>

One story per behaviour a reviewer could accept or reject on its own. Collapse two stories into one when a single test would satisfy both, or when doing one makes the other true — in that second case keep the outcome as the story and let the ordered mechanism live in Implementation Decisions. Keep the actor who owns the behaviour rather than restating it under every actor who benefits. Cover every branch, including the rejects and the failure paths.

## Implementation Decisions

A list of implementation decisions that were made. This can include:

- The modules that will be built/modified
- The interfaces of those modules that will be modified
- Technical clarifications from the developer
- Architectural decisions
- Schema changes
- Specific interactions

If an API, RPC, or CLI entry point was actually decided, list it as its own bullet: method + path (or command) + one sentence on what it is for. Do not bury it inside another decision. If none were decided, omit them.

Do NOT include specific file paths or code snippets. They may end up being outdated very quickly.

Exception: if a prototype produced a snippet that encodes a decision more precisely than prose can (state machine, reducer, schema, type shape), inline it within the relevant decision and note briefly that it came from a prototype. Trim to the decision-rich parts — not a working demo, just the important bits.

## Testing Decisions

A list of testing decisions that were made. Include:

- A description of what makes a good test (only test external behavior, not implementation details)
- Which modules will be tested
- Prior art for the tests (i.e. similar types of tests in the codebase)

## Out of Scope

A description of the things that are out of scope for this spec.

## Further Notes

Context that has no home in the sections above and would otherwise be lost: alternatives considered and why they were rejected, sequencing between workstreams, constraints discovered along the way, lessons worth carrying. Every bullet here is a fact that appears nowhere else in the spec.

</spec-template>

## House adaptations

- Spec stays the requirements artifact. **Cursor Plan** (product) may hold file-level how afterward — Plan is not a second Spec.
- Decided APIs are scannable bullets under Implementation Decisions (not a required catalog; not invented to look complete).
- Spec includes behavior mermaid (happy path + states), always emitted even when `none`. `explain-work` later draws what the diff actually landed.
- YAML frontmatter (`repos`, `base`, `created`) instead of a prose status line, matching the shape `explain-work` uses.
- Inferred facts carry `ASSUMPTION:`, verified ones a how-we-know clause — the skill never interviews, so the reader needs to know which claims were checked.
- Semantic line breaks, so the spec stays hand-editable while it is being cleared. A step-4 self-check gates all of the above.
- User stories are bounded by behaviour coverage, and each fact is argued in exactly one section. Upstream asks for a LONG, extremely extensive list, which buys near-duplicate stories wearing different actor hats and the same point restated across three sections.
- Publishing has a no-tracker fallback (`.scratch/<feature>/`, `status:` in frontmatter), since not every repo here has a tracker wired up.
- Part of [josua-tsx/eng-skills](https://github.com/josua-tsx/eng-skills).
