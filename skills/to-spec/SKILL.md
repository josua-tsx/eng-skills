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

3. Write the spec using the template below, then publish it to the project issue tracker. Apply the `ready-for-agent` triage label - no need for additional triage.

## Writing rules

These apply to every section of the template.

**Frontmatter is required.**
`repos` is the load-bearing field: an agent picking the spec up inside a second repo has no other way to tell the spec applies there, so list every repo the change touches, not just the one you are sitting in.
`base` is the branch the spec was written against.
There is deliberately no `status` field — the `ready-for-agent` triage label from step 3 already records that, and a second copy is just a second thing to fall out of date.
On a GitHub or GitLab tracker the block renders as two horizontal rules with text between them; emit it anyway, since agents read it far more often than humans look at it.

**Mark what you inferred.**
This skill synthesises without interviewing, so every gap gets filled by inference.
Prefix any claim that was not established in the conversation or verified against code with `ASSUMPTION:`.
Where you did verify an external fact, attach a one-clause how-we-know to it, e.g. "confirmed against the provider's docs" or "read off the deploy config".
An inference that is labelled can be checked in seconds; an unlabelled one gets laundered into a requirement.

**One sentence per line.**
Use semantic line breaks: one sentence, or one clause of a long sentence, on its own line.
A one-word change then shows up as a one-line diff instead of repainting the whole paragraph.
That matters because this spec gets cleared by hand before `/to-tickets` runs, and neither author nor reviewer can see what moved inside a paragraph-sized diff.
Applies to Problem Statement, Solution, Implementation Decisions, Testing Decisions, Out of Scope, and Further Notes.
In a `.md` file the paragraph renders as one block, but GitHub and GitLab turn single newlines into real line breaks inside issue bodies, so on those trackers expect the published spec to render as a stack of one-sentence lines. That is readable, and the editability is worth more than the uniform paragraph.

<spec-template>

---
repos: [<every repo this spec governs>]
base: origin/dev
created: YYYY-MM-DD
---

## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## Visuals

Mermaid of behaviour — the actors and states the user would recognise, ≤15 nodes each. Under each diagram: 2–3 plain-English bullets.

Always emit this heading and both numbered subheadings, even when neither diagram applies — put the literal word `none` as the body. A skipped section is invisible; a section containing `none` is a decision someone can disagree with.

1. **Happy-path sequence** — trigger → done. Draw it when two or more actors take part, or the path has a step someone could get wrong; otherwise write `none`.
2. **State diagram** — statuses or phases this change introduces, each transition's cause, the important rejects. No statuses → write `none`.

Draw every legal transition, including retries and returns to an earlier state. Prose can list statuses and silently omit an edge; a diagram forces the omission into view.

## User Stories

A LONG, numbered list of user stories. Each user story should be in the format of:

1. As an <actor>, I want a <feature>, so that <benefit>

<user-story-example>
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending
</user-story-example>

This list of user stories should be extremely extensive and cover all aspects of the feature.

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

Any further notes about the feature.

</spec-template>

## House adaptations

- Spec stays the requirements artifact. **Cursor Plan** (product) may hold file-level how afterward — Plan is not a second Spec.
- Decided APIs are scannable bullets under Implementation Decisions (not a required catalog; not invented to look complete).
- Spec includes behavior mermaid (happy path + states). `explain-work` later draws what the diff actually landed. The `## Visuals` heading is always emitted, `none` and all, so a skipped diagram is a visible choice rather than a silent gap.
- YAML frontmatter (`repos`, `base`, `created`) instead of a prose status line, matching the shape `explain-work` uses. `repos` is the field that earns its keep — it tells an agent in a sibling repo that the spec governs it too. Status stays on the triage label alone.
- Inferred facts carry an `ASSUMPTION:` prefix, verified ones carry a how-we-know clause — the skill never interviews, so the reader needs to know which claims were checked.
- Semantic line breaks throughout, because the spec is edited by hand before `/to-tickets` and paragraph-wide diffs hide what changed.
- Part of [josua-tsx/eng-skills](https://github.com/josua-tsx/eng-skills).
