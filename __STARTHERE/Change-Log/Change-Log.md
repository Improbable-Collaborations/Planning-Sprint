# Change Log

Daily change logs capture all commits made to the repository on a given day, grouped by contributor. Each log file is named `Change-Log-YYYY-MM-DD.md`.

## How to Generate

From the repository root, run:

```bash
./scripts/daily-changelog.sh
```

This generates a log for **today**. To generate a log for a specific date:

```bash
./scripts/daily-changelog.sh 2026-03-15
```

## Storage

Each daily log is very small — typically 1–3 KB, or up to ~8 KB on a busy day. A full year of daily logs would add roughly 1 MB to the repository, which is negligible against GitHub's 5 GB limit.
