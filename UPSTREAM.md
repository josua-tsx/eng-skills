# Upstream pin

**Source:** https://github.com/mattpocock/skills  
**Pinned commit:** `84fdeffd12f2ee307994d1eb6feb48173b6e0502`  
**Pinned date:** 2026-08-12 (UTC)  
**Last checked:** 2026-08-12

## Forked skill names

- grill-me, grill-with-docs, grilling, domain-modeling
- to-spec, to-tickets, implement, wayfinder
- tdd, diagnosing-bugs, code-review, codebase-design
- research, prototype, writing-for-agents
- setup-eng-skills (from setup-matt-pocock-skills)
- ask-eng (from ask-matt)

## House-original (not from Matt)

- explain-work — teach a shipped change from Spec + diff, then quiz until the user can explain it

## How you learn Matt shipped something

1. Watch https://github.com/mattpocock/skills (Releases / activity)
2. Compare this pinned SHA to `main`
3. Sync only when the change looks useful

## Sync steps (Matt → this repo)

1. `git clone` or fetch mattpocock/skills at the new SHA
2. For each forked skill folder: `diff` upstream vs `skills/<name>/`
3. Cherry-pick useful upstream changes into this repo
4. Keep every `## House adaptations` section intact
5. Bump **Pinned commit** + **Pinned date** + **Last checked** here
6. Push this repo; re-install into Cursor (`npx skills add josua-tsx/eng-skills -g` or refresh local copies)

**Do not** run blind `npx skills update` against Matt for skills you have adapted — it overwrites house edits.
