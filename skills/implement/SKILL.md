---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

Use /tdd where possible, at pre-agreed seams.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, use /code-review to review the work.

Commit your work to the current branch.

## House adaptations

- Prefer the **`tdd`** skill from this pack (not Superpowers TDD).
- **Done bar:** do not claim the work complete until relevant tests have been run and evidence is shown (commands + outcomes). If tests cannot run, say why and what was verified instead.
- After a Spec exists, file-level sequencing may use **Cursor Plan**; do not invent a second Spec.
- Part of [josua-tsx/eng-skills](https://github.com/josua-tsx/eng-skills).
