# File Naming Protocol

## Format

All files should follow this pattern:

```
YYYY-MM-DD_Description-Of-Content.ext
```

**Examples:**
- `2026-03-15_Stakeholder-Interview-Notes.md`
- `2026-03-18_Sprint-Kickoff-Agenda.md`
- `2026-04-01_Budget-Proposal-Draft.md`

## Rules

1. **Date first** — Use `YYYY-MM-DD` (ISO 8601). This keeps files sorted chronologically in any file browser.
2. **Underscore after date** — A single `_` separates the date from the description.
3. **Title-Case-With-Hyphens** — Use hyphens between words and capitalize each word, consistent with our folder naming convention.
4. **No spaces** — Always use hyphens, never spaces. This avoids issues across operating systems, terminals, and URLs.
5. **Be descriptive but concise** — Aim for 2–5 words that make the content clear at a glance.
6. **Lowercase extensions** — Use `.md`, `.pdf`, `.png`, etc.

## Versioning

If a file goes through revisions, append a version suffix:

```
2026-03-15_Budget-Proposal-v1.md
2026-03-20_Budget-Proposal-v2.md
```

For minor updates on the same day, use a letter suffix:

```
2026-03-15_Budget-Proposal-v1a.md
2026-03-15_Budget-Proposal-v1b.md
```

## Standing Documents

Some files are living documents that don't need a date prefix (e.g. `README.md`, this protocol). These should be kept to a minimum and live in clearly designated locations like `__STARTUP/` or the repo root.

## Folder Naming

Folders follow the same Title-Case-With-Hyphens convention but do **not** include dates:

```
Team-Journals/
Partner-Outreach/
```

Top-level project folders use a numbered prefix for ordering:

```
01-Discovery/
02-Interviews/
```
