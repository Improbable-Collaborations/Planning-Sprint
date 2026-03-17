# Change Log — 2026-03-15

## David Bovill

- `b763c00` Convert Hitchhikers_RamonLlull document from DOCX to Markdown _(20:26)_

## Max Gershfield

- `f375253` LFG: add who-we-are from laissezfairegroup.com, fix Docs links to LFG folder; partner index updates _(22:25)_
- `c196e44` Add LFG partner folder: Port Tech brief, OASIS/Holonic mapping, LFG index _(22:03)_
- `69f0f1a` Stakeholder map (OpenServ + Max/OASIS); Projects/Pan-Galactic-Timebank with planning docs _(20:20)_
- `d9af504` Add Partners category (Resources): OpenServ docs with title convention _(20:02)_
- `5ad1f11` Update paths for vault under Hitchhikers/ _(19:39)_
- `f9a196b` Add Obsidian + Cursor setup guide _(18:54)_

## William Graham Stewart

- `d0132d8` Add warm v2 of RamonLlull proposal (EN + CAT) with original voice restored _(23:59)_
- `c670ccd` Add Hitchhikers docs and update interview guide _(21:18)_
- `900494d` Add file naming protocol document under __STARTUP _(20:57)_
- `1cf9e75` Add __STARTUP folder at top level _(20:55)_
- `8ec8fd5` Add Partner-Outreach folder under 05-Communications _(20:51)_
- `1552384` Rename team-journals to Team-Journals/Ford-Focus to match naming convention _(20:47)_
- `745e547` Add team-journals directory with ford-focus personal journal folder _(20:46)_

## the nameless one

- `6cd5d9b` Revise RamonLlull proposal: add Adams plot parallels, remove names _(15:22)_
- `3ba4308` Add streamlined RamonLlull proposal for Catalan university outreach _(15:12)_
- `886b735` Move wiki home page content into README.md _(14:54)_
- `001c0e7` Rename READMEs to match folder names for Obsidian linking _(14:53)_
- `dd11add` Add partner folders for BFI, United Earth, GMA, LIONSBERG, and Constitutional Drafting _(14:43)_
- `547fe42` Capitalize file names for web rendering _(14:33)_
- `6e20b57` Sync docx with markdown edits for RamonLlull outreach doc _(13:51)_
- `72335d9` Update RamonLlull outreach doc: broaden funding and collaboration scope _(13:44)_
- `ee04461` Add markdown version of Hitchhikers RamonLlull outreach doc _(13:35)_

## Files Changed

