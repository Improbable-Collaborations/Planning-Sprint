#!/usr/bin/env bash
#
# import-transcripts.sh
# Picks up MacWhisper .txt transcripts from the NextCloud Voice_Transcripts
# channel folders, formats them into the repo template, and commits.
#
# Usage: ./scripts/import-transcripts.sh
#
# Expects this folder structure:
#   ~/Nextcloud/Voice_Transcripts/
#     Signal_Transcripts/     ← audio files + .txt transcripts from MacWhisper
#     Telegram_Transcripts/
#     Whatsapp_Transcripts/
#
# Each .txt file is processed once. After import, the .txt is renamed to
# .txt.imported so it won't be picked up again.

set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)"
INBOX_ROOT="${HOME}/Nextcloud/Voice_Transcripts"
OUTPUT_DIR="${REPO_ROOT}/05-Communications/Voice-Transcripts"
DATE_TODAY="$(date +%Y-%m-%d)"
IMPORTED=0

# Map folder names to channel labels
declare -A CHANNEL_MAP
CHANNEL_MAP["Signal_Transcripts"]="Signal"
CHANNEL_MAP["Telegram_Transcripts"]="Telegram"
CHANNEL_MAP["Whatsapp_Transcripts"]="WhatsApp"

for folder in Signal_Transcripts Telegram_Transcripts Whatsapp_Transcripts; do
    channel="${CHANNEL_MAP[$folder]}"
    inbox="${INBOX_ROOT}/${folder}"

    [ -d "${inbox}" ] || continue

    # Find .txt files that haven't been imported yet
    for txt_file in "${inbox}"/*.txt; do
        [ -f "${txt_file}" ] || continue

        filename="$(basename "${txt_file}" .txt)"

        # Try to extract a speaker name from the filename or first lines
        # Common patterns: "David Bovill - topic", "voice_message_2026-03-17", etc.
        speaker="Unknown"
        # Check if filename contains a recognisable name
        if echo "${filename}" | grep -qi "david\|bovill"; then
            speaker="David-Bovill"
        elif echo "${filename}" | grep -qi "graham\|stewart"; then
            speaker="Graham-Stewart"
        elif echo "${filename}" | grep -qi "max\|gershfield"; then
            speaker="Max-Gershfield"
        elif echo "${filename}" | grep -qi "nameless"; then
            speaker="Nameless-One"
        fi

        # Try to get date from filename, fall back to file modification date
        file_date="${DATE_TODAY}"
        if echo "${filename}" | grep -qoE '[0-9]{4}-[0-9]{2}-[0-9]{2}'; then
            file_date="$(echo "${filename}" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | head -1)"
        else
            file_date="$(stat -f '%Sm' -t '%Y-%m-%d' "${txt_file}" 2>/dev/null || echo "${DATE_TODAY}")"
        fi

        # Clean up filename for topic (remove dates, extensions, common prefixes)
        topic="$(echo "${filename}" | sed -E 's/[0-9]{4}-[0-9]{2}-[0-9]{2}[_ -]?//g; s/^(voice_message|audio|recording)[_ -]?//gi; s/[_ ]/-/g; s/--+/-/g; s/^-//; s/-$//')"
        [ -z "${topic}" ] && topic="Voice-Message"

        # Build output filename
        output_name="${file_date}_${speaker}_${topic}.md"
        output_path="${OUTPUT_DIR}/${output_name}"

        # Skip if already exists
        if [ -f "${output_path}" ]; then
            echo "Skipping (already exists): ${output_name}"
            continue
        fi

        # Read the transcript content
        transcript_content="$(cat "${txt_file}")"

        # Estimate duration from word count (~150 words per minute of speech)
        word_count="$(wc -w < "${txt_file}" | tr -d ' ')"
        duration_mins=$(( (word_count + 149) / 150 ))
        [ "${duration_mins}" -lt 1 ] && duration_mins=1

        # Write the formatted file
        cat > "${output_path}" <<HEREDOC
# Voice Transcript — ${file_date}

- **From:** ${speaker//-/ }
- **Channel:** ${channel}
- **Date:** ${file_date}
- **Duration:** approx. ${duration_mins} min

## Summary

_To be added._

## Action Points

_To be extracted._

## Full Transcript

${transcript_content}
HEREDOC

        # Mark as imported
        mv "${txt_file}" "${txt_file}.imported"

        echo "Imported: ${output_name}"
        IMPORTED=$((IMPORTED + 1))
    done
done

if [ "${IMPORTED}" -eq 0 ]; then
    echo "No new transcripts found."
    exit 0
fi

echo ""
echo "${IMPORTED} transcript(s) imported to ${OUTPUT_DIR}/"
echo ""
echo "Next steps:"
echo "  1. Review the files and fill in Summary and Action Points"
echo "  2. Or paste the transcript into Claude Code to auto-generate them"
echo "  3. Commit when ready: git add 05-Communications/Voice-Transcripts/ && git commit"
