# Planning-Sprint as Holons — Design Note

**Purpose:** How to represent the Planning-Sprint repo in OASIS holonic architecture, and what that would allow.

---

## 1. Current shape (today)

Planning-Sprint is a **folder tree + markdown files**:

- **01-Discovery** — Stakeholder-Map, Current-State, Constraints  
- **02-Interviews** — Interview-Guide, Themes  
- **03-Meetings** — Kickoff-Agenda  
- **04-Artifacts** — Goals, Roadmap, RACI, Risks, Decisions  
- **05-Communications** — Partner-Outreach (proposals, summaries)  
- **06-Resources** — **Partners** (OpenServ, LFG, LIONSBERG, … each with index + docs), **Projects** (e.g. Pan-Galactic-Timebank + task maps, scope, build plan)

Identity is **implicit**: “LFG” = a folder path. The same partner might be referenced in Notion, in another repo, or in an app—each place has its own copy or link. There’s no single GUID for “this partner” or “this decision.”

---

## 2. How to convert to holons

### 2.1 One identity per “thing”

Give each logical entity a **holon** with a **stable GUID**:

| Today (file/folder) | As holon |
|--------------------|----------|
| **Planning-Sprint** (repo root) | **Root holon** — e.g. `PlanningSprint` type; Id = sprint identity. |
| **Partners** (section) | **Parent holon** “Partners”; `ParentHolonId` = root. |
| **OpenServ, LFG, LIONSBERG, …** (partner folders) | **Child holons** of Partners; one holon per partner (Id = partner identity). |
| **Projects** (section) | **Parent holon** “Projects”; children = Pan-Galactic-Timebank, etc. |
| **Discovery, Interviews, Meetings, Artifacts, Communications** | **Section holons** under root; their contents are children. |
| **Individual docs** (e.g. Goals.md, Brief-LFG-Port-Tech-Opportunity-Map.md) | **Child holons** of the right section or partner; metadata holds path, title, summary; content can be in holon body or linked. |

So the tree becomes a **holon tree**:

```
Planning-Sprint (root holon)
├── Partners (parent holon)
│   ├── OpenServ (holon)
│   │   ├── OpenServ.md (holon)
│   │   ├── Status-OpenServ-Builders-Fund-Current.md (holon)
│   │   └── Workshop-summary-... (holon)
│   ├── LFG (holon)
│   │   ├── LFG.md (holon)
│   │   ├── Brief-LFG-Port-Tech-Opportunity-Map.md (holon)
│   │   └── Mapping-LFG-Port-Tech-OASIS-Holonic-Sovereign.md (holon)
│   └── … (other partners)
├── Projects (parent holon)
│   └── Pan-Galactic-Timebank (holon)
│       ├── Pan-Galactic-Timebank.md (holon)
│       ├── BUILD_PLAN_OASIS.md (holon)
│       └── …
├── Artifacts (parent holon)
│   ├── Goals (holon)
│   ├── Roadmap (holon)
│   ├── Decisions (holon)
│   └── …
└── Discovery | Interviews | Meetings | Communications (section holons + children)
```

### 2.2 Shared-parent, no N²

- **Partners** = one parent; each partner = one child. Adding a new partner = add one child holon; no need to link that partner to every other partner or doc.
- **Projects** = one parent; each project = one child. Same idea.
- Queries like “all partners” or “all docs under LFG” become **load children of this parent** — one API pattern, scales.

### 2.3 Movable identity

- **LFG** (the partner) gets one GUID. That same GUID can be used in:
  - Planning-Sprint (this repo)
  - OASIS API / ONODE
  - Notion, Cursor, or future tools
  - LFG Port Tech briefs in `Docs/LFG/`
- So “one identity, many places” — no re-keying per system; the holon can be saved/loaded across providers (Mongo, IPFS, etc.) and still be the same logical entity.

### 2.4 Dual encoding (optional but powerful)

For key artifacts (e.g. **Goals**, **Decisions**, **RACI**):

- **One holon** holds both:
  - **Human-readable**: the markdown narrative (policy, rationale, conditions).
  - **Machine-readable**: structured fields (e.g. goal title, owner, due date; decision ID, status, sign-off).
- Same GUID for “this goal” or “this decision” — so dashboards, automation, and reports never drift from the human-written version.

### 2.5 Individual-first agreements

