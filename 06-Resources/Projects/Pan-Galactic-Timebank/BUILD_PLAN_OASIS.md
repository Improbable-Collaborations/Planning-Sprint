# Pan Galactic Timebank — Build Plan (OASIS)

A phased plan to start building the time bank using OASIS. **This is a separate project** from Launchboard; we build inside the **Pan Galactic Timebank folder** and **reuse components** (and patterns) from pangea-repo where useful. Prioritises a **small, runnable slice** first, then onboarding, search, clearing, and OASIS backend.

---

## Principle: Simple First, Then OASIS Backend

From the transcript: *"Create the interfaces and the story, test it out like simple code and then when we like that code to then do the Oasis back-end part."*

So we build **DB-first** in the PGT project, get a working "time bank in the UI" with balance and exchanges, then plug in **OASIS** (Avatar, optional Karma-style API or Holon storage, then on-chain clearing).

---

## Where to Build

**Decision: separate project in the Pan Galactic Timebank folder.**

| Location | Purpose |
|----------|---------|
| **`Hitchhikers/Pan_Galactic_Timebank/`** | Project root: docs (already here), app code, schema, API. |
| **Reuse from pangea-repo** | UI components (e.g. `@pangea/ui` or copy), OASIS client patterns, transaction/ledger patterns. Not the Launchboard app itself. |

- **App and backend** live under `Pan_Galactic_Timebank/` (e.g. `app/`, `lib/`, `db/`).
- **Components:** Reuse from pangea by importing from `pangea-repo` (workspace reference, npm link, or copy). Use the same primitives (tables, forms, metrics) so the time bank UI feels consistent.
- **Identity:** We still use OASIS Avatar; the PGT app can call OASIS API for auth/identity. We define our own member/circle model in this project; no dependency on Launchboard's org/stakeholder DB.

---

## Project structure (Pan Galactic Timebank folder)

Keep app and backend under this folder. Example layout:

```
Pan_Galactic_Timebank/
├── README.md
├── docs/                    # Scope, ADRs (optional)
├── app/                     # Next.js app router (or similar)
│   ├── (time-bank)/        # Routes: balance, record, transactions
│   └── ...
├── lib/                     # Shared logic, OASIS client, actions
│   ├── db/                  # DB client, queries
│   ├── oasis/               # OASIS API client (reuse pattern from pangea)
│   └── actions/             # recordTimeExchange, getBalance, etc.
├── components/              # PGT-specific UI; reuse from pangea where useful
├── db/ or schema/           # Migrations, time_bank_transaction, time_bank_member
└── ... (existing docs: Transcript, Technical Tasks, Task Map, BUILD_PLAN)
```

**Reuse from pangea-repo:** Import UI primitives (tables, forms, cards), OASIS client pattern, and transaction/ledger UX patterns. The PGT app has its own DB and member model; it does not depend on Launchboard's org/stakeholder tables.

---

## Phase 0 — Scope and Decisions (Week 0)

**Goal:** Align on what we're building first and where it lives.

| Step | What | Output |
|------|------|--------|
| F1 | **Scope doc** — One-pager: time bank + dynamic equity vision; "Phase 1 = balance + ledger + identity in PGT app, Web2-first." | `docs/PAN_GALACTIC_TIMEBANK_SCOPE.md` in this folder (or in PGT repo). |
| F2 | **Web2 vs Web3 note** — "Phase 1: all time-bank data in PGT app DB. Phase 2+: clearing result signed and optionally on-chain via OASIS." | Short section in scope doc or ADR. |
| F3 | **Product decision** — Use existing time-bank software for now vs "minimal add up the numbers" in-house. If in-house, we follow this plan. | Decision logged. |

**No code yet.** Unblocks Phase 1.

---

## Phase 1 — Minimal Viable Time Bank (Build This First)

**Goal:** A user can **identify with OASIS** (Avatar; PGT has its own member model linked to OASIS), **see a time bank balance**, and **record a time exchange** (I gave X hours to Y / I received X hours from Y). All data in PGT app DB; no OASIS sync yet.