```
 .claude/settings.local.json                        |   9 ++
 .../2026-03-15_RamonLlull_Proposal.md              |   2 +-
 .../2026-03-15_RamonLlull_Proposal_v2.md           | 108 +++++++++++++++++++++
 .../2026-03-15_RamonLlull_Proposta_v2_CAT.md       | 108 +++++++++++++++++++++
 4 files changed, 226 insertions(+), 1 deletion(-)
 06-Resources/Partners/LFG/LFG.md                              |  5 ++++-
 .../LFG/Mapping-LFG-Port-Tech-OASIS-Holonic-Sovereign.md      |  2 +-
 06-Resources/Partners/OpenServ/OpenServ.md                    | 10 +++++-----
 06-Resources/Partners/Partners.md                             | 11 ++++-------
 4 files changed, 14 insertions(+), 14 deletions(-)
 .../2026-03-15_RamonLlull_Proposal.md              | 62 +++++++++++-----------
 1 file changed, 30 insertions(+), 32 deletions(-)
 .../2026-03-15_RamonLlull_Proposal.md              | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 .../LFG/Brief-LFG-Port-Tech-Opportunity-Map.md     | 345 +++++++++++++++++++++
 06-Resources/Partners/LFG/LFG.md                   |  10 +
 ...apping-LFG-Port-Tech-OASIS-Holonic-Sovereign.md | 212 +++++++++++++
 3 files changed, 567 insertions(+)
 Planning-Sprint.md | 47 -----------------------------------------------
 README.md          | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 48 deletions(-)
 .../{README.md => Buckminster-Fuller-Institute.md} |  2 +-
 .../{README.md => Constitutional-Drafting.md}      |  2 +-
 .../{README.md => Grant-Management-Associates.md}  |  2 +-
 .../Partners/LIONSBERG/{README.md => LIONSBERG.md} |  2 +-
 .../Partners/OpenServ/{README.md => OpenServ.md}   |  2 +-
 06-Resources/Partners/{README.md => Partners.md}   |  0
 .../{README.md => United-Earth-Networks.md}        |  2 +-
 .../{README.md => Pan-Galactic-Timebank.md}        |  0
 06-Resources/Projects/{README.md => Projects.md}   |  0
 Planning-Sprint.md                                 | 47 ++++++++++++++++++++++
 README.md                                          | 27 +------------
 11 files changed, 54 insertions(+), 32 deletions(-)
 06-Resources/Partners/Buckminster-Fuller-Institute/README.md | 8 ++++++++
 06-Resources/Partners/Constitutional-Drafting/README.md      | 8 ++++++++
 06-Resources/Partners/Grant-Management-Associates/README.md  | 8 ++++++++
 06-Resources/Partners/LIONSBERG/README.md                    | 8 ++++++++
 06-Resources/Partners/README.md                              | 6 +++++-
 06-Resources/Partners/United-Earth-Networks/README.md        | 8 ++++++++
 6 files changed, 45 insertions(+), 1 deletion(-)
 .../{constraints.md => Constraints.md}                             | 0
 .../{current-state.md => Current-State.md}                         | 0
 .../Stakeholder-Mapping/{stakeholder-map.md => Stakeholder-Map.md} | 0
 02-Interviews/Synthesis/{themes.md => Themes.md}                   | 0
 02-Interviews/Templates/{interview-guide.md => Interview-Guide.md} | 0
 03-Meetings/Kickoff/{kickoff-agenda.md => Kickoff-Agenda.md}       | 0
 04-Artifacts/Decision-Log/{decisions.md => Decisions.md}           | 0
 04-Artifacts/Goals-and-Objectives/{goals.md => Goals.md}           | 7 +++++++
 04-Artifacts/RACI-Matrix/{raci.md => RACI.md}                      | 0
 04-Artifacts/Risk-Register/{risks.md => Risks.md}                  | 0
 04-Artifacts/Roadmap/{roadmap.md => Roadmap.md}                    | 0
 11 files changed, 7 insertions(+)
 .../2026-03-14_Hitchhikers_RamonLlull.docx          | Bin 14292 -> 13264 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 .../2026-03-14_Hitchhikers_RamonLlull.md           | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)
 .../2026-03-14_Hitchhikers_RamonLlull.md           | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)
 .../2026-03-14_Hitchhikers_RamonLlull.md           | 325 +++++++++++++++++++++
 1 file changed, 325 insertions(+)
 .../Stakeholder-Mapping/stakeholder-map.md         |  33 +++-
 06-Resources/Partners/README.md                    |   2 +-
 .../Pan-Galactic-Timebank/BUILD_PLAN_OASIS.md      | 185 +++++++++++++++++++++
 .../PAN_GALACTIC_TIMEBANK_SCOPE.md                 |  43 +++++
 ...an_Galactic_Timebank_Task_Map_OASIS_Codebase.md | 124 ++++++++++++++
 .../Pan_Galactic_Timebank_Technical_Tasks.md       | 120 +++++++++++++
 .../Projects/Pan-Galactic-Timebank/README.md       |  27 +++
 06-Resources/Projects/README.md                    |   7 +
 README.md                                          |   2 +
 9 files changed, 537 insertions(+), 6 deletions(-)
 02-Interviews/Templates/interview-guide.md              |   2 +-
 .../2026-03-14_Hitchhikers_RamonLlull.docx              | Bin 0 -> 14292 bytes
 Hitchhikers.md                                          |   0
 3 files changed, 1 insertion(+), 1 deletion(-)
 06-Resources/Partners/OpenServ/README.md           | 10 +++
 .../Status-OpenServ-Builders-Fund-Current.md       | 52 ++++++++++++
 ...hop-summary-OpenServ-Hitchhikers-12-Mar-2025.md | 94 ++++++++++++++++++++++
 06-Resources/Partners/README.md                    | 26 ++++++
 4 files changed, 182 insertions(+)
 __STARTUP/File-Naming-Protocol.md | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 __STARTUP/.gitkeep | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 05-Communications/Partner-Outreach/.gitkeep | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 {team-journals => Team-Journals}/.gitkeep                       | 0
 {team-journals/ford-focus => Team-Journals/Ford-Focus}/.gitkeep | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 team-journals/.gitkeep            | 0
 team-journals/ford-focus/.gitkeep | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 OBSIDIAN_AND_CURSOR.md | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 OBSIDIAN_AND_CURSOR.md | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
```