- Partner MOUs, workshop summaries, status docs (e.g. “OpenServ Builders Fund — current status”) can be modeled as **agreement holons**: proposed terms, acceptance, optional signatures, stored as holons.
- Gives you **auditable, revocable, portable** agreements attached to partner identity (and optionally to avatars/agents).

---

## 3. What this would allow

| Capability | What you get |
|------------|--------------|
| **One identity per partner/project/artifact** | Same GUID in Planning-Sprint, in OASIS apps, in Notion; reference “LFG” or “Goal 3” everywhere without re-registering. |
| **Query and sync via OASIS API** | “Load all children of Partners”; “Load all holons for partner Id = LFG”; “Load all decisions”; “Load all goals.” Enables dashboards, reports, and integrations without scraping markdown. |
| **Versioning and audit trail** | Holon version + CreatedDate/ModifiedDate (and optionally avatar) so you see who changed what, when. |
| **Multi-provider** | Same Planning-Sprint graph can live in the repo (as today), in OASIS API, and in a future Notion/sync layer—identity stays the same. |
| **Agents and automation** | Agents (Cursor, MCP, future BRAID) can read/update sprint state through the API: “add a decision,” “update goal status,” “list all LFG docs.” No need to parse file paths. |
| **Agreements as first-class objects** | Workshop summaries, status docs, MOUs as signed/versioned agreement holons; portable with partner identity. |
| **Shared-parent scaling** | New partner = one new child holon under Partners; new project = one under Projects. No N² bilateral links. |

---

## 4. Practical path (how to get there)

1. **Define holon types** (if not already): e.g. `PlanningSprint`, `Partner`, `Project`, `SprintDocument`, `SprintAgreement` (or reuse generic Holon / STARNETHolon with metadata).
2. **Bootstrap the tree**: Create root holon for this sprint; create parent holons for Partners, Projects, Artifacts, Discovery, etc.; create one holon per partner and per project; attach existing doc content as child holons (metadata + body or link to file).
3. **Keep markdown as source of truth (short term)**: A sync job or tool can “file → holon” (and optionally “holon → file”) so the repo stays the canonical human-editable place while OASIS holds the identity graph and API.
4. **Add dual encoding where it pays off**: Start with Goals and Decisions (structured fields + narrative in one holon); then RACI, Roadmap.
5. **Use agreements for partner docs**: Model key partner docs (status, workshop summary, MOU) as agreement holons linked to the partner holon.

Once the tree exists in OASIS, any client (Notion, Cursor, MCP, future apps) can **pull the latest** and **push updates** through the API while the repo remains the shared, readable source for the team.

---

## 5. Implementing holons with GitHub as identity and source of truth

Today **identity is GitHub**: people commit and push; author/committer (name, email, GitHub username) is who “did” the change. The repo is the single source of truth for content. The implementation below keeps that workflow and adds holons as a **sync layer** on top.

### 5.1 Principles

| Concern | Approach |
|--------|----------|
| **Source of truth** | GitHub repo stays canonical. No one is required to edit via OASIS API; everyone keeps using git push. |
| **Identity (today)** | Store **GitHub identity** in holon metadata: `CreatedByGitHub`, `ModifiedByGitHub`, `LastCommitSha`, `LastCommitAuthor`, `LastCommitDate`. So “who changed this” is still the committer. |
| **Identity (later)** | When someone links their GitHub account to an OASIS avatar (e.g. via OASIS “link GitHub” or zkPass-style proof), you can set `CreatedByAvatarId` / `ModifiedByAvatarId` on holons and get movable identity without changing how people commit. |
| **Stable GUIDs** | Each file/folder maps to **one** holon Id. Options: (a) deterministic Id from repo-relative path (e.g. hash of `06-Resources/Partners/LFG/Brief-LFG-Port-Tech-Opportunity-Map.md`), or (b) first sync creates the holon and stores `RepoPath` in metadata; later syncs reuse that holon by path. |

### 5.2 Sync: repo → holons (one-way, additive)

For a **generic** sync that works for any repo (Planning-Sprint is one config), see **`Docs/REPO_TO_HOLONS_SYNC_DESIGN.md`**. The following describes the behaviour in that framework.

A **sync job** (run on push, on schedule, or manually) does:

