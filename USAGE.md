# How to use eng-skills

Practical guide for day-to-day use in Cursor. Skills live in this repo; invoke them with **slash commands** (`/grill-me`, `/to-spec`, …) or by asking the agent to follow a named skill.

## First-time setup

### 1. Install skills into Cursor

Already done on your machine if you followed the house install. For a new machine or a teammate:

```bash
npx skills add josua-tsx/eng-skills -g
```

Or clone and copy each `skills/<name>/` into `~/.cursor/skills/`, and each `commands/*.md` into `~/.cursor/commands/`.

Restart the chat (or Cursor) if `/` commands do not appear yet.

### 2. Pause Superpowers (recommended)

Disable the **Superpowers** plugin in **Cursor Settings → Plugins** so two process packs do not compete. Re-enable later if you want.

### 3. Configure each repo once

In the project you will work in, run:

```text
/setup-eng-skills
```

It asks where issues live. **House default:** local markdown under `.scratch/` (good for solo). Choose GitHub Issues only if you want tracker-backed tickets/wayfinder maps there.

You only need this before using `to-tickets`, `wayfinder`, or other tracker-aware skills in that repo.

---

## Which flow should I use?

| Situation | Start with |
| --- | --- |
| Small bugfix / tiny change | Just do it — skip the loop |
| Feature or behavior change you can hold in one session | `/grill-with-docs` → `/to-spec` → `/implement` |
| Same, but multi-PR / multi-session build | Add `/to-tickets` after `/to-spec` |
| No git repo / no working directory | `/grill-me` (stateless) instead of `/grill-with-docs` |
| Huge, foggy effort — destination unclear | `/wayfinder` first |
| Not sure which skill | `/ask-eng` |
| Hard / flaky bug | `/diagnosing-bugs` (or ask the agent to use it) |
| Writing or editing a skill / AGENTS.md | Let `writing-for-agents` kick in, or ask for it |

---

## Normal feature (main path)

```text
/grill-with-docs   → sharpen the idea (writes CONTEXT.md / ADRs when useful)
/to-spec           → turn the thread into a Spec
(/to-tickets)      → optional: split into tracer-bullet tickets
Cursor Plan        → optional: file-level how (not a second Spec)
/implement         → build with TDD, then code-review, then commit
```

### Step notes

1. **`/grill-with-docs`** — Agent interviews you. Answer until the design is clear. Prefer this whenever you are inside a repo.
2. **`/to-spec`** — Produces a Matt-style Spec (problem, solution, user stories, decisions, out of scope). That Spec is the source of truth for requirements.
3. **`/to-tickets`** — Use when the Spec is too big for one implement session. Work tickets blockers-first.
4. **Cursor Plan** — After Spec exists, you may open Plan mode for file-level sequencing. Do **not** rewrite the Spec inside Plan.
5. **`/implement`** — Drives **`tdd`** at seams, runs tests, runs **`code-review`**, commits. House rule: do not claim done without test evidence.

**Tiny fixes:** skip grilling/spec; implement directly.

---

## Foggy mega-work (wayfinder)

Use when the work is **too big for one session** and the **route is unclear** (greenfield, big migration, many open decisions).

```text
/wayfinder         → chart a decision map + tickets (decisions, not build slices)
  …resolve tickets one session at a time…
when map is clear → /to-spec → /to-tickets → /implement
```

- Wayfinder produces **decisions**, not the final product.
- When the map clears, hand off to **`/to-spec`** (collapse decisions into a buildable Spec). Do **not** jump straight to `/implement` unless the effort turned out tiny.
- Needs `/setup-eng-skills` so the tracker (local or GitHub) is configured.

---

## Commands cheat sheet

| Command | What it does |
| --- | --- |
| `/ask-eng` | Router — which flow fits |
| `/setup-eng-skills` | One-time repo config (tracker, domain docs) |
| `/grill-me` | Stateless interview (no repo paper trail) |
| `/grill-with-docs` | Interview + CONTEXT.md / ADRs in the repo |
| `/to-spec` | Thread → Spec |
| `/to-tickets` | Spec → tickets |
| `/implement` | Build Spec/tickets with TDD + review |
| `/wayfinder` | Decision map for foggy mega-work |

Model-invoked (agent pulls them in; you rarely type them): `tdd`, `grilling`, `domain-modeling`, `code-review`, `diagnosing-bugs`, `codebase-design`, `research`, `prototype`, `writing-for-agents`.

---

## Improving these skills

1. Edit files in the clone: `~/Developer/projects/personal/eng-skills` (or your clone path)
2. Keep house changes under `## House adaptations` in each `SKILL.md`
3. Commit and push to `josua-tsx/eng-skills`
4. Refresh Cursor: re-copy into `~/.cursor/skills/` or re-run `npx skills add josua-tsx/eng-skills -g`

Upstream Matt updates: see [UPSTREAM.md](./UPSTREAM.md).

---

## What this pack is not

- Not the full Matt 51-skill set
- Not Superpowers (disable that plugin while using this pack)
- Not a vault / Obsidian knowledge base — process only
- Not required for one-line fixes
