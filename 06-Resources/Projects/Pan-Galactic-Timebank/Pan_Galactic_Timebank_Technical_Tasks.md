# Pan Galactic Timebank — Technical Tasks

Derived from the Pan Galactic Timebank Project transcript. Tasks are grouped by domain and ordered for dependency where relevant.

---

## 1. Foundation & Ownership

| ID | Task | Notes |
|----|------|------|
| F1 | **Define and document the software project scope** for the time bank + dynamic equity stack (on-chain or digital-signature-based, technically and legally owned, commons). | Transcript: "defining a software project, a technical project that we develop... on chain or at least with proper digital signatures... own that infrastructure, put it into the commons." |
| F2 | **Design Web2 vs Web3 split**: which data and flows live in local storage / Web2 vs on-chain (or signed) persistence. Document and implement accordingly. | "which bits are just on web 2 and let's say local storage on your phone... and which bits are kind of put on chain or web 3." |
| F3 | **Evaluate existing time bank software** (databases, time-banking mechanics). Decide: adopt one with a volunteer time broker vs build minimal "add up the numbers" tooling. | "search for some existing time bank software and start using it" vs "buy code something quite quickly and minimally just to add up the numbers." |

---

## 2. Identity & Onboarding

| ID | Task | Notes |
|----|------|------|
| O1 | **Design identity model** for time bank participants: what identifies a person (wallet, email, Oasis identity, etc.) and how it links to time bank data. | "data structures which are associated with your identity." |
| O2 | **Define onboarding data schema**: skills, offers, short offers, wants (things they want to learn), and any metadata needed for matching. | "mapping their skills, their offers and wants and short offers and wants." |
| O3 | **Build sign-up / onboarding flow** that captures skills, interests, and wants (target ~1 hour equivalent; can be async). | "sign up process where you map someone's skills... and their interests, things they want to learn." |
| O4 | **Implement AI-assisted onboarding**: use an LLM to augment the interview (e.g. from freeform notes or voice), and output structured data that populates the onboarding schema. | "that should be AI assisted, augmented, and it should create some data structures which are associated with your identity." |
| O5 | **Support time broker role** in software: allow a human broker to run entries, take audio notes, type in data, and onboard people; design for a team of volunteer brokers. | "volunteer time broker to do the entries and take the audio notes and type things in and energize it and explain things and onboard people." |

---

## 3. Search & Discovery (Skills Matching)

| ID | Task | Notes |
|----|------|------|
| S1 | **Implement skills/offers/wants index** (searchable by skill, location, and tags such as "advise", "code", "mediate", "teach"). | Search examples: Barcelona, decentralized storage, ZK/privacy, front-end UX, Cursor/Claude code, group facilitation, dispute mediation. |
| S2 | **Build LLM-driven search**: user describes need in natural language; system interprets and queries the skills index (and optionally external sources). | "you should be able to speak to your LLM and then it should go and find someone in your network." |
| S3 | **Support "find in my network"**: search restricted to onboarded time bank members. Return matches with profile/contact. | "find someone in your network." |
| S4 | **Support "find externally"**: discover people outside the current network (e.g. public profiles, other time banks) and support inviting them into the network. | "find people out there on the internet which we can also invite to the network." |
| S5 | **Design and implement skill taxonomy/tags** that cover the examples in the transcript (location, topic, activity type: advise, code, research, mediate, teach, etc.). | So that natural language queries map to structured filters. |

---

## 4. Ledger, Invoicing & Balances

| ID | Task | Notes |
|----|------|------|
| L1 | **Design ledger data model**: per-user balance, transaction history (credits, debits), counterparty, reference (e.g. project or task). Ensure it can be reconciled and signed for clearing. | "bank account like interface... table which shows what your current balance is and what your previous transactions are." |
| L2 | **Build "bank account" UI**: current balance, list of past transactions, running total that matches current balance. | "spreadsheet bank account should total up to show the current balance." |
| L3 | **Implement credit limit** per account and enforce it (no spending/transfer beyond limit without work or borrow). | "it should have a credit limit which is all good... if you need more credit... you either have to work or you have to borrow." |
| L4 | **Implement invoicing**: create invoices for time given/received; link to ledger entries (credit one side, debit the other). | "the usual things of currency transaction... the invoicing and the payment and the balances." |
| L5 | **Implement payment/transfer flow**: settle agreed time (e.g. after work) by creating matching ledger entries and updating both balances. | Part of "invoicing and the payment." |
| L6 | **Design and implement borrowing**: borrowing against pledges; ledger entries and balance impact; optional integration with clearing. | "The borrowing function is a new thing that we're adding to the time banks. Borrowing is backed by pledges." |

---

## 5. Local / User-Controlled Data & UX

| ID | Task | Notes |
|----|------|------|
| D1 | **Support locally hosted / user-controlled balance (and optionally ledger)**: user "in charge of that data" (e.g. local-first or user-held credentials). | "you want your own balance... locally hosted... you want to be in charge of that data." |
| D2 | **Transaction history → people**: from a transaction, link to counterparty profile; support "who did I work with on X?" via search. | "who was it that I worked with on that interface like a year ago. Search. Oh there are these four people." |
| D3 | **Implement "click through" from balance/ledger to profile and messaging**: view counterparty, past work, and send message (e.g. "Are you available to help with some other stuff?"). | "Click on it. Message them. Are you available to help with some other stuff." |