1. **Clone or pull** the Planning-Sprint repo (or use GitHub API / checked-out workspace).
2. **Walk the tree**: root → sections (Discovery, Artifacts, Resources, …) → Partners / Projects → partner/project folders → individual files.
3. **For each logical entity** (section, partner, project, doc):
   - **Resolve holon Id**: e.g. lookup by `MetaData["RepoPath"]` or compute deterministic Id from path.
   - If no holon exists: **create** it (ParentHolonId, Name, HolonType, MetaData with RepoPath, file content or link).
   - If holon exists: **update** if content or git metadata changed (e.g. LastCommitSha, LastCommitAuthor, ModifiedDate); optionally update body from file content.
4. **Git metadata**: For each file, from `git log -1 --format=...` (or GitHub API), set on the doc holon:
   - `LastCommitSha`, `LastCommitAuthor`, `LastCommitAuthorEmail`, `LastCommitDate`.
   - Optionally: full history as a list in metadata, or as child “commit” holons for audit.

So: **GitHub = where edits happen; sync = what builds the holon graph.** No change to how the team works.

### 5.3 Where the sync runs

- **Option A — GitHub Action**: On push to `main` (or a branch), a workflow checks out the repo, runs a script that calls OASIS API (or ONODE) to create/update holons, then exits. Identity for the *sync* call can be a service avatar or API key; the *content* identity (who wrote it) stays in holon metadata from git.
- **Option B — Cron / scheduled job**: Periodically pull the repo and run the same sync (e.g. every hour or daily). Good if you don’t want to wire Actions yet.
- **Option C — Manual / Cursor**: A script or MCP tool that “sync Planning-Sprint to OASIS” from a local clone. Same logic; run when someone wants the graph updated.

### 5.4 Holon metadata shape (suggested)

For a **document holon** (e.g. one markdown file):

```json
{
  "RepoPath": "06-Resources/Partners/LFG/Brief-LFG-Port-Tech-Opportunity-Map.md",
  "RepoUrl": "https://github.com/Improbable-Collaborations/Planning-Sprint/blob/main/...",
  "LastCommitSha": "abc123...",
  "LastCommitAuthor": "Jane Doe",
  "LastCommitAuthorEmail": "jane@example.com",
  "LastCommitDate": "2026-03-15T12:00:00Z",
  "CreatedByAvatarId": null,
  "ModifiedByAvatarId": null
}
```

- `RepoPath`: stable key for “this file” → “this holon.”
- `LastCommit*`: GitHub identity (current); no OASIS avatar required.
- `*AvatarId`: optional; once someone links GitHub → OASIS avatar, a separate process or future sync can backfill so you get movable identity for “who last edited this.”

For **partner / project holons** (folders), metadata can include `RepoPath` (e.g. `06-Resources/Partners/LFG`) and the same git fields for the folder (e.g. last commit that touched anything under that path).

### 5.5 Optional: link GitHub → OASIS avatar

To move from “identity = GitHub” to “identity = OASIS avatar” without changing workflow:

- In OASIS (or a small linking service): allow a user to **associate their GitHub username** (or a verified proof of control) with their **avatar Id**. Store that mapping (e.g. avatar.ProviderWallets or a custom ProviderType for “GitHub”).
- In the sync job: when you have `LastCommitAuthor` (GitHub username), look up avatar Id from that mapping. If found, set `ModifiedByAvatarId` (and optionally `CreatedByAvatarId` for first commit) on the holon.
- Result: the same person keeps committing with GitHub; the holon layer gains an OASIS avatar Id so that identity is movable (same person in other apps, karma, etc.).

### 5.6 Summary: minimal implementation

1. **Keep** GitHub as the only place people push; no change to team behaviour.
2. **Add** a sync process (Action, cron, or manual) that walks the repo and creates/updates holons with stable Ids and parent-child structure (§2).
3. **Store** GitHub identity in holon metadata (`LastCommitAuthor`, etc.); optionally link GitHub → avatar and backfill `*ByAvatarId`.
4. **Use** the holon graph in OASIS for query, dashboards, MCP/agents, and (later) Notion or other clients, while the repo remains the source of truth.

---

*Refs: `Docs/holons/HOLONIC_ARCHITECTURE_OVERVIEW.md`, `Docs/holons/HOLONIC_ARCHITECTURE_WHITEPAPER-pdf.md`, `06-Resources/Partners/LFG/Mapping-LFG-Port-Tech-OASIS-Holonic-Sovereign.md` (shared-parent, movable identity, dual encoding, agreements).*
