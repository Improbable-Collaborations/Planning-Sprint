#!/usr/bin/env bash
#
# daily-changelog.sh
# Generates a markdown changelog of all commits from the last 24 hours
# and saves it to __STARTHERE/Change-Log/
#
# Usage: ./scripts/daily-changelog.sh
#   Optionally pass a date: ./scripts/daily-changelog.sh 2026-03-16

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
LOG_DIR="${REPO_ROOT}/__STARTHERE/Change-Log"

# Use provided date or today's date
DATE="${1:-$(date +%Y-%m-%d)}"
SINCE="${DATE}T00:00:00"
UNTIL="$(date -j -f '%Y-%m-%d' "${DATE}" '+%Y-%m-%d' 2>/dev/null || echo "${DATE}")T23:59:59"

OUTPUT_FILE="${LOG_DIR}/Change-Log-${DATE}.md"

# Fetch latest from remote (silently)
git fetch --quiet 2>/dev/null || true

# Collect commits from the last 24 hours across all branches
COMMITS="$(git log --all --after="${SINCE}" --before="${UNTIL}" \
    --format="%ai|%an|%h|%s" --no-merges 2>/dev/null || true)"

if [ -z "${COMMITS}" ]; then
    echo "No changes found for ${DATE}. Skipping."
    exit 0
fi

mkdir -p "${LOG_DIR}"

# Build the changelog
{
    echo "# Change Log — ${DATE}"
    echo ""

    # Get unique authors
    echo "${COMMITS}" | cut -d'|' -f2 | sort -u | while IFS= read -r author; do
        echo "## ${author}"
        echo ""
        echo "${COMMITS}" | grep "|${author}|" | while IFS='|' read -r timestamp _ hash subject; do
            time_only="$(echo "${timestamp}" | awk '{print $2}' | cut -d: -f1,2)"
            echo "- \`${hash}\` ${subject} _(${time_only})_"
        done
        echo ""
    done

    # Summary of files changed
    echo "## Files Changed"
    echo ""
    echo '```'
    git log --all --after="${SINCE}" --before="${UNTIL}" --no-merges \
        --stat --format="" 2>/dev/null || true
    echo '```'
} > "${OUTPUT_FILE}"

echo "Changelog written to ${OUTPUT_FILE}"
