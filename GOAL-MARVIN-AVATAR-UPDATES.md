# Goal: Marvin Avatar – Hitchhikers Planning Updates

**Recorded:** 2026-03-17

---

## Vision

- **Source:** The documents in **Hitchhikers/Planning-Sprint** are created and updated by the Hitchhikers working group (standups, briefings, action points, change logs, partner outreach, etc.).

- **Idea:** Take the **latest updates** from this group and feed them as **dialogue** to a **Genies avatar** — a **Marvin** avatar we create — so that team members can get an update of the latest information from the group **spoken by the avatar**.

- **Delivery:** Prefer a **web app**, or at least something **easy for the team to use** whenever they need it (no heavy install, works on phones/laptops).

---

## Technical context (as of 2026-03-17)

- Genies Avatar SDK is integrated with OASIS (identity, game profile, Genies avatar id stored in OASIS).
- Unity project: **Genie Avatar / My project** (OASIS + Genies bridge, Avatar Starter sample).
- Genies SDK does **not** support Intel Mac or Mac standalone builds; it supports **Windows**, **Android**, and **iOS**. So we build for Android (or Windows) to run the avatar; web delivery has constraints (see below).

---

## Pipeline (intended)

1. **Content:** Pull latest from `Hitchhikers/Planning-Sprint` (e.g. daily briefings, change log, action points).
2. **Dialogue:** Turn that content into script/dialogue (summaries, bullet points, or full text).
3. **Marvin:** A Genies avatar created and styled as “Marvin” speaks that dialogue (TTS + lip-sync / animation in Genies).
4. **Delivery:** Team accesses this via web app or easy-to-use app (see “Web vs Android” below).

---

## Web vs Android and “converting without a new computer”

- **Android first:** Building the Unity project for **Android** (to get Genies working on current setup) does **not** require a new computer — Unity on your Mac can build Android APKs. That Android app can be the first delivery: “Open the Marvin app on your phone to hear this week’s update.”

- **Same project → other platforms later:** The **same** Unity project can later be built for **iOS** (when you have a supported Mac or use cloud build), **Windows**, and eventually **Mac** when Genies supports it. No “conversion” in the sense of rewriting — just switching build target.

- **Web app:** The Genies Avatar SDK **does not yet support WebGL** (browser). So you cannot today “convert” the Unity + Genies app into a single web build that runs the full 3D Marvin in the browser. Options:
  - **Option A – Web app without Unity/Genies in browser:** Build a **separate** web app (any stack) that (1) reads the latest from Planning-Sprint (or an API that aggregates it), (2) generates **speech** (e.g. TTS) and optionally shows a **static or pre-rendered** Marvin (image/video). No new computer needed; you can build and host this on your current machine or any host.
  - **Option B – When Genies supports WebGL:** If Genies adds WebGL support later, the **same** Unity project could be built to WebGL. You can use **Unity Cloud Build** (or similar) to produce the web build without needing a Windows or M-series Mac locally.
  - **Option C – Android as “easy for team”:** Ship the **Android app** as the primary way to hear Marvin. Team installs once; they open the app whenever they want an update. No web yet, but “easy to use” and achievable without a new computer.

**Summary:** You can get to a working Marvin experience **without a whole new computer** by (1) building for Android now and using that as the team delivery, and/or (2) building a separate web app that uses the same Planning-Sprint content with TTS + static/pre-rendered Marvin. Converting the **same** Unity app to a **web app in the browser** depends on Genies adding WebGL support (or using cloud build when they do); the Android build does not block that future path.
