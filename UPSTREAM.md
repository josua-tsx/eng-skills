# Upstream pin

**Source:** https://github.com/mattpocock/skills  
**Pinned commit:** `d81f3a183412e71a5b1e84ca21bc1a35eea03a60`  
**Pinned date:** 2026-09-29 (UTC)  
**Last checked:** 2026-10-01

## Forked skill names

- grill-me, grill-with-docs, grilling, domain-modeling
- to-spec, to-tickets, implement, implement-spec, wayfinder
- tdd, diagnosing-bugs, code-review, codebase-design
- research, prototype, writing-for-agents
- pr, retro
- setup-eng-skills (from setup-matt-pocock-skills)
- ask-eng (from ask-matt)

## House-original (not from Matt)

- explain-work — teach a shipped change from Spec + diff, then quiz until the user can explain it
- learn-devops — coach a junior DevOps learning session from a vault and one lab app
- learn-go — coach Go engineering literacy from a standalone vault and the CRM lab
- learn-system-design — coach production system-design judgment from a standalone mastery-gated vault

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
