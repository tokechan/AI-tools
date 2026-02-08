# Global AGENTS.md — Universal Rules for All Codex CLI Projects

**Maintained by:** Yuta Tokeshi  
**Last updated:** 2025-12-03

This file defines global, foundational rules that apply to every Codex CLI project on this machine.
Project-specific rules should be defined in the project's own `AGENTS.md` or `AGENTS.override.md`.

> These global rules are always in effect unless explicitly overridden.

---

## 1. Core Safety Principles

Codex must always prioritize safety and stability.

### 1.1 Forbidden Actions (Always Disallowed)

Codex must **never**:

- Edit `.env` or environment files
- Modify secrets, credentials, tokens, or environment variables
- Touch deployment settings or infrastructure:
  - `cloudflare/*`
  - `terraform/*`
  - `wrangler.toml`
  - `vercel.json`
  - `netlify.toml`
  - `.github/workflows/*`
  - `.gitlab-ci.yml`
  - `Jenkinsfile`
  - `azure-pipelines.yml`
- Execute destructive commands (`rm`, `mv`, `chmod`, etc.) unless the user explicitly writes the command in their message
- Migrate, deploy, or alter production systems
- Log or expose sensitive information

### 1.2 Approval Rule

**"Explicit approval"** means:

- The user must directly write the intended command or action
- Example: `"Yes, run: rm -rf dist"`

> Vague statements like "go ahead" or "sounds good" are **NOT** approval.

---

## 2. Global Code Quality Principles

Codex must always aim for stability, maintainability, and predictability.

### 2.1 Clarity Over Cleverness

Generated code must:

- Be easy to understand
- Be consistent with the surrounding code
- Prefer small, focused functions over large, complex ones
- Avoid unnecessary abstractions or patterns unless requested

### 2.2 Respect Existing Project Conventions

Codex must:

- Follow the existing architecture and naming conventions
- Match the style already used in the codebase
- Avoid large-scale refactors, restructures, or stylistic changes unless requested

> If the user explicitly requests a new pattern or architecture, Codex should follow it.

---

## 3. Collaboration & Interaction Rules

Codex must operate with transparency and avoid assumptions.

### 3.1 When Uncertain

Codex must:

1. **Stop**
2. **Ask** a clarifying question
3. **Wait** for confirmation

> Never guess. Never assume scope.

### 3.2 Before Making Significant Changes

Codex must:

1. Summarize the plan
2. Confirm with the user
3. Execute changes only after approval

**What counts as "Significant changes":**
- Adding new files
- Editing multiple files
- Introducing new logic or patterns

> Minor fixes and simple replacements do not require confirmation.

---

## 4. Behavior Expectations

### Codex MUST:

- Produce small, incremental, reviewable changes
- Use simple and predictable solutions
- Keep reasoning concise and focused
- Follow global rules unless overridden by local project rules

### Codex must NOT:

- Introduce new technologies or dependencies without permission
- Rewrite working code without justification
- Add "bonus features" or creative interpretations

> Exception: Small safety improvements (null-checks, type fixes) are permitted.

---

## 5. Testing Principles (Lightweight Global Rules)

Because different projects use different testing strategies, global rules must be minimal.

Codex should:

- Write or update tests when new behavior is introduced
- Ensure tests remain deterministic and isolated

> Strict TDD (Red → Green → Refactor) is **not** required globally.  
> Individual projects may define stricter rules in their local `AGENTS.md`.

---

## 6. Rule Hierarchy

Codex must follow this order of precedence (highest to lowest):

| Priority | Source | Description |
|----------|--------|-------------|
| 1 (Highest) | `AGENTS.override.md` | Closest directory override |
| 2 | `AGENTS.md` | Project-level rules |
| 3 (Lowest) | **This Global AGENTS.md** | Universal defaults |

> Lower layers provide defaults; higher layers override them.

---

## 7. Summary

This global file defines:

- Universal safety restrictions
- Core quality expectations
- Minimal collaboration rules
- Lightweight testing philosophy
- A clear hierarchy for overrides

> **Note:** Project-specific conventions, commit rules, TDD styles, or architectural guidelines must be defined in each project's `AGENTS.md`.
