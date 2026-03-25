# Babelfish — Identity Architecture
### How OASIS × BRAID × Soulbis build the trust graph

*For: Mitchell Travers (Soulbis) · Tim Hafner (OpenSERV)*

---

## The core claim

Every time someone communicates, they are expressing identity. Babelfish captures that — not by surveilling it, but by letting the communication itself build a sovereign, portable identity graph over time.

This is Mitchell's 3Graphs1Identity framework made real through everyday messaging.

---

## The three graphs, mapped to Babelfish

### 1. Knowledge Graph — what you know and share

Every message sent through Babelfish is a knowledge expression. Over time, patterns emerge:
- Which topics does this person discuss?
- Which communities do they participate in?
- What skills, domains, or languages do they communicate in?

Babelfish doesn't parse meaning intrusively — it logs *participation*, not content (by default). The user controls disclosure level. ZK proofs can allow proving "this person participates in regenerative agriculture circles" without revealing what was said.

**OASIS hook:** Each OASIS avatar has a `karma` system and a `Holon` data model. Babelfish writes participation holons (platform, channel type, interaction count) to the avatar — privately by default, selectively disclosed.

### 2. Promise Graph — commitments made and kept

This is where Babelfish gets genuinely powerful. Conversations are full of implicit and explicit commitments:
- "I'll have that done by Friday"
- "I'm joining the circle"
- "I pledge 42 hours to the quest"

Babelfish can detect commitment language (via LLM parsing, opt-in) and create a `PromiseHolon` — a verifiable record that a commitment was made. When the commitment is fulfilled (or broken), the holon is updated.

Over time, a **Promise Graph** emerges: who promises what, to whom, and whether they keep it. This is proof of trustworthiness that no centralised platform can manufacture or fake.

**OASIS hook:** PromiseHolons stored via the OASIS Data API. Avatar karma adjustments on promise fulfillment/breach. BRAID's agent/data/inference axes apply directly.

### 3. Trust Graph — the emergent intersection

The trust graph is not built by Babelfish — it *emerges* from the combination of Knowledge and Promise graphs, plus social vouching (stake FISH to vouch for an identity).

BRAID's formula: `Trust = f(Knowledge × Promise × Time × Verification)`

As this accumulates, a Babelfish user gains:
- **Portable proof of personhood** — without iris scans or KYC forms
- **Verifiable reputation** — across platforms, cryptographically signed
- **Selective disclosure** — prove a property of your trust graph (e.g. "active community member for 12+ months") without revealing specifics

---

## The identity flow

```
User sends message (Discord / Telegram / WhatsApp / XMTP / ...)
        │
        ▼
Babelfish resolves OASIS avatar
  (via platform handle → avatar link)
        │
        ▼
Message routed to all bridged platforms
        │
        ├── Knowledge Holon updated (participation logged)
        │
        ├── Promise detection (opt-in LLM scan)
        │   └── If commitment detected → PromiseHolon created
        │
        └── Trust Graph updated
            (weighted by platform, consistency, stake)
```

---

## Privacy model

Babelfish follows OASIS's bottom-up data sovereignty principles:

| Layer | Default | User-controlled |
|---|---|---|
| Message content | **Never stored** by Babelfish | User can opt-in to personal archive |
| Participation metadata | **Stored privately** on user's OASIS avatar | Selectively disclosed |
| Promise holons | **Stored privately** | Shared with counterparty on consent |
| Trust graph | **Computed locally / on-avatar** | Exported as ZK proof |
| Public display | **Nothing** by default | User chooses what to surface |

ZK proofs (using Aztec/Miden OASIS providers — already in the codebase) allow proving properties of the trust graph without revealing the underlying data. "This person has maintained active community participation for 18 months" — provable without revealing which communities or what was said.

---

## The FISH token as identity stake

The $FISH token turns the trust graph into an economic game:

1. **Vouching:** Stake FISH to vouch for another identity link (e.g. "this Discord user IS this wallet"). If verified over time, earn yield. If proven false, get slashed.

2. **Identity verification threshold:** Certain capabilities unlock at FISH-stake thresholds — similar to how credit scores unlock financial products. But this is a *trust score* built from real communication, not a centralised score.

3. **Platform bridging reward:** Communities that route through Babelfish earn FISH for the bridge operator. This incentivises building and maintaining bridges — an economic layer that ensures Babelfish grows faster than any centralised alternative.

---

## Integration with Hitchhikers / Fabulous Machine

The Fabulous Machine explicitly requires:
- Sovereign identity (passports)
- Circle formation and commitment tracking
- Trust levels between individuals and groups
- Gradients of transparency and disclosure

Babelfish is the communication nervous system for all of these. When a Hitchhikers builder:
- Joins a circle → Knowledge Holon created
- Makes a 42-hour time pledge → PromiseHolon created
- Completes a quest → Trust Graph updated, karma awarded
- Vouches for another builder → FISH staked, Trust Graph line hardened

The entire Fabulous Machine's social architecture accumulates *automatically* through normal communication — no extra forms, no separate identity system, no centralised database.

**This is the missing coordination layer.** Hitchhikers is operating across dozens of circles on multiple continents. OpenSERV is running a $1M Builders Fund program across builders who have never met. Both face the same bottleneck: how do you build genuine trust between people who don't share a platform or a timezone? Every governance decision, resource allocation, and quest assignment depends on trust that currently lives only in people's heads. The BRAID trust graph, accumulating through every Babelfish interaction, brings that metric online for the first time — making digital trust a measurable, portable, sovereign asset.

**Burning Man 2026 is five months away.** For six Hitchhikers cohorts to arrive at the playa as a coordinated network — people who know each other, trust each other, with a verifiable record of that trust — the system has to be embedded in their daily practice now. The trust graph only has value if it has been accumulating. That means starting in April, not August.

---

## What we need from BRAID / Soulbis

1. **BRAID agent wiring for Babelfish** — run Babelfish itself as a BRAID-compatible agent with its own identity and inference layer
2. **SSH key signing integration** — Mitchell's Open Integrity/DID work → Babelfish identity links signed and verifiable via commit-style signing
3. **ZK proof interface** — define the proof schema for trust graph claims (e.g. `ProofOfParticipation`, `ProofOfPromiseRecord`)
4. **3-graph data schema** — agree on the holon data model for Knowledge, Promise, and Trust holons in the OASIS Data API

---

## Immediate next steps

Burning Man is five months away. OpenSERV cohort onboarding starts in April. The trust graph only has value if it has been accumulating — which means these decisions need to happen this week, not next quarter.

- [ ] Mitchell joins Babelfish Telegram/Discord channel to see the live bridge (today)
- [ ] Agree on PromiseHolon data schema (30-min call this week)
- [ ] Wire Marvin agent (OpenSERV) as first non-human Babelfish participant
- [ ] Draft ZK proof interface for trust graph claims
- [ ] BRAID wire spec for Babelfish agent identity
- [ ] Confirm Hitchhikers cohort 1 onboarding date — trust graph accumulation starts from first use

---

*"BRAID is both the technical rail our agents run on and the research foundation for the identity and trust layer underneath the whole program."*  
— BRAID document, March 2026

Babelfish is the product that makes that layer visible, useful, and economically sustainable.

---

*Max Gershfield · max@oasisweb4.one*