---

## 6. Clearing & On-Chain / Signed Settlement

| ID | Task | Notes |
|----|------|------|
| C1 | **Design clearing process**: e.g. weekly reconciliation of ledgers within a group; compare entries, resolve disputes, agree on net positions. | "my ledger and the other people in my group's ledger... probably once a week are checked against each other." |
| C2 | **Implement clearing workflow**: ensure all entries are consistent, then produce a signed/authoritative summary (e.g. signed payload or Merkle structure). | "Make sure that all the entries are right and then kind of signed and cleared." |
| C3 | **Persist clearing outcome on-chain or via digital signatures**: publish signed clearing result so it's verifiable and immutable. | "and then blockchain basically in some way." |

---

## 7. Dynamic Equity (Slicing the Pie) Integration

| ID | Task | Notes |
|----|------|------|
| E1 | **Integrate with Slicing the Pie (or equivalent)**: use their software (e.g. subscription), document API or manual flow for dynamic equity. | "use the software from the Slicing the Pie guy, pay our 20 pound a month... and also reach out to and interview him." |
| E2 | **Design "cash in" flow from time bank to dynamic equity**: during weekly clearing, allow user to deduct time from positive balance and add equivalent value to dynamic equity in a project. | "during the kind of weekly... review and clearing of the time bank it's possible to cash in... the time that you've done... Detect it from your balance... and then add it to the dynamic equity you own in the project." |
| E3 | **Support two paths**: (A) time bank → clear → then allocate to dynamic equity; (B) direct allocation to dynamic equity. Prefer (A) per transcript; document legal implications. | "You either go through the time bank or you go straight into the dynamic equity. I would prefer it go through the time bank... might have some legal implications." |

---

## 8. Oasis Integration (Harish / Cap Table)

| ID | Task | Notes |
|----|------|------|
| OAS1 | **Define joint project with Harish (Oasis cap table)** for time bank + dynamic equity: scope, interfaces, and Oasis backend. | "bring him in and we should define a project with him to build this our own software for it." |
| OAS2 | **Build interfaces** for time bank (onboarding, search, ledger, clearing) that can run against Oasis backend and/or local storage. | "on Oasis to build the interfaces." |
| OAS3 | **Integrate time bank into the Oasis mobile app**: same flows (balance, search, messaging) in mobile UX. | "build that into the mobile app that we use." |
| OAS4 | **Build dashboard**: single view for balance, recent activity, maybe clearing status and dynamic equity. | "to do the graphic kind of like dashboard." |
| OAS5 | **Implement voice/energy invoicing**: capture voice (or "energy") input and turn it into time bank entries (e.g. "I did 2 hours for X"); consider AI to transcribe and suggest ledger entries. | "to do the kind of voice energy invoicing and to vibe code that into the kind of Oasis thing." |
| OAS6 | **Document and tell the story**: write up the stack (time bank + Slicing the Pie + Oasis), user flows, and Web2/Web3 split for stakeholders. | "to then write up and tell a story about that." |
| OAS7 | **Incremental backend**: start with "simple code" and story; once validated, implement Oasis backend and decide which bits are on-chain vs local. | "create the interfaces and the story, test it out like simple code and then when we like that code to then do the Oasis back-end part." |

---

## 9. Cross-Cutting & Non-Functional

| ID | Task | Notes |
|----|------|------|
| X1 | **Design for "zero balance" as target**: UX and nudges (e.g. suggestions to give or receive time) so users tend toward zero. | "you should be aiming for kind of zero in your account." |
| X2 | **Security and privacy**: identity, ledger, and messaging in line with "locally hosted" and user control; minimal PII on-chain. | Implied by "in charge of that data." |
| X3 | **Multi-group support**: ledger and clearing are described per group; ensure data model and UX support multiple groups or "circles." | "my ledger and the other people in my group's ledger." |

---

## Suggested Implementation Order

1. **Foundation**: F1–F3 (scope, Web2/Web3 split, existing vs greenfield).
2. **Data & identity**: O1–O2, L1 (identity, onboarding schema, ledger model).
3. **Minimal viable**: O3–O4, L2–L5, D1–D2 (onboarding, balance UI, invoicing/payments, local data, transaction→people).
4. **Discovery**: S1–S5 (skills index, LLM search, network + external).
5. **Borrowing & clearing**: L6, C1–C3 (borrowing, clearing workflow, on-chain/signed).
6. **Dynamic equity**: E1–E3 (Slicing the Pie, cash-in flow).
7. **Oasis**: OAS1–OAS7 (Harish project, interfaces, mobile, dashboard, voice invoicing, story, backend).

---

*Source: [Pan_Galactic_Timebank_Project_Transcript.md](https://github.com/NextGenSoftwareUK/PGT/blob/main/Pan_Galactic_Timebank_Project_Transcript.md) (in PGT repo).*
