# Babelfish — Trust Graph Build Spec

*Two concrete implementation plans:*
*1. Open Integrity SSH signing for avatar-to-platform identity links*
*2. Hackathon-as-trust-graph — the Builders Fund funding model*

*For: Mitchell Travers (Soulbis) · Tim Hafner (OpenSERV) · Max Gershfield (OASIS)*

---

## Part 1 — Open Integrity SSH Signing

### What this solves

Right now when a user connects their Discord or Telegram to a Babelfish identity, the link is stored in OASIS — but it is a trust-me record. There is no cryptographic proof that the person who owns the Discord handle is the same person who controls the OASIS avatar. Anyone with access to the OASIS database could fabricate the link.

Open Integrity (Christopher Allen's protocol) makes the link **self-sovereign and verifiable by anyone** — no central authority required, no database to query. The same model used by Git commit signing, extended to identity claims.

---

### The key ceremony — user flow

```
1. User types /identity in any Babelfish channel
        │
        ▼
2. Babelfish sends them a private onboarding link
   (babelfish.oasisweb4.one/identity/ceremony)
        │
        ▼
3. User provides their SSH public key
   — options: paste existing key, generate new one in-browser, or use hardware key (YubiKey)
        │
        ▼
4. Babelfish generates a DID document:
   {
     "@context": "https://www.w3.org/ns/did/v1",
     "id": "did:key:<ssh-public-key-fingerprint>",
     "verificationMethod": [{
       "id": "did:key:<fingerprint>#<fingerprint>",
       "type": "Ed25519VerificationKey2020",
       "controller": "did:key:<fingerprint>",
       "publicKeyMultibase": "<key>"
     }],
     "authentication": ["did:key:<fingerprint>#<fingerprint>"]
   }
        │
        ▼
5. Babelfish generates a claim to sign:
   "I confirm: Discord:<handle> = Telegram:<handle> = OASIS:<avatarId>
    Signed at: <timestamp> | Nonce: <uuid>"
        │
        ▼
6. User signs the claim with their SSH private key:
   ssh-keygen -Y sign -f ~/.ssh/id_ed25519 -n babelfish-identity <claim-file>
   — or: browser-based signing if they used the in-browser key generator
        │
        ▼
7. Babelfish receives the signature and verifies it against the public key
        │
        ▼
8. Signed identity claim stored:
   — On the OASIS avatar record (alongside existing platform links)
   — Published to IPFS (content-addressed, permanent, public)
   — Optional: anchored on-chain via OASIS Universal Asset Bridge
        │
        ▼
9. User receives their identity certificate:
   A URL: babelfish.oasisweb4.one/identity/<did>
   Anyone can visit this and verify the claim without trusting Babelfish
```

---

### Data model additions

**Avatar record extension** (OASIS `IAvatar`):

```csharp
public class BabelfishIdentity
{
    public string Did { get; set; }              // did:key:<fingerprint>
    public string SshPublicKeyFingerprint { get; set; }
    public string SignedClaim { get; set; }      // the raw signed claim blob
    public string ClaimIpfsCid { get; set; }    // IPFS content ID of the published claim
    public DateTime SignedAt { get; set; }
    public string OnChainTxHash { get; set; }   // optional, if anchored
    public bool IsVerified { get; set; }
    public Dictionary<string, string> PlatformHandles { get; set; }
    // { "discord": "username#1234", "telegram": "@handle", "xmtp": "0x...", ... }
}
```

**New OASIS API endpoint:**

```
POST /api/babelfish/identity/claim
  Body: { avatarId, did, signedClaim, platforms }
  Returns: { claimId, ipfsCid, verificationUrl }

GET /api/babelfish/identity/<did>
  Returns: full identity record — public, no auth required
  Verifiable by anyone against the public key embedded in the DID

GET /api/babelfish/identity/verify?discord=<handle>
  Returns: { verified: true/false, did, avatarId, linkedAt }
```

---

### VRC — the bilateral upgrade

Once Open Integrity is in place, every promise in Babelfish can become a **Verifiable Relationship Credential**. This is the bilateral upgrade:

**Current flow (one-sided):**
```
User A says "I'll have the PR done by Friday"
→ Babelfish detects commitment language
→ PromiseHolon created (stored on User A's avatar)
```

**VRC flow (bilateral):**
```
User A says "I'll have the PR done by Friday"
→ Babelfish detects commitment language
→ Drafts a PromiseHolon and notifies User B: "User A made a promise to you. Accept?"
→ User B types /accept @UserA or the promise is logged unilaterally (lower trust weight)
→ On completion: User A types /fulfilled @UserB "PR merged — link: github.com/..."
→ User B confirms: /confirmed @UserA
→ BOTH avatars receive a bilateral VRC:
  {
    "type": "VerifiableRelationshipCredential",
    "promiser": "did:key:<UserA>",
    "promisee": "did:key:<UserB>",
    "promise": "PR merged by Friday",
    "evidence": "github.com/...",
    "fulfilledAt": "<timestamp>",
    "signatures": { "promiser": "<sig>", "promisee": "<sig>" }
  }
→ VRC published to IPFS and stored on both avatars
→ Trust graph line between User A and User B hardens
```

The line between them is now **cryptographically verifiable** by anyone in the world. No centralised authority. No database to trust.

---

### Build phases

**Phase 1 — Foundation (Week 1–2)**
- [ ] Add `BabelfishIdentity` model to OASIS Data API
- [ ] Build `/identity` command in Babelfish that generates the claim text
- [ ] Implement SSH signature verification in the OASIS API backend (libsodium / OpenSSL)
- [ ] IPFS publishing via existing OASIS IPFS provider
- [ ] Public verification endpoint: `GET /api/babelfish/identity/<did>`

**Phase 2 — Key ceremony UI (Week 2–3)**
- [ ] Build `babelfish.oasisweb4.one/identity/ceremony` page
- [ ] Browser-based Ed25519 key generation (WebCrypto API) for users without existing SSH keys
- [ ] Guided flow: generate → sign → submit → receive certificate
- [ ] QR code for the certificate URL (shareable, scannable)

**Phase 3 — VRC loop (Week 3–4)**
- [ ] Promise detection in Babelfish (LLM-based, opt-in)
- [ ] `/accept`, `/fulfilled`, `/confirmed` commands
- [ ] Bilateral VRC schema and issuance
- [ ] VRC stored on both avatars, published to IPFS
- [ ] Trust graph weight update on VRC issuance

**Phase 4 — Discovery (Week 4+)**
- [ ] `babelfish.oasisweb4.one/identity/<did>` public profile page
- [ ] Trust graph visualiser: show the constellation of relationships
- [ ] Search: `GET /api/babelfish/identity/verify?discord=<handle>` — let anyone verify a link

---

## Part 2 — Hackathon-as-Trust-Graph

### The reframe

Standard hackathons fund **outputs** — a demo, a prototype, a pitch deck. The mercenary dynamic this creates: teams compete instead of collaborate, hoard knowledge to protect their winning chances, and disperse after the event with no lasting relationships.

Mitchell's insight: **the trust graph a hackathon generates is worth more than any individual output.** The relationships formed, the promises made and kept, the collaboration lines drawn — these compound over years. Fund *those*.

This spec describes how to run the OpenSERV Builders Fund as a trust-graph-funded hackathon, using Babelfish as the identity layer and the Pan Galactic Timebank as the accounting system.

---

### The star model

Each participant (or team) is a **star** — a node in the knowledge graph. Before the hackathon begins:

1. **Nodes are pre-allocated** — Builders Fund admins create N star slots in the system (one per expected participant / team)
2. **Stars are seeded with bounties** — each node is tagged with the thing the community needs built:
   - "ZK proof interface for trust graph claims"
   - "XMTP integration for Babelfish"
   - "Promise detection LLM — opt-in, privacy-preserving"
   - "VRC bilateral credential schema"
   - etc.
3. **Participants claim stars** — "I'll take this node. Here's my skill set. Here's my existing work."
4. **Participants draw lines** — cross-promises between stars:
   - "If you build the ZK interface, I promise to consume it and build the proof-of-participation claim on top"
   - "I pledge 20 hours to help your node if you hit a blocker on the XMTP integration"
5. **Work happens** — builders build
6. **Lines harden** — promises fulfilled, VRCs issued, trust graph solidifies
7. **Funding is distributed** — weighted by trust graph density, not just output quality

---

### How it maps to existing infrastructure

The Pan Galactic Timebank already has:
- `circle` — maps to a **hackathon cohort**
- `timeBankMember` with `skills` — maps to a **star node** with knowledge attributes
- `timeBankTransaction` (CREDIT/DEBIT) — maps to **time pledged and delivered**
- `GET /api/monitor/circles/:circleId` — live telemetry (hoursPledged7d, activeMembers)

**What needs to be added:**

```
promise table:
  id                  UUID
  circleId            → circle
  promisorMemberId    → timeBankMember (star A)
  promiseeMemberId    → timeBankMember (star B)
  description         TEXT  — "I'll build the ZK proof interface"
  hoursCommitted      DECIMAL
  dueAt               TIMESTAMP
  status              ENUM(pending, accepted, fulfilled, broken, disputed)
  vrcCid              TEXT  — IPFS CID of the issued VRC (set on fulfillment)
  createdAt           TIMESTAMP
  fulfilledAt         TIMESTAMP

node (star) table:
  id                  UUID
  circleId            → circle
  memberId            → timeBankMember
  bountyTag           TEXT  — the thing this star is building
  knowledgeSummary    TEXT  — what this person/team knows and is contributing
  trustScore          DECIMAL  — computed field, updated on promise events
  createdAt           TIMESTAMP
```

**Trust score formula (per node):**

```
trustScore =
  (promisesMade × 0.1)           -- having skin in the game
  + (promisesKept × 1.0)         -- delivery matters most
  + (promisesReceived × 0.3)     -- others trust this node enough to promise to it
  + (hoursDelivered × 0.05)      -- time contributed
  + (vrcsIssued × 2.0)           -- bilateral verifiable credentials = strongest signal
  - (promisesBroken × 1.5)       -- breaking promises hurts more than keeping helps
```

**Builders Fund allocation formula:**

```
allocation_i = (trustScore_i / Σ trustScore) × totalFundingPool
```

With a floor: every node that shows up, makes at least one promise, and delivers some hours gets a minimum allocation (e.g. 10% of pool divided equally). The trust-weighted top-up is the incentive for real collaboration.

---

### New API endpoints

```
POST /api/monitor/circles/:circleId/promises
  Body: { promisorId, promiseeId, description, hoursCommitted, dueAt }
  Returns: { promiseId, status: "pending" }

POST /api/monitor/circles/:circleId/promises/:promiseId/accept
  Body: { promiseeId }
  Returns: { status: "accepted" }

POST /api/monitor/circles/:circleId/promises/:promiseId/fulfill
  Body: { promisorId, evidenceUrl }
  Returns: { status: "awaiting_confirmation" }

POST /api/monitor/circles/:circleId/promises/:promiseId/confirm
  Body: { promiseeId }
  Returns: { status: "fulfilled", vrcCid: "ipfs://..." }

GET /api/monitor/circles/:circleId/trust-graph
  Returns: { nodes: [...], edges: [...], trustScores: {...} }
  — the full graph for visualisation

GET /api/monitor/circles/:circleId/allocation
  Returns: { allocations: [{ memberId, trustScore, allocation, percentage }] }
  — what each node would receive if the fund distributed today
```

---

### Babelfish commands

```
/star claim <bountyTag>          — claim a pre-allocated star node
/star describe <text>            — add knowledge summary to your node
/promise @username <description> — make a promise to another star
/fulfilled @username [evidence]  — declare a promise fulfilled, trigger confirmation request
/confirmed @username             — confirm fulfillment, issue VRC
/trust-graph                     — show your current trust graph in the channel
/allocation                      — show current projected funding allocation for this circle
```

---

### Monitor dashboard additions

The Pan Galactic Monitor currently shows per-circle telemetry (hoursPledged, activeMembers). Add:

| New metric | Source |
|---|---|
| **Promises made** | `promise` table, count where circleId = x |
| **Promises kept** | count where status = fulfilled |
| **Promise keep rate** | kept / made × 100% |
| **VRCs issued** | count where vrcCid is not null |
| **Trust graph density** | edges / (nodes × (nodes-1)) — how connected the cohort is |
| **Projected allocations** | live distribution preview per node |

---

### The Builders Fund operating model

**Before the hackathon (Day 0):**
- Tim (OpenSERV) seeds the star slots with bounty tags
- Participants apply and claim stars
- Fund pool size is announced (e.g. $60K from Builders Fund)
- Minimum floor allocation is set (e.g. 10% shared equally = $6K / N participants)

**During the hackathon (Days 1–N):**
- Builders work in their Babelfish circles
- Every promise made is logged
- Every promise fulfilled → VRC issued, trust graph line hardens
- Monitor dashboard shows live trust graph and projected allocations
- Transparency is the incentive: everyone can see who is building relationships and who is ghosting

**After the hackathon:**
- Final trust scores computed
- Allocation table published to the circle
- Fund distributed: floor allocation + trust-weighted top-up
- Full trust graph published as a public artifact (IPFS)
- Builders carry their VRC constellation to the next hackathon — **reputation is portable**

---

### What this changes for OpenSERV

The pitch to Tim in one paragraph:

> *"Instead of funding demos that die in 48 hours, the Builders Fund generates a verifiable trust graph that compounds over years. Every hackathon participant who ships a promise builds a portable reputation. The next time they show up — to another OpenSERV cohort, to a Hitchhikers quest, to a Babelfish bridge partnership — their VRCs travel with them. The fund isn't just distributing cash. It's minting the trust infrastructure of the agent economy."*

---

### Open questions (for the 30-min call with Mitchell and Tim)

1. **Minimum floor vs. trust-weighted split** — what's the right ratio? 50/50? 80/20?
2. **Promise granularity** — should micro-promises (< 1 hour) count? Or only substantive commitments?
3. **Dispute resolution** — what happens when a promise is declared fulfilled but the promisee disagrees?
4. **Agent promises** — can Marvin make and keep promises in this system? (Mitchell says yes — agents accumulate trust the same way humans do)
5. **Cross-cohort portability** — how do VRCs from Cohort 1 carry into Cohort 2's allocation model?

---

*March 2026 · OASIS × Hitchhikers × OpenSERV*
*Next step: 30-min call — Max + Mitchell + Tim. Share this doc first.*
