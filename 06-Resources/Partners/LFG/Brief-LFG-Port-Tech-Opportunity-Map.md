# Brief: LFG — Port Tech Opportunity Map (West African Maritime & Mining)

**Digital Infrastructure for West African Maritime & Mining Sectors**  
Laissez-Faire Group · March 2026

*Document prepared by LFG Strategic Analysis — March 2026. Confidential — For internal use only.*

---

## Contents

1. [Executive Summary](#executive-summary)
2. [The Gaps → LFG Development Map](#the-gaps--lfg-development-map)
3. [What LFG Should NOT Build (Partner Instead)](#what-lfg-should-not-build-partner-instead)
4. [Competitive Positioning vs. Incumbents](#competitive-positioning-vs-incumbents)
5. [Portfolio Company Synergies](#portfolio-company-synergies)
6. [Revenue Model Summary](#revenue-model-summary)
7. [Implementation Roadmap](#implementation-roadmap)
8. [Regulatory Navigation](#regulatory-navigation)
9. [Financing Structures](#financing-structures)
10. [Appendix: Gap-to-Capability Matrix](#appendix-gap-to-capability-matrix)

---

## Executive Summary

West African port digitization represents a high-conviction opportunity for LFG. The combination of massive infrastructure investment ($2B+ at Abidjan, $73M logistics zone at San Pedro, Ghana’s 24-Hour Economy push), catastrophic systemic inefficiencies ($31B in illicit outflows in Ghana alone), and the absence of modern, interoperable digital systems creates a gap that LFG is uniquely positioned to fill.

This document maps every technology gap identified across the **Port of San Pedro (Côte d’Ivoire)** and **Ghana’s trade facilitation ecosystem**, and proposes concrete LFG development pathways for each.

---

## The Gaps → LFG Development Map

### 1. OCR Gate Cameras & Automated Access Control

**Current State:** Manual container logging, paper-based driver credentials, human-in-the-loop gate operations. High bribery risk, ISPS non-compliance, no audit trail.

**What’s Needed:**

- HD gate cameras with OCR for container numbers and truck license plates
- Automated barrier systems linked to OCR reads
- Driver biometric/digital credential verification at entry/exit
- Real-time logging of all gate events

**LFG Development Path:**

- **BUILD:** Software layer — OCR data ingestion API, gate event management platform, credential verification engine
- **PARTNER:** Hardware (cameras, barriers, sensors) — Axis Communications, Hikvision, or regional system integrators
- **ZKYC Integration:** Driver identity verification using ZKYC as the credential backbone — KYC on port workers, stevedores, truck drivers
- **ZK Pass Integration:** Zero-knowledge proof credentialing — authorize a driver without exposing full identity data

**Revenue Model:** Per-container processing fee + hardware installation markup via partner

---

### 2. Terminal Operating System (TOS)

**Current State:** No digital yard management, vessel scheduling, or cargo tracking within terminals. High dwell times, poor berth utilization, no resource optimization.

**What’s Needed:**

- Yard planning and container slot optimization
- Vessel scheduling and berth allocation
- Real-time cargo position tracking (GPS/RFID)
- Equipment dispatch and resource allocation

**LFG Development Path:**

- **BUILD:** Lightweight TOS specifically designed for emerging-market ports. Existing systems (Navis, NCR) are overpriced and over-engineered for San Pedro-scale operations
- **Differentiator:** Mobile-first, works on lower bandwidth, designed for ports transitioning from manual to digital
- **Pose.xyz Integration:** Spatial/positioning technology for container yard management and cargo position tracking
- **PARTNER:** RFID/GPS hardware providers for container tracking

**Revenue Model:** SaaS subscription (monthly per-terminal fee) + implementation fees

---

### 3. Port Community System / API Integration Layer

**Current State:** No digital connective tissue between shipping lines, customs, port authority, freight forwarders, and banks. Data silos create massive delays and revenue leakage.

**What’s Needed:**

- Central API hub connecting all port stakeholders
- Real-time data exchange standard (EDI/API)
- Integration with WAEMU customs databases
- Integration with national single-window systems
- Document digitization and exchange (bills of lading, manifests, permits)

**LFG Development Path:**

- **BUILD:** API-first Port Community System that plugs INTO existing systems (ICUMS in Ghana, CDI national customs) rather than replacing them
- **Strategic Position:** “The translation layer between legacy and modern” — upgrade, not replacement
- **PingPay Integration:** Embedded payment rails for port fees, customs duties, demurrage charges
- **Differentiator:** Open API architecture vs. Webb Fontaine’s closed ecosystem

**Revenue Model:** SaaS subscription + per-transaction API fees + payment rail revenue via PingPay

---

### 4. Blockchain Cargo Provenance

**Current State:** Paper manifests easily forged. No tamper-proof record of cargo movement. ESG data unverifiable for European and North American buyers.

**What’s Needed:**

- Immutable ledger for cargo events (load, transit, customs, discharge)
- Digital twin of shipping containers
- Smart contracts for automated payment/release triggers
- End-to-end provenance tracking for minerals (assay results, origin coordinates, transport logs)

**LFG Development Path:**

- **BUILD:** Purpose-built smart contracts on existing Layer 2 infrastructure (Polygon or similar) for port-specific provenance tracking. NOT building a proprietary L1
- **ESG Module:** Automated compliance reporting for EU due diligence regulations — huge value-add for exporters
- **Deval Integration:** Asset valuation for customs declarations, under-invoicing detection
- **Revenue Model:** Per-certificate fee for ESG reports + per-container provenance tracking fee

---

### 5. AI Customs Intelligence & Risk Profiling

**Current State:** This is the highest-value gap. 60–80% of imports still physically inspected. In Ghana, only GHGHS 85 billion taxable from GHGHS 204 billion in imports — a GHGHS 119 billion gap. $31 billion in illicit outflows via fraudulent Import Declaration Forms.

**What’s Needed:**

- AI model for import risk scoring (flag high-risk, auto-clear low-risk shipments)
- Document OCR + NLP for customs declaration verification
- Anomaly detection for under-invoicing and misclassification
- Real-time trade data analytics for revenue authority dashboards

**LFG Development Path:**

- **BUILD:** AI customs intelligence platform — train on historical customs data, deploy risk scoring engine
- **Revenue Model:** Revenue recovery share — percentage of additional customs revenue recovered through AI risk profiling (incentive-aligned with government)
- **ZKYC Integration:** Importer/exporter KYC verification feeding into risk scores
- **Strategic Alignment:** Directly supports Ghana’s “Publican Trade Solution” ambitions and CDI’s sovereign revenue mobilization goals
- **THIS IS THE CROWN JEWEL:** Highest revenue potential, strongest government pull, most defensible moat

**Revenue Model:** % of recovered revenue + per-declaration fee + government SaaS contract

---

### 6. Digital Permits & Stevedoring Authorization

**Current State:** Paper permits for stevedoring, hazardous materials, and transshipment. Slow, corruptible, zero audit trail.

**What’s Needed:**

- Centralized digital permit application and approval system
- Cryptographically secured permit issuance
- Real-time permit verification at point of use
- Integration with port access control

**LFG Development Path:**

- **BUILD:** Permit management platform — workflow engine for applications, digital issuance, QR/blockchain verification
- **ZK Pass Integration:** Cryptographic permit verification without identity exposure

**Revenue Model:** Per-permit fee + SaaS subscription for port authority

---

### 7. Advance Cargo Information System

**Current State:** Port has no visibility into incoming cargo until manifests are physically submitted. Yard allocation, labor planning, and equipment dispatch are reactive.

**What’s Needed:**

- Pre-arrival cargo declaration system
- Integration with shipping line booking systems
- Predictive analytics for port resource planning

**LFG Development Path:**

- **BUILD:** ACI module as part of the PCS — receives pre-arrival data, feeds into TOS for yard and berth planning

**Revenue Model:** Bundled with PCS subscription

---

### 8. ESG Data Verification & Reporting

**Current State:** European and North American buyers demand verifiable ESG data on supply chains. No system provides this from West African ports today.

**What’s Needed:**

- Automated ESG data capture (carbon footprint, labor practices, origin verification)
- Verifiable reporting format for international buyers
- Integration with cargo provenance tracking

**LFG Development Path:**

- **BUILD:** ESG compliance module sitting on top of the provenance layer — auto-generate compliance reports aligned with EU due diligence regulations
- **Revenue Model:** Per-certificate fee for exporters + subscription for continuous monitoring

---

## What LFG Should NOT Build (Partner Instead)

| Component | Rationale | Potential Partners |
|-----------|-----------|--------------------|
| Cameras, barriers, sensors | Commodity hardware, low margin, needs local installation | Axis, Hikvision, regional integrators |
| Blockchain L1 infrastructure | Already exists at scale, massive R&D cost | Polygon, or a government-preferred chain |
| Biometric hardware | Regulatory complexity, manufacturing | Idemia, Gemalto, local vendors |
| Legacy customs database integration | Every country has unique systems — requires gov relationships (LFG strength) + local dev shops | Local development firms |

---

## Competitive Positioning vs. Incumbents

### Webb Fontaine

- **Strength:** Established PCS/NSW in multiple African countries, customs automation experience
- **Weakness:** Legacy architecture, expensive, slow to adapt, closed ecosystem
- **LFG Counter:** Open-API interoperability layer that upgrades their systems rather than replacing them

### SOGET

- **Strength:** Backed by Chinese Ministry of Commerce, Bureau Veritas partnership
- **Weakness:** Geopolitical friction — Western-aligned governments may resist Chinese infrastructure
- **LFG Counter:** African-led positioning, no geopolitical baggage, Western-compatible architecture

### GCNet / West Blue (Ghana)

- **Strength:** Historical incumbents in Ghana customs
- **Weakness:** GCNet contract expired, West Blue displaced — market is unstable
- **LFG Counter:** Modern stability play, no legacy debt, fresh architecture

---

## Portfolio Company Synergies

| Company | Port Tech Application |
|---------|------------------------|
| **ZKYC** | Port worker, driver, and importer identity verification; KYC for trade participants |
| **ZK Pass** | Zero-knowledge credentialing — authorize access without exposing full identity |
| **PingPay** | Payment rails for port fees, customs duties, and trade finance |
| **Pose.xyz** | Spatial/positioning technology for container yard management and cargo tracking |
| **Deval** | Asset valuation for customs declarations; under-invoicing detection |
| **Zeta** | Additional technical capabilities (to be mapped based on current focus) |

---

## Revenue Model Summary

1. **Per-Container Processing Fee** — micro-transaction for each container through digital gate/permit system
2. **SaaS Subscription** — monthly fee for TOS/PCS platform access
3. **Revenue Recovery Share** — percentage of additional customs revenue recovered via AI profiling
4. **Per-Declaration Fee** — for each customs declaration processed through AI verification
5. **ESG Certificate Fees** — per-certificate for verified supply chain reports
6. **Implementation Fees** — upfront project fees for deployment and integration
7. **Annual Maintenance** — ongoing support contracts

---

## Implementation Roadmap

### Phase 1: San Pedro Proof of Concept (Months 0–6)

- Deploy OCR gate + digital permit system at San Pedro partner terminal
- ZKYC driver credentialing pilot
- Basic PCS API layer connecting 3–5 key stakeholders
- Establish 90-day unbroken digital audit trail of cargo movements
- Demonstrate measurable reduction in truck dwell times

### Phase 2: Ghana Trade Facilitation (Months 6–12)

- Establish Ghanaian entity (L.I. 2431 compliant JV with 40–60% local ownership)
- AI customs risk profiling pilot with Ghana Revenue Authority
- PingPay payment rail integration for port fees
- Secure pilot contract via restricted tendering (national interest pathway)

### Phase 3: Full Deployment (Months 12–18)

- Full TOS deployment at San Pedro
- Blockchain provenance layer for mineral exports
- ESG reporting module live
- Deploy tracking modules to allied mining concessions in Ghana
- End-to-end provenance from pit to port

### Phase 4: Regional Scale (Months 18–24)

- ECOWAS interoperability
- AfCFTA-ready trade facilitation
- Expand to additional West African ports
- Position for full national single-window operations in both countries

---

## Regulatory Navigation

### Côte d’Ivoire

- **OHADA:** Must establish local corporate entity for tech contracts and port concessions
- **ANRMP:** Public procurement rules — PPP/BOT concession pathway available
- **ISPS Code:** Compliance mandatory for all port security systems
- **WAEMU:** Customs database integration requirements

### Ghana

- **L.I. 2431:** 40–60% local ownership required for mining/maritime tech services
- **Public Procurement Act:** Restricted tendering available for “national interest” technology
- **GHANEPS:** Mandatory for government contract procurement
- **Key Relationship:** Francis Poku (former Minister for National Security) — critical political access

---

## Financing Structures

### Available Funding Channels

- African Development Bank (AfDB)
- EU Global Gateway (digital, climate, transport infrastructure in Sub-Saharan Africa)
- U.S. Development Finance Corporation (DFC)
- Agence Française de Développement (AFD)
- Invest International (Netherlands — specifically for San Pedro fishing port)
- Bilateral grants and concessional loans

### SPV Structure

- Limited recourse project finance via Special Purpose Vehicle
- Initial equity from LFG and local partners
- Senior debt from AfDB, DFC
- **Revenue stream:** guaranteed long-term cash flow from port concession agreements (e.g., micro-transaction fee per container processed)

---

## Appendix: Gap-to-Capability Matrix

| Gap | LFG Builds | Portfolio Company | Partner For | Revenue Model |
|-----|------------|-------------------|------------|---------------|
| **OCR Gate & AAC** | Software/API layer | ZKYC, ZK Pass | Hardware vendors | Per-container fee |
| **TOS** | Lightweight platform | Pose.xyz | RFID/GPS hardware | SaaS subscription |
| **PCS/API Layer** | API-first hub | PingPay | Local dev shops | SaaS + per-transaction |
| **Blockchain Provenance** | Smart contracts | Deval | L2 infrastructure provider | Per-certificate fee |
| **AI Customs Intel** | Risk scoring engine | ZKYC | Government data access | Revenue recovery share |
| **Digital Permits** | Workflow platform | ZK Pass | — | Per-permit fee |
| **ACI System** | Module within PCS | — | Shipping line APIs | Bundled with PCS |
| **ESG Reporting** | Compliance module | — | — | Per-certificate fee |

---

*Source: LFG_Port_Tech_Opportunity.pdf (March 2026). Converted to markdown for Planning-Sprint Partners/LFG.*
