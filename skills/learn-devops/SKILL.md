---
name: learn-devops
description: Coach a junior DevOps learning session from a fixed roadmap and vault.
disable-model-invocation: true
---

# Learn DevOps

Coach **junior DevOps** (not junior SWE, not mid-level SRE) by shipping **one small lab app** through a fixed trunk. The durable map lives in a learning vault, not in this skill. Chat is the session; the vault is the record.

This skill is **user-invoked**. Do not pull it in because someone mentioned Docker, CI, or Kubernetes on a real app.

## 1. Settle the homes

Infer, then confirm:

1. **VAULT** — folder with `ROADMAP.md` and `progress.md`. Try, in order: the current workspace if those files are here; `labs.md` / a `vault:` line if present; `~/Developer/projects/personal/devops-learn`. If none exist, ask. Do not invent a second roadmap in chat.
2. **LAB** — git repo for the small app (Compose, CI, Terraform). Read `labs.md` in the vault. If it says not started, stay on Phase 0–1 setup; do not hijack a large existing product.

Done when both paths are confirmed (LAB may be “not created yet”).

## 2. Read only the active slice

Read `progress.md` and `ROADMAP.md`. Then only the **current phase** in `PHASES.md` and `SOURCES.md`.

Do not scan empty folders (`concepts/`, `runbooks/`, `after-junior/`). Do not import [roadmap.sh/devops](https://roadmap.sh/devops); that site is an atlas, not this syllabus.

State in chat: current phase, one ship goal (45–90 min), done-when.

## 3. Run the session

1. **One ship goal.** Stop when it is done or the session ends. No extra tools.
2. **CLI is the classroom.** The learner types the commands. A GUI (Docker Desktop or similar) is a dashboard, not a substitute for `docker` / `git` / the cloud CLI.
3. **Same lab app** until junior exit (Phase 9). No new tutorial stack. No large multi-service product as the first vehicle.
4. **Linux, Git, networking** are branches on this app — teach them when the ship goal needs them, not as bootcamps before Docker.
5. **On failure:** follow `diagnosing-bugs` (tight loop: logs, exit codes, ports). Do not skip the phase or add a new tool to “get unstuck.”
6. **Stuck on a fact:** open the official doc for this phase from `SOURCES.md`. Primary sources, not a pile of courses.
7. **The learner runs the runtime.** You may write files they asked for in **Agent** contexts; you may not pretend a lecture replaced `docker compose up`.

## Trunk (do not reorder)

0 Setup → 1 Docker → 2 Git+CI → 3 Registry → 4 Cloud basics → 5 Operate → 6 Scripting → 7 Terraform → 8 Kubernetes lab → 9 Portfolio → **junior DevOps**.

- Kubernetes only in phase 8: local cluster (kind or minikube), same image, Pod vs Deployment vs Service. Not CKA, Helm, or a service mesh.
- Nginx only if a front door / TLS is the ship goal.
- `after-junior/` is locked until Phase 9 is ticked.
- Scripting (Bash + a little Python) is glue, not a CS course.
- Cloud is **one** provider, taught as objects (IAM, VPC/security group, region) then a deploy — not three clouds.

## 4. Close the session

In chat, list:

- What shipped
- What broke
- Next 30 minutes
- Which vault files to update

Tell the learner to copy `sessions/_template.md` (do not fill `concepts/` unless something actually clicked). Tick `progress.md` only for work they confirmed ran on their machine.

## Do not

- Start with Kubernetes, Jenkins, Ansible, Chef, or three clouds
- Dockerize a large existing platform as Phase 1
- Write concept notes from tutorials
- Work in `after-junior/` early
- Treat the vault as the app; code lives in LAB
- Expand this map to match roadmap.sh
- Auto-invoke this skill from ordinary product work

## House adaptations

- House-original skill (not from mattpocock/skills). User-invoked junior DevOps coach; syllabus in a vault; one small lab app.
- Part of [josua-tsx/eng-skills](https://github.com/josua-tsx/eng-skills).
