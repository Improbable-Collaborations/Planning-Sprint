# Obsidian + Cursor setup (Planning-Sprint)

This folder is a **Git submodule**: it syncs to **[Improbable-Collaborations/Planning-Sprint](https://github.com/Improbable-Collaborations/Planning-Sprint)**. All commits you make inside this folder push/pull to that repo, not to OASIS_CLEAN.

---

## 1. Get the folder (if you just cloned OASIS_CLEAN)

```bash
git submodule update --init Hitchhikers/Planning-Sprint
```

---

## 2. Use as an Obsidian vault

1. Open **Obsidian** → **Open folder as vault** → select the **Planning-Sprint** folder (e.g. `OASIS_CLEAN/Hitchhikers/Planning-Sprint`).
2. Install the **Obsidian Git** community plugin and enable it.
3. In **Settings → Obsidian Git**: turn on **Pull on startup** and **Auto backup** (e.g. every 15 min).  
   The plugin will commit and push to **Improbable-Collaborations/Planning-Sprint**.

---

## 3. Use with Cursor

- Open **OASIS_CLEAN** in Cursor (File → Open Folder). You’ll see **Hitchhikers/Planning-Sprint** and its contents.
- Edit any file under `Hitchhikers/Planning-Sprint/`; use `@Hitchhikers/Planning-Sprint/filename.md` in chat so the AI can read/edit notes.
- **To commit/push Planning-Sprint changes:** either use Obsidian Git, or in a terminal:
  ```bash
  cd Hitchhikers/Planning-Sprint
  git add -A && git status
  git commit -m "Your message"
  git push
  ```
  That pushes to the Planning-Sprint repo. Then in the repo root: `git add Hitchhikers/Planning-Sprint && git commit -m "Update Planning-Sprint submodule" && git push` to record the new submodule commit in OASIS_CLEAN (optional but recommended so others get the same pointer).

---

## 4. Team workflow

- **OASIS_CLEAN:** Clone as usual, then run `git submodule update --init Hitchhikers/Planning-Sprint`.
- **Planning-Sprint repo:** Teammates can work either from OASIS_CLEAN (with the submodule) or by cloning [Improbable-Collaborations/Planning-Sprint](https://github.com/Improbable-Collaborations/Planning-Sprint) directly. Changes in this folder always sync to that repo.