### 1.1 Identity (O1)

- **Model:** PGT defines its own **member** (and optionally **circle** / org). Each member has an OASIS Avatar id (and optionally wallet) for identity. No dependency on Launchboard stakeholder tables.
- **Add:** Tables e.g. `time_bank_member` (id, oasisAvatarId, displayName, joinedAt, circleId?), `circle` (id, name, ...) if you want multi-community support.
- **Deliverable:** Minimal schema for member (+ circle if needed); auth can be "sign in with OASIS" or a simple session linked to `oasisAvatarId`.

### 1.2 Ledger (L1)

- **New schema** in this project (e.g. `Pan_Galactic_Timebank/db/` or `schema/`):
  - **Time bank ledger table:** e.g. `time_bank_transaction`
    - id, circleId (or orgId), memberId, counterpartyId, amount (hours, numeric), type (CREDIT | DEBIT), balanceAfter, effectiveDate, reference, createdAt, createdBy.
  - **Balance:** Derived from sum of transactions per member (or stored in `time_bank_balance` updated on each tx).
- **Mirror** the pattern of pangea's `transactionLog`: append-only, counterparty, balanceAfter, so we can reuse similar UI patterns (tables, hero metric).

### 1.3 Payment / Transfer Flow (L5)

- **Server action (or API):** "Record time exchange" — e.g. "Alice gives 2 hours to Bob."
  - Create two rows: Alice DEBIT (balanceAfter = Alice.balance - 2), Bob CREDIT (balanceAfter = Bob.balance + 2).
  - Enforce **credit limit** later (L3); Phase 1 can allow negative balance or a simple cap.
- **Deliverable:** `recordTimeExchange(circleId, fromMemberId, toMemberId, amountHours, reference)` (or similar).

### 1.4 Bank Account UI (L2)

- **New route(s)** in the PGT app, e.g. `/(time-bank)/` or `/balance`, `/record`:
  - **My balance:** Single number (current time bank balance).
  - **Transaction list:** Table of past transactions (date, counterparty, amount, balance after, reference).
  - **Record exchange:** Form (I gave X hours to [person] / I received X hours from [person], optional reference). Submit → calls L5.
- **Reuse** from pangea: hero metric for balance, table for transactions (same UX patterns as cap-table overview / transaction history).

### 1.5 OASIS in Phase 1

- **Identity only:** User signs in or is identified via OASIS Avatar; PGT stores `oasisAvatarId` on its member record. Use OASIS API for display (name, avatar) if needed.
- **No Karma sync yet.** Ledger stays in PGT DB. Keeps Phase 1 simple and fast to ship.

**Phase 1 deliverables (concrete):**

1. Schema: `time_bank_transaction` (+ `time_bank_member`, optional `circle`) in PGT project.
2. API/actions: get balance, list transactions, record time exchange.
3. UI: Time bank dashboard (balance + list + "Record exchange" form) in PGT app.
4. Docs: Short "Phase 1: Time bank (PGT app)" in scope doc or README.

**Outcome:** Someone can join the time bank (PGT flow), open the app, see balance, and record a time exchange with another member. Story to tell; foundation for Phase 2.

---

## Phase 2 — Onboarding and Skills (O2, O3, O4, S1, S3, S5)

**Goal:** New members can **onboard** with skills/offers/wants; others can **find them in the network** (search by skill/tag).

- **O2:** Onboarding data schema — skills, offers, wants (new table or extend stakeholder/profile).
- **O3:** Onboarding flow — wizard or form (reuse onboarding pattern from pangea if useful); steps: identity (existing), skills, offers, wants.
- **O4 (optional):** AI-assisted onboarding — voice or notes → LLM → structured skills/offers/wants (reuse extraction/classifier pattern).
- **S1 + S5:** Skills/offers/wants index (searchable); simple taxonomy (tags: location, topic, activity type).
- **S3:** "Find in my network" — search restricted to time-bank members in the org (or circle); return matches with profile.

