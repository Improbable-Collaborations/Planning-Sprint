# Pan Galactic Timebank — Scope (Phase 1)

One-pager: time bank + dynamic equity vision and Phase 1 scope.

---

## Vision

**Pan Galactic Time Bank** is a separate project (lives in `Hitchhikers/Pan_Galactic_Timebank/`) that lets communities track time exchanges (hours given/received) and, later, connect to **dynamic equity** (e.g. Slicing the Pie) and **OASIS** (identity, attestation, on-chain clearing). We reuse UI and patterns from pangea-repo where useful; we do not build inside Launchboard.

---

## Phase 1 — Minimal Viable Time Bank (Current)

**Goal:** A user can identify (PGT member linked to OASIS Avatar), see a time bank balance, and record a time exchange (I gave X hours to Y / I received X hours from Y). All data in PGT app DB; no OASIS sync yet.

- **Identity:** PGT member model (`time_bank_member` with `oasisAvatarId`, `displayName`, `circleId`). Optional `circle` for multi-community. Auth: "sign in with OASIS" or simple session; Phase 1 can use a dev/mock identity.
- **Ledger:** Append-only `time_bank_transaction` (memberId, counterpartyId, amount hours, type CREDIT/DEBIT, balanceAfter, effectiveDate, reference). Balance derived from transactions (or cached in `time_bank_balance`).
- **Actions:** Get balance, list transactions, record time exchange (creates two rows: debit for giver, credit for receiver).
- **UI:** Time bank dashboard (balance + transaction list + "Record exchange" form).

**Phase 1 = balance + ledger + identity in PGT app, Web2-first.**

---

## Web2 vs Web3

- **Phase 1:** All time-bank data in PGT app DB (SQLite or PostgreSQL). No on-chain persistence.
- **Phase 2+:** Clearing result (e.g. weekly reconciliation) can be signed and optionally published via OASIS (attestation or on-chain). Identity remains linked to OASIS Avatar.

---

## Out of scope for Phase 1

- Full OASIS backend sync (Karma, Holon storage).
- On-chain clearing, credit limits, invoicing.
- Skills/offers/wants onboarding and search.
- Dynamic equity (Slicing the Pie) integration.
- Voice/energy invoicing.

---

*See [BUILD_PLAN_OASIS.md](./BUILD_PLAN_OASIS.md) for full phased plan.*
