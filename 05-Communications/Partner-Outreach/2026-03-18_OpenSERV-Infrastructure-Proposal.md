# Proposal: OpenSERV × OASIS × Hitchhikers — Infrastructure Partnership

**From:** Max Gershfield (OASIS)
**To:** Tim Hafner (OpenSERV)
**Date:** March 2026
**Re:** Infrastructure proposal + budget ask — *Save the Planet with Zaphod*

---

## The opportunity in one line

OASIS and Hitchhikers have already built the infrastructure stack that *Save the Planet with Zaphod* needs to run. We're proposing a paid infrastructure partnership — not a creative agency relationship — with a costed delivery plan tied directly to OpenSERV's Builders Fund.

---

## What we've already shipped

These are live, working tools — not concepts:

| Tool | What it does | Status |
|---|---|---|
| **Heart of Gold** — builder onboarding | Voice-driven onboarding flow (Marvin AI), avatar creation, OASIS identity, dashboard | Live: [heart-of-gold.vercel.app](https://heart-of-gold.vercel.app) |
| **Pan Galactic Monitor** | Global intelligence globe — live map of sites, pledges, guides, builders, hackathons | Running locally; Vercel deploy in progress |
| **OASIS Avatar / Holon layer** | Persistent holonic identity: builder profiles, NFT certification, guide authorship, skill graph | API live at api.oasisweb4.one |
| **Pan Galactic Timebank** | Time-banking infrastructure — circles, pledges, hour exchanges, `$SAFE` token hook | Architecture complete; P1 wiring in progress |
| **Character agents (Marvin, Zaphod, Trillian)** | OpenSERV-compatible AI agents, ElevenLabs voice, GPT-4o reasoning, x402 micropayments | Marvin running in Heart of Gold |

This stack is the **nervous system** for the program — tracking who's building, what they're pledging, which guides are growing, where the $SAFE tokens are flowing.

---

## What OASIS/Hitchhikers bring that the brief doesn't yet have

The *Save the Planet v2* brief is strong on format, IP, and bursary structure. What it currently lacks — and what we provide — is the **persistent data layer** that makes outputs last beyond each event:

1. **Builder identity that travels** — OASIS holons carry a builder's contributions, skill verifications, guide authorship, and token history *across* events, cohorts, and platforms. Builders aren't reset each hackathon.
2. **Real-time program visibility** — the Pan Galactic Monitor gives OpenSERV, sponsors, and the public a live view of the whole program: hours pledged, guides in progress, token flows, builder geographies.
3. **OpenSERV agent integration** — our character agents (Marvin, Zaphod, Trillian) are already wired to run on OpenSERV's BRAID / x402 stack. Every guide-building session can have an AI guide that logs its reasoning, settles micropayments, and writes outputs to the Anarchive.
4. **Onboarding at scale** — Heart of Gold can onboard a builder in under 5 minutes, create their OASIS avatar, and drop them into the dashboard with a live profile. It's already deployed.

---

## Proposed scope — Pilot (6 events)

A minimum viable version of the program, de-risked and deliverable by **Q3 2026**:

| Deliverable | Description |
|---|---|
| **Pan Galactic Monitor — P1 complete** | Wire real Pan Galactic Timebank data (hours per circle); deploy publicly; OpenSERV branding panel; live grant/builder tracking |
| **Heart of Gold — 6 cohorts** | Onboard up to 500 builders across 6 events; create OASIS avatars; builder dashboards live |
| **Marvin agent — OpenSERV integration** | Marvin running on OpenSERV BRAID stack; x402/USDC micropayment settlement per guide session; `lastOutput` logged to Anarchive |
| **Builder identity infrastructure** | OASIS holon creation for every builder; skill graph; guide authorship NFT on completion; exportable portfolio |
| **Program dashboard for OpenSERV** | Private view: real-time cohort health, builder count, guide progress, Builders Fund disbursement tracker |

---

## Budget — Pilot (6 events, ~6 months)

This is a **delivery budget for infrastructure and integration work**, not a creative/agency fee.

| Line | Description | Cost (USD) |
|---|---|---|
| **Platform hosting + ops** | Vercel, OASIS API, database, CDN — 6-month runway | $8,000 |
| **Pan Galactic Monitor P1–P3** | Timebank API wiring, SSE production, guide/builder data, public deploy, OpenSERV panel | $18,000 |
| **Heart of Gold — onboarding scale** | Load testing, mobile hardening, multi-cohort config, OpenSERV branding integration | $12,000 |
| **OASIS holon infrastructure** | Builder avatar creation at scale, NFT certification, skill graph, Anarchive writes | $20,000 |
| **Marvin / character agent — OpenSERV integration** | BRAID wiring, x402 micropayment flow, guide session logging, voice + reasoning pipeline | $16,000 |
| **Builder dashboard — program analytics** | OpenSERV-facing cohort health panel, disbursement tracker, guide progress views | $10,000 |
| **Project coordination + documentation** | Sprint planning, partner comms, technical documentation, guide publishing pipeline | $16,000 |
| **Contingency (10%)** | Buffer for scope changes and third-party API costs | $10,000 |
| **Total — Pilot** | | **$110,000** |

> **Suggested draw from Builders Fund: $110,000** — this is ~11% of the $1M fund, delivering the core infrastructure for 6 events, up to 500 builders, and the full data architecture for Year 1.

---

## Budget — Full program (42 events, 18 months)

If the pilot validates (Q3 2026), the full program scale:

| Phase | Scope | Cost |
|---|---|---|
| **Pilot** (above) | 6 events, 500 builders, core infra | $110,000 |
| **Scale — Year 1** | 20 events, 2,000 builders, Burning Man integration, full Anarchive, `$SAFE` launch | $220,000 |
| **Scale — Year 2** | 42 events, 5,000+ builders, university embeds, IXO integration, OASIS v2 | $220,000 |
| **Total — Full program** | | **$550,000** |

> This leaves ~$450,000 of the Builders Fund for bursaries, prizes, marketing, and event production costs — aligned with the £2.4M total program ask.

---

## On Wolfgang Creative Capital

Wolfgang bring genuine value — creative direction, European positioning, visual identity — and remain named partners. What the current brief lacks is a **separate, costed technical infrastructure line**. We're proposing that line.

The creative direction brief (Wolfgang) and the infrastructure brief (OASIS/Hitchhikers) are complementary, not competing. Both should appear in the Builders Fund allocation.

---

## What we need from OpenSERV

This is a two-part ask:

1. **Builders Fund allocation — $110K pilot tranche.** A letter of intent or brief contract covering the pilot scope above. We can start immediately; most of the stack is already running.

2. **OpenSERV API access for Marvin agent integration.** Direct contact with your BRAID / agent SDK team to wire Marvin as a compliant OpenSERV agent (x402, USDC, ERC-8004 hooks). This unlocks the full agent economy layer of the program.

---

## Why now

- Heart of Gold is **live and deployed**. There is no "build phase" — it's running.
- The Pan Galactic Monitor is **running locally** with real data, 10 confirmed sites, character agents, and a globe view. One sprint from public launch.
- OASIS avatar creation is **API-live** and already wired into the onboarding flow.
- The Burning Man 2026 capstone is **5 months away**. To have 6 cohorts run through the program and produce real guides by Burning Man, we need to start onboarding builders in **April/May**.

The infrastructure is not the risk. The risk is waiting.

---

## Proposed next step

A 45-minute call with Tim to walk through the live demos — Heart of Gold onboarding, Pan Galactic Monitor globe, Marvin agent — and agree on the pilot tranche.

**Demo links:**
- Heart of Gold (live): https://heart-of-gold.vercel.app
- Pan Galactic Monitor (local): `cd OASIS_CLEAN/Hitchhikers/Pan_Galactic_Monitor && npm start`

---

*Prepared by Max Gershfield — OASIS | max@oasisweb4.one*
