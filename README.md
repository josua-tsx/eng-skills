# eng-skills

House fork of selected [mattpocock/skills](https://github.com/mattpocock/skills) engineering workflows — editable copies for Cursor, published so we can improve and share them.

**Not** the full 51-skill pack. **Not** Superpowers.

**How to use:** see **[USAGE.md](./USAGE.md)** (setup, which flow, step-by-step, cheat sheet).

## Quick start

1. Install: `npx skills add josua-tsx/eng-skills -g` (and copy `commands/` → `~/.cursor/commands/` if needed)
2. Disable Superpowers in Cursor Settings → Plugins
3. In a project: `/setup-eng-skills` (once)
4. Build a feature: `/grill-with-docs` → `/to-spec` → `/implement`
5. Unsure: `/ask-eng`
6. Junior DevOps practice: `/learn-devops` (user-invoked; not for dockerizing a real product)

## Flows (summary)

**Normal feature:** `/grill-with-docs` (or `/grill-me`) → `/to-spec` → optional `/to-tickets` + Cursor Plan → `/implement` (uses `tdd`, then `code-review`)

**Foggy mega-work:** `/wayfinder` → when the map clears → `/to-spec` → build

**Tiny fixes:** skip the loop.

## Included skills

| Skill | Role |
| --- | --- |
| `grill-me`, `grill-with-docs`, `grilling`, `domain-modeling` | Sharpen ideas |
| `to-spec`, `to-tickets` | Spec + tickets |
| `implement`, `tdd`, `code-review` | Build with TDD + review |
| `wayfinder`, `research`, `prototype` | Decision maps for huge foggy work |
| `diagnosing-bugs`, `codebase-design` | Debug / design vocabulary |
| `writing-for-agents` | Author/edit skills & agent docs |
| `explain-work` | Teach a shipped change from Spec + diff, then quiz |
| `learn-devops` | Coach a junior DevOps learning session (vault + small lab app) |
| `setup-eng-skills`, `ask-eng` | Setup + router |

## Install (you or others)

```bash
npx skills add josua-tsx/eng-skills -g
```

Pick the skills you want (or all of them). Prefer **global** (`-g`) so Cursor loads them across projects.

Or clone and copy into `~/.cursor/skills/`:

```bash
git clone https://github.com/josua-tsx/eng-skills.git
# copy each skills/<name> into ~/.cursor/skills/
# copy commands/*.md into ~/.cursor/commands/
```

## Upstream sync

See [UPSTREAM.md](./UPSTREAM.md). Do **not** blind `npx skills update` from Matt for adapted skills — it overwrites house edits. Sync Matt → this repo (manual merge) → re-install.

## License / attribution

Skills originated from [mattpocock/skills](https://github.com/mattpocock/skills). House adaptations are marked under `## House adaptations` in each edited `SKILL.md`.
