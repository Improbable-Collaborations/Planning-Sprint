# Pan Galactic Timebank — Task Map vs OASIS Codebase & Docs

This document maps each technical task from [Pan_Galactic_Timebank_Technical_Tasks.md](./Pan_Galactic_Timebank_Technical_Tasks.md) to the OASIS codebase (DeepWiki docs and this repo), and to **pangea-repo** (Launchboard / cap table). For each task we note: **existing** (can reuse), **partial** (extend), or **gap** (build new).

**References:**
- **OASIS docs:** [DeepWiki – NextGenSoftwareUK/OASIS](https://deepwiki.com/NextGenSoftwareUK/OASIS) (Overview, Core Data Model, Avatar System, Karma System, Provider System)
- **pangea-repo:** `pangea-repo/` — Launchboard app + `packages/cap-table` (stakeholders, transactions, OASIS sync, onboarding)

---

## 1. Foundation & Ownership

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **F1** Define and document software project scope (time bank + dynamic equity, on-chain/signed, commons) | OASIS is the "unified interface" and provider layer; no time-bank scope doc. | No time-bank scope; cap table is equity-focused. `docs/TOKENISATION_HOW_IT_WORKS.md`, `docs/USER_JOURNEYS.md` describe cap table + on-chain. | **Gap** — New scope doc and project definition; can reference OASIS provider + attestation patterns from `DOCUMENSO_ONCHAIN_ASSESSMENT.md`. |
| **F2** Design Web2 vs Web3 split (local storage vs on-chain) | Core Data Model: Holons with `ProviderUniqueStorageKey`, multi-provider storage. [Core Data Model](https://deepwiki.com/NextGenSoftwareUK/OASIS/2-core-data-model). | Cap table: DB-first, optional OASIS sync; `transactionLog` has `oasisBlockchain`, `oasisTransactionHash`; `sync-to-chain.ts` / `oasis-sync.ts` for on-chain. `DOCUMENSO_ONCHAIN_ASSESSMENT.md` discusses what goes on-chain. | **Partial** — Pattern exists for cap table; time bank needs its own split (ledger local vs clearing on-chain). |
| **F3** Evaluate existing time bank software vs minimal "add up numbers" | N/A (OASIS is platform, not time-bank app). | N/A. | **Gap** — Product/ops decision; no code mapping. |

---

## 2. Identity & Onboarding

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **O1** Design identity model for time bank participants | **Avatar** (Id, Username, Email, ProviderWallets); **AvatarDetail** (Karma, Level, Skills, etc.). [Avatar System](https://deepwiki.com/NextGenSoftwareUK/OASIS/4-avatar-system), [Core Data Model – Avatar](https://deepwiki.com/NextGenSoftwareUK/OASIS/2-core-data-model). | **Stakeholder** has `userId`, `oasisAvatarId`, `oasisWalletAddress`, `solanaWalletAddress` — links to OASIS identity. `lib/services/oasis-client.ts` (OASISAvatar), `stakeholder.ts` schema. | **Partial** — Reuse Avatar + stakeholder–Avatar link; add "time bank member" view (e.g. profile/skills). |
| **O2** Define onboarding data schema (skills, offers, wants) | AvatarDetail has **Skills** (IAvatarSkills); Holon MetaData for extensible fields. | `onboardingProgress` + `OnboardingData`: company, user, charter (cap-table focused). No skills/offers/wants schema. `packages/cap-table/src/db/schema/onboarding-progress.ts`. | **Partial** — New schema for time-bank onboarding (skills, offers, wants); could sit in MetaData or new table. |
| **O3** Build sign-up / onboarding flow (skills, interests, wants) | Avatar registration + AvatarDetail; no dedicated "time bank onboarding" flow. | Launchboard onboarding: `welcome → identity → company → charter → review → complete`; `lib/onboarding/server.ts`, `app/(onboarding)/`. | **Partial** — Reuse wizard pattern and session; add time-bank steps (skills/offers/wants) or separate flow. |
| **O4** AI-assisted onboarding (LLM from notes/voice → structured data) | N/A. | Document extraction: Reducto + classifier; onboarding uses `classify` + `extract` APIs. `lib/extraction/`, `app/api/onboarding/classify`, `app/api/onboarding/extract`, `document-classifier.ts`. No voice; PDF/text. | **Partial** — Add voice→text (e.g. Whisper) then reuse "text → structured" pipeline for onboarding schema. |
| **O5** Support time broker role (entries, audio notes, type-in, onboard) | N/A. | No "broker" role. Org members and roles in `orgMember`; dataroom "document intake" and merge flows for data entry. | **Gap** — New role + UI for broker (data entry, optional voice notes); leverage existing intake/merge patterns. |

---

## 3. Search & Discovery (Skills Matching)

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **S1** Skills/offers/wants index (searchable by skill, location, tags) | AvatarDetail.Skills; Holon MetaData. No built-in search index. | Stakeholders are searchable (e.g. by name/email); no skills/offers index. `stakeholder` schema, `lib/api/stakeholder-queries.ts`. | **Gap** — New index (DB table or search service) for skills/offers/wants; store in Holon MetaData or pangea schema. |
| **S2** LLM-driven search (natural language → query skills index) | N/A. | Dataroom: document chat with LLM (`document-intelligence-chat.tsx`, `app/api/dataroom/chat`). No "search people by description" yet. | **Partial** — Reuse chat/LLM pattern; add "query → skills index" and return matches. |
| **S3** "Find in my network" (onboarded members only) | Avatar + provider storage; no "network" concept. | Org-scoped stakeholders per organization; "network" = org members + stakeholders. | **Partial** — Restrict search to org or to "time bank circle"; reuse stakeholder list + new skills filter. |
| **S4** "Find externally" + invite into network | N/A. | `orgInvitation`, invite flow; no external discovery. | **Gap** — External discovery (e.g. public profiles, other time banks) + invite flow. |
| **S5** Skill taxonomy/tags (location, topic, activity type) | AvatarDetail.Skills; no standard taxonomy in docs. | No skill taxonomy. | **Gap** — Define and implement taxonomy; can store in MetaData or enum + tag table. |

---

## 4. Ledger, Invoicing & Balances

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **L1** Ledger data model (balance, transaction history, counterparty, reconcilable/signed) | **Karma** + **KarmaAkashicRecords**: per-Avatar balance, history, source, provider. [Karma System](https://deepwiki.com/NextGenSoftwareUK/OASIS/4.3-karma-system). Not double-entry; single "points" balance. | **transactionLog**: append-only; orgId, type, securityId, stakeholderId, counterpartyId, quantity, balanceAfter, effectiveDate, metadata. `packages/cap-table/src/db/schema/transaction-log.ts`. | **Partial** — Time bank ledger is double-entry (credit/debit); reuse transaction-log pattern but new schema (time units, not shares). Karma is conceptually similar (balance + history). |
| **L2** "Bank account" UI (balance, list of transactions, running total) | N/A (Karma is API/model, no UI in OASIS repo). | Cap table overview: totals, tables, metrics. `(cap-table)/overview/`, `cap-table-hero-metrics`, `cap-table-synthesis-table`. Transaction history in stakeholder/security context. | **Partial** — New "time bank balance" view reusing table/metrics patterns; data from new ledger. |
| **L3** Credit limit per account | N/A. | No credit limit in cap table. | **Gap** — New field + enforcement in time bank ledger/balance logic. |
| **L4** Invoicing (create invoices, link to ledger) | N/A. | No invoicing; transactions are issuances/transfers/exercise etc. | **Gap** — New "time invoice" entity + link to ledger entries. |
| **L5** Payment/transfer flow (settle time → ledger entries, update balances) | KarmaEarnt/KarmaLost + AddKarmaToAvatar/RemoveKarmaFromAvatar. | `lib/actions/transaction.ts` — create transactions; balance derived from transaction log. | **Partial** — Time bank "payment" = two ledger entries (credit one, debit other); mirror transaction action pattern. |
| **L6** Borrowing (pledge-backed), ledger + balance | N/A. | N/A. | **Gap** — New product + schema (pledges, borrow ledger entries). |

---

## 5. Local / User-Controlled Data & UX

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **D1** Locally hosted / user-controlled balance (and optionally ledger) | Holons can live on different providers; "local" could be a provider or client-held. | Data is server/DB; no local-first ledger yet. | **Gap** — Design: local-first store (e.g. local storage / client) vs server; OASIS provider layer could back "user's copy". |
| **D2** Transaction history → people ("who did I work with on X?") | Avatar references in records. | **transactionLog** has `stakeholderId`, `counterpartyId`; stakeholder detail view. `stakeholder-detail-view`, relations in schema. | **Partial** — Time bank: link ledger rows to counterparty profile; same "transaction → person" UX as stakeholder. |
| **D3** Click-through from balance/ledger to profile and messaging | N/A. | Stakeholder table → detail; no in-app messaging in codebase. | **Partial** — Add "message this person" (email or future messaging); profile/click-through pattern exists. |

---

## 6. Clearing & On-Chain / Signed Settlement

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **C1** Clearing process (e.g. weekly reconciliation of group ledgers) | N/A. | No clearing process; sync is "cap table → chain" (mint/transfer). | **Gap** — New clearing workflow (compare ledgers, resolve disputes, agree net). |
| **C2** Clearing workflow (consistent entries → signed summary) | Provider layer; signing not specified in DeepWiki. | Signing: Documenso + seal_hash; `DOCUMENSO_ONCHAIN_ASSESSMENT.md` — attestation via OASIS. `lib/actions/sync-to-chain.ts`, `lib/actions/dataroom/signing.ts`. | **Partial** — Reuse "sign/attest" concept; clearing output = signed payload (e.g. Merkle) before on-chain. |
| **C3** Persist clearing outcome on-chain or digital signatures | OASIS blockchain providers; attestation discussed in docs. | `oasis-sync.ts`: mint NFTs, record hashes; `oasisTransactionHash` on transactions. `lib/services/oasis-sync.ts`, `DOCUMENSO_ONCHAIN_ASSESSMENT.md`. | **Partial** — Use OASIS to publish signed clearing result (or store attestation); same "write to chain" pattern as cap table sync. |

---

## 7. Dynamic Equity (Slicing the Pie) Integration

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **E1** Integrate with Slicing the Pie (API or manual flow) | N/A. | N/A. | **Gap** — External product integration. |
| **E2** "Cash in" flow: time bank balance → dynamic equity in project | N/A. | Cap table: securities, valuations, transactions. No "time → equity" flow. | **Gap** — New flow: deduct time from balance, add to dynamic equity (likely new service or Slicing the Pie API). |
| **E3** Two paths (via time bank vs direct to dynamic equity); document legal | N/A. | N/A. | **Gap** — Product/legal; document in scope (F1) or separate. |

---

## 8. Oasis Integration (Harish / Cap Table)

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **OAS1** Define joint project with Harish (Oasis cap table) for time bank + dynamic equity | OASIS as platform; cap table is an app on top. | pangea-repo **is** the cap table product (Launchboard); Harish/cap table = this repo. `README.md`, `docs/USER_JOURNEYS.md`. | **Existing** — Scope definition: extend Launchboard/cap table with time bank + dynamic equity; document in project scope (F1). |
| **OAS2** Build interfaces (time bank: onboarding, search, ledger, clearing) | OASIS Web API; Avatar/Data APIs. | Launchboard: cap table UI (overview, stakeholders, securities, transactions), onboarding, dataroom. | **Partial** — Add time-bank-specific screens (balance, ledger, clearing); reuse layout and component patterns. |
| **OAS3** Integrate time bank into OASIS mobile app | N/A (DeepWiki doesn't describe a specific mobile app). | Launchboard is web; `mobile-header.tsx` for responsive UI. No separate native mobile app in repo. | **Gap** — If "OASIS mobile app" is a separate codebase, integrate there; else add responsive/mobile-first time bank views in Launchboard. |
| **OAS4** Dashboard (balance, recent activity, clearing status, dynamic equity) | N/A. | Cap table overview: `(cap-table)/overview/`, hero metrics, synthesis table, ownership chart. `cap-table-hero-metrics`, `cap-table-metric-strip`. | **Partial** — New dashboard for time bank (balance, activity, clearing, equity); reuse dashboard/metrics patterns. |
| **OAS5** Voice/energy invoicing (voice → time bank entries; AI suggest ledger) | N/A. | Document extraction (PDF/text), dataroom chat; no voice. | **Gap** — Add voice capture (e.g. Whisper) → "I did 2h for X" → suggest/create ledger entries; reuse AI extraction pattern. |
| **OAS6** Document and tell the story (stack, user flows, Web2/Web3 split) | DeepWiki + OASIS docs. | `docs/TOKENISATION_HOW_IT_WORKS.md`, `USER_JOURNEYS.md`, `DOCUMENSO_ONCHAIN_ASSESSMENT.md`. | **Partial** — New doc for time bank + Slicing the Pie + OASIS; follow existing docs style. |
| **OAS7** Incremental backend (simple code + story first, then OASIS backend, Web2/Web3 split) | Provider architecture supports incremental backend. | Launchboard already "DB first, OASIS sync optional"; `syncToChain` is incremental. | **Existing** — Same approach: prototype with simple storage, then plug in OASIS and decide on-chain bits. |

---

## 9. Cross-Cutting & Non-Functional

| Task | OASIS / DeepWiki | pangea-repo | Verdict |
|------|------------------|-------------|---------|
| **X1** Design for "zero balance" as target (nudges, suggestions) | Karma has no "target balance" in docs. | No balance-nudge UX. | **Gap** — UX copy and suggestions (give/receive time) to steer toward zero. |
| **X2** Security and privacy (user-controlled data, minimal PII on-chain) | Avatar/auth; Holon storage across providers. | Auth (JWT, session); stakeholder PII in DB; attestation doc discusses minimal on-chain PII. | **Partial** — Apply same principles to time bank (sensitive data local or encrypted); document in F1/X2. |
| **X3** Multi-group support (ledger and clearing per group/circle) | Holon parent-child; no "group" in Avatar. | **Organization** as scope; `orgId` on stakeholders, transactions. Multiple orgs = multiple "groups". | **Partial** — Time bank "circle" could map to org or to a new group/circle entity; reuse org-scoping pattern. |

---

## Summary: Where to Build

| Area | Prefer in OASIS (DeepWiki / upstream) | Prefer in pangea-repo (this repo) |
|------|----------------------------------------|-------------------------------------|
| **Identity** | Avatar + AvatarDetail as canonical identity; link time-bank member to Avatar. | Stakeholder + `oasisAvatarId`; extend with time-bank profile (skills/offers/wants). |
| **Ledger** | KarmaAkashicRecords as "audit trail" pattern; optional Karma-style API for time. | New time-bank ledger (double-entry) in cap-table or new package; reuse transaction-log structure. |
| **On-chain / signing** | OASIS provider + attestation for clearing result / attestation. | `oasis-sync` + existing sync-to-chain pattern; call OASIS for attestation/mint. |
| **UI / flows** | — | All in Launchboard: onboarding wizard, balance view, search, dashboard, (later) voice invoicing. |
| **Search & skills** | Store skills in AvatarDetail.Skills or Holon MetaData. | New skills/offers index and LLM search in Launchboard; optional OASIS storage for portability. |

---

*Sources: [Pan_Galactic_Timebank_Technical_Tasks.md](./Pan_Galactic_Timebank_Technical_Tasks.md), [DeepWiki OASIS](https://deepwiki.com/NextGenSoftwareUK/OASIS), `pangea-repo/` (Launchboard, packages/cap-table, docs).*
