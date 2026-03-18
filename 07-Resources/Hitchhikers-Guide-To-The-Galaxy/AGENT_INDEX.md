# Agent index — *The Hitch Hiker's Guide to the Galaxy* (Book 1)

**Purpose:** Help agents and humans find **characters**, **dialogue**, and **scenes** in [`Book.md`](Book.md) (first novel only). Line numbers refer to **Book.md** as in this repo (~2,373 lines; header block ~1–14).

---

## External wikis (whole franchise — use for context, not Book.md line refs)

| Resource | URL | Use |
|----------|-----|-----|
| **Hitchhikers Wiki (Fandom)** | [Main Page](https://hitchhikers.fandom.com/wiki/Main_Page) | Characters, places, tech across radio, books, TV, film. |
| **Character list (Fandom)** | [List of Characters](https://hitchhikers.fandom.com/wiki/List_of_Characters) | Cross-media appearances; many entries extend beyond Book 1. |
| **Wikipedia — characters** | [List of HHGTTG characters](https://en.wikipedia.org/wiki/List_of_The_Hitchhiker%27s_Guide_to_the_Galaxy_characters) | Quick overview and disambiguation. |
| **Wikipedia — novel** | [The Hitchhiker's Guide to the Galaxy (novel)](https://en.wikipedia.org/wiki/The_Hitchhiker%27s_Guide_to_the_Galaxy_(novel)) | Plot summary, publication. |

**Important:** Wikis describe **later books and adaptations** too. For **this** repo, ground truth for quotes and scenes is always **`Book.md`**.

---

## How to search `Book.md`

- **Path:** `07-Resources/Hitchhikers-Guide-To-The-Galaxy/Book.md`
- **Tooling:** `rg "phrase" Book.md` (ripgrep) or editor search.
- **Dialogue:** Speech often uses doubled single quotes `''like this''` (PDF extraction quirk).
- **Line ranges below** are approximate narrative anchors; read ±50 lines for full context.

---

## Scene map (Book.md line ranges)

| Lines (approx.) | Arc / scene | Good search strings |
|-----------------|-------------|---------------------|
| 15–30 | Cosmic opening; Guide introduced | `unfashionable end`, `Don't Panic` |
| 31–210 | Arthur’s house; bulldozer; **Mr Prosser** | `Arthur Dent`, `bypass`, `Prosser` |
| 210–400 | **Horse and Groom** pub; Earth destruction; **Ford** | `Pan Galactic Gargle Blaster`, `twelve minutes away` |
| 400–550 | **Vogon** ship; **Babel fish**; hyperspace jump | `Babel fish`, `T'annoy`, `hyperspace` |
| 550–820 | **Vogon poetry**; **airlock**; rescue | `Vogon poetry`, `airlock`, `asphyxication` |
| 820–950 | **Heart of Gold**; infinite improbability | `Heart of Gold`, `Improbability` |
| 950–1200 | **Marvin**; **Zaphod**; **Trillian**; bridge | `brain the size of a planet`, `Marvin`, `Zaphod` |
| 1000–1150 | Sub-etha news; **Gag Halfrunt** (voice) | `sub-etha`, `Beeblebrox` |
| 1200–1530 | **Magrathea**; missiles; **whale** & **petunias** | `sperm whale`, `petunias`, `Oh no, not again` |
| 1530–1785 | Surface of Magrathea; **Slartibartfast**; aircar | `Slartibartfast`, `fjords` |
| 1785–2050 | **Deep Thought**; **42**; philosophers | `Deep Thought`, `Forty-two`, `Lunkwill` |
| 2050–2270 | **Benji & Frankie Mouse**; Ultimate Question; brain offer | `Benji`, `Frankie`, `Ultimate Question` |
| 2270–end | Toward **Restaurant at the End of the Universe** | `Restaurant` |

---

## Characters (Book 1) — personality, where they appear, search hints

### Arthur Dent
- **Personality:** Bewildered everyman; polite under stress; tea-and-house oriented; slow to accept cosmic absurdity. **Arc:** Earth → space → Vogons → Heart of Gold → Magrathea → mice’s “deal.”
- **Appears:** Throughout (~lines 31–2370+).
- **Search:** `Arthur`, `Arthur Dent`, `Earthman`.

### Ford Prefect
- **Personality:** Betelgeusian field researcher for the Guide; drinks heavily; pragmatic, impatient with panic; old friend of Arthur. **Not actually from Guildford.**
- **Appears:** Pub through end (~202–2370+).
- **Search:** `Ford Prefect`, `Ford`, `Betelgeuse`.

### Zaphod Beeblebrox
- **Personality:** Two-headed ex-President of the Galaxy; vain, chaotic, lucky; cousin of Ford; stole the Heart of Gold.
- **Appears:** Mainly from bridge scenes on (~950+); name earlier in news.
- **Search:** `Zaphod`, `Beeblebrox`, `President`.

### Trillian (Tricia McMillan)
- **Personality:** Smart, exasperated by Zaphod and Marvin; only other human-ish presence on the ship for much of the book.
- **Appears:** ~950+ (Heart of Gold / Magrathea / mice).
- **Search:** `Trillian`, `Tricia`.

### Marvin (the Paranoid Android)
- **Personality:** Depressive robot; “brain the size of a planet”; GPP (Genuine People Personality); loathes doors, work, life.
- **Appears:** ~950–1200 heavy; later Magrathea tunnels.
- **Search:** `Marvin`, `brain the size of a planet`, `don't talk to me about life`.

### Mr L Prosser
- **Personality:** Council man; nervous; **descendant of Genghis Khan** (inner vision); wants the bypass built.
- **Appears:** ~48–202 (bulldozer / house).
- **Search:** `Prosser`, `Genghis Khan`.

### Vogons (captain, guard, constructor fleet)
- **Personality:** Officious, cruel, love bureaucracy and **bad poetry**.
- **Appears:** ~400–820.
- **Search:** `Vogon`, `Vogon poetry`, `constructor ship`.

### Eddie (Heart of Gold computer)
- **Personality:** Over-cheerful Sirius Cybernetics AI; calls crew “guys”; sings under stress.
- **Appears:** ~1360–1400+ (missile crisis, manual controls).
- **Search:** `Eddie`, `call me Eddie`, `When you walk through the storm`.

### Slartibartfast
- **Personality:** Elderly Magrathean “planet designer”; calm, dry; proud of **fjords**; explains Earth/mice/Deep Thought thread.
- **Appears:** ~1530–1785+ (Magrathea interior, aircar, backstory).
- **Search:** `Slartibartfast`, `fjords`, `award`.

### Deep Thought
- **Personality:** Vast computer; arrogant about lesser machines; delivers **Answer 42** after 7.5M years.
- **Appears:** ~1787–2050 (flashback / narrative).
- **Search:** `Deep Thought`, `Forty-two`, `seven and a half million years`.

### Lunkwill & Fook
- **Personality:** First species’ programmers who commission Deep Thought.
- **Appears:** Deep Thought sequence.
- **Search:** `Lunkwill`, `Fook`.

### Majikthise & Vroomfondel
- **Personality:** Philosophers who demand **rigidly defined areas of doubt and uncertainty**; interrupt Deep Thought’s reveal.
- **Search:** `Majikthise`, `Vroomfondel`, `Philosophers`.

### Benji Mouse & Frankie Mouse
- **Personality:** Hyperintelligent pan-dimensional beings (mouse form); cynical; want **Arthur’s brain** for the Ultimate Question; offer money.
- **Appears:** ~2148–2270.
- **Search:** `Benji`, `Frankie`, `hyperintelligent pan-dimensional`.

### Eccentrica Gallumbits
- **Personality:** (Referenced only) “Triple-breasted whore of Eroticon 6”; gossip-column colour.
- **Search:** `Gallumbits`, `Eroticon`.

### Whale & bowl of petunias
- **Personality:** Whale: innocent existential monologue before impact. Petunias: **“Oh no, not again.”**
- **Appears:** ~1298–1520 (improbability missile outcome).
- **Search:** `sperm whale`, `petunias`, `Oh no, not again`.

### Minor / one-scene voices
| Entity | Role | Search |
|--------|------|--------|
| Barman (Horse and Groom) | Deadpan Earth ending | `Horse and Groom`, `Arsenal` |
| Vogon guard | Drags pair to airlock | `search party`, `number three airlock` |
| Gag Halfrunt (voice) | Zaphod’s “brain care specialist” | `Halfrunt` |
| Hotblack Desiato’s stunt ship | Lawyers / time paradox gag | `Hotblack` (if present in this extract) |

---

## Dialogue & meme lookup (quick grep targets)

| Meme / line | Search in Book.md |
|-------------|-------------------|
| Don’t Panic | `Don't Panic` |
| Answer to Life, the Universe and Everything | `Forty-two`, `42` |
| So long, and thanks for all the fish | (Book 1 **novel** — may appear only in passing; grep `fish`) |
| Life, don’t talk to me about life | `don't talk to me about life` |
| Mostly harmless | `Mostly harmless` (Guide entry on Earth) |
| 42 | Context around Deep Thought |
| Tea | `tea` (Arthur repeatedly) |

---

## For future agents — suggested workflow

1. **Character fact** → Check **Character section** above → open **Book.md** at suggested **line range** → `rg "Name" Book.md -n`.
2. **Exact wording** → Search **phrase** in Book.md (remember `''` quotes).
3. **Franchise-wide lore** → **Fandom wiki** first, then confirm in Book.md if it’s Book-1-canon.
4. **New index rows** → When adding scenes, append to **Scene map** with line numbers from `wc -l` / editor.

---

*Index generated for Planning-Sprint resource folder. Book text is licensed project material only.*