**OASIS:** Store skills in AvatarDetail.Skills or Holon MetaData if we want portability; otherwise PGT app DB is enough for Phase 2.

---

## Phase 3 — Clearing and OASIS Backend (C1–C3, L3, L4, F2)

**Goal:** **Clearing** (e.g. weekly reconcile ledgers, produce signed summary); **credit limit** (L3) and **invoicing** (L4); **persist clearing on-chain or signed** via OASIS.

- **C1:** Clearing process — compare ledgers in a group, resolve disputes, agree net positions.
- **C2:** Clearing workflow — consistent entries → signed payload (e.g. Merkle or signed JSON).
- **C3:** Publish clearing result via OASIS (attestation or on-chain), reusing `oasis-sync` / attestation patterns from cap table.
- **L3:** Credit limit per account; enforce in "record exchange" and UI.
- **L4:** Time invoice entity + link to ledger entries (optional; can follow after C1–C3).

**OASIS:** Use OASIS provider layer for attestation/signing; optionally Karma-style API for "time balance" if we want OASIS to be source of truth for balance (otherwise PGT app remains source, OASIS gets clearing digest).

---

## Phase 4 — Dynamic Equity and Polish (E1–E3, OAS5, OAS6)

- **E1–E3:** Slicing the Pie integration; "cash in" flow (time bank balance → dynamic equity); document legal.
- **OAS5:** Voice/energy invoicing (voice → Whisper → suggest ledger entry).
- **OAS6:** Document and tell the story (stack, user flows, Web2/Web3 split).

---

## What to Build First (Summary)

| Order | What to build | Why first |
|-------|----------------|-----------|
| **1** | **F1 scope doc** | Align scope and "Phase 1 = balance + ledger + identity." |
| **2** | **L1 — Time bank ledger schema** | Foundation for balance and exchanges; no UI without it. |
| **3** | **O1 — Time bank member (identity)** | Who has a balance; PGT member model + oasisAvatarId. |
| **4** | **L5 — Record time exchange** | Core action: two ledger rows, update balances. |
| **5** | **L2 — Bank account UI** | Balance + transaction list + "Record exchange" form. |

Then: Phase 2 (onboarding, skills, search), Phase 3 (clearing, OASIS, credit limit, invoicing), Phase 4 (dynamic equity, voice, story).

---

## Repo and Code Locations (Proposal)

- **Scope and docs:** This folder `Hitchhikers/Pan_Galactic_Timebank/` (already have transcript, tasks, task map); optionally sync to PGT repo.
- **Schema and API:** `Pan_Galactic_Timebank/db/` or `schema/` — migrations, `time_bank_transaction`, `time_bank_member`, `circle` (if used).
- **UI and actions:** `Pan_Galactic_Timebank/app/` — routes e.g. `(time-bank)/balance`, `(time-bank)/record`; reuse components from pangea-repo where useful.
- **OASIS client:** Add under `Pan_Galactic_Timebank/lib/oasis/` (reuse pattern from `pangea-repo/apps/launchboard/lib/services/oasis-client.ts`). Karma or custom "time balance" API on OASIS side can be added in Phase 3.

---

## Next Steps

1. **Confirm** Phase 0 (scope doc, Web2/Web3 note, build location = Pan Galactic Timebank folder).
2. **Implement Phase 1.1–1.4** in order: schema (L1) in PGT project → identity (O1) → record exchange (L5) → UI (L2).
3. **Ship** a minimal time bank app in this folder: balance, list, record exchange; identity via OASIS Avatar (PGT member link).
4. **Iterate** with Phase 2 (onboarding, skills, search), then Phase 3 (clearing, OASIS backend).

---

*Sources: [Pan_Galactic_Timebank_Technical_Tasks.md](./Pan_Galactic_Timebank_Technical_Tasks.md), [Pan_Galactic_Timebank_Task_Map_OASIS_Codebase.md](./Pan_Galactic_Timebank_Task_Map_OASIS_Codebase.md), transcript.*
