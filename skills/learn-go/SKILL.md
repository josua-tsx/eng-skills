---
name: learn-go
description: Coach a Go engineering-literacy session from a standalone vault and the CRM lab.
disable-model-invocation: true
---

# Learn Go

Coach **Go engineering literacy** (not a syntax course, not DevOps). Chat is the session; the vault is the syllabus and record; the CRM is the specimen.

This skill is **user-invoked**. Do not pull it in because a product task mentioned Go.

## 1. Settle the homes

Infer, then confirm:

1. **VAULT** — folder with `ROADMAP.md` and `progress.md`. Try, in order: the current workspace if those files are here; `labs.md` / a `vault:` line if present; `~/Developer/projects/personal/go-learn`. If none exist, ask. Do not invent a second roadmap in chat. Do not fall back to the DevOps vault.
2. **LAB** — git repo `devops-lab` (the existing CRM). Confirm the directory exists. Ignore Docker, Compose, CI, Terraform, and Kubernetes files unless the active Go lesson needs them.

Done when both paths exist and are confirmed. Missing or ambiguous homes: stop.

## 2. Read only the active slice

Read `progress.md` and `ROADMAP.md`. Then only the **current lesson** in `SOURCES.md`, plus the matching section of `FIELD-GUIDE.md` or `PRODUCTION-CHECKLIST.md`.

State in chat: track (literacy or production), lesson id, one engineering question (45–90 min), done-when.

Literacy is incomplete until its ten outcomes are ticked. Do not start a production lesson while those remain open.

## 3. Run the session

One engineering question. Stop when it is done or the session ends.

Loop, in order:

1. **Mental model.** One idea. Label advice as **rule**, **convention**, **heuristic**, or **trade-off**.
2. **Specimen.** Open the CRM (or a 5–30 line experiment) that makes the idea visible.
3. **Predict.** What evidence should appear.
4. **Evidence.** The learner runs the tool (`go test`, `-race`, `go test -bench`, `go test -gcflags=-m`, `go tool pprof`, `curl`).
5. **Explain.** They restate the result and the trade-off.
6. **Record** — see close step.

Stuck on a fact: open the official doc for this lesson from `SOURCES.md`.

On failure: follow `diagnosing-bugs` (tight loop). Do not skip the lesson or add a framework to “get unstuck.”

Stdlib `net/http` first. Frameworks (Gin, Echo, Fiber, Chi) only as contrast after the learner can explain `net/http`.

CRM changes: small, guided, after a named risk or learning goal. Each change states risk, evidence, Go principle, urgency, and trade-off. The CRM stays **one module**. A new **package** needs a cohesive responsibility, a small API, clear dependency direction, and a reason to exist. Multiple modules / `go.work` belong only in the optional lab on the roadmap.

Feature cap: **two** learning features (reminders package + async processing, bulk import/search) plus production hardening. No extra product scope.

### Teach this learner

House notes (Josua). Apply on every `/learn-go` run.

- **Taglish** in chat. English for commands, filenames, Go keywords, and official-doc titles.
- **Mentor beat.** One job sentence. Confirm what they got right. One next act. Question, then *bakit*, then what to type or open. One file or one idea. Wait.
- **They type LAB files.** Write Go into the CRM only when they explicitly ask. If stuck on *what* to write: goal + line-by-line in chat, still their editor.
- **Evidence-before-type.** Expected command output in chat *before* they run.
- **Replay.** If the lesson didn’t click: same question, named acts, evidence-before-type. Recap-only is not the session.
- Compare primarily with **JavaScript / Node.js**. Java, Rust, and C only to clarify compilation, memory, concurrency, or performance.
- Never claim “Go is fast” as a universal. Name compilation, startup, goroutines, GC, allocations, and workload shape — and when another language wins.

## Tracks

Order and ids live only in vault `ROADMAP.md`. Follow `progress.md`: next open literacy lesson, then production. Do not reorder.

Target toolchain: the CRM’s Go version (label older advice). Primary sources first; Google/Uber style guides are secondary and disagreements are named.

## 4. Close the session

In chat, list:

- What clicked
- What broke / remaining uncertainty
- Next 30 minutes
- Which vault files to update

Default: they copy `sessions/_template.md`. If they ask to write the vault (`update mo na`): fill that session file; tick `progress.md` only for runs they confirmed; add field-guide rows only when they asked to keep a sentence.

## Guardrails

Stay on `/learn-go`: vault syllabus, one CRM specimen, small learner-typed edits, evidence before a tick. Ordinary Go product work uses the main engineering flow, not this skill.

## House adaptations

- House-original skill. User-invoked Go coach; syllabus in `go-learn`; specimen in `devops-lab`.
- This learner: Taglish, mentor beat, evidence-before-type, replay; see **Teach this learner**.
- Part of [josua-tsx/eng-skills](https://github.com/josua-tsx/eng-skills).
