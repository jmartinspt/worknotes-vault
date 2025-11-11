#!/usr/bin/env bash
set -euo pipefail

# installs community plugins listed in .obsidian/community-plugins.json
# Uses the Obsidian community index to resolve plugin IDs to GitHub repos
# Requirements: curl, jq, unzip, mkdir, rm, cp

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PLUGINS_JSON="$ROOT/.obsidian/community-plugins.json"
INDEX_URL="https://raw.githubusercontent.com/obsidianmd/obsidian-releases/master/community-plugins.json"
DEST_DIR="$ROOT/.obsidian/plugins"
TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

if [ ! -f "$PLUGINS_JSON" ]; then
  echo "ERROR: $PLUGINS_JSON not found. Create it with a list of plugin ids (see .obsidian/community-plugins.json)."
  exit 1
fi

for cmd in curl jq unzip; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "ERROR: required command '$cmd' not found. Install it and retry."
    exit 1
  fi
done

echo "Fetching community plugins index..."
INDEX_FILE="$TMP_DIR/community-index.json"
curl -fsSL "$INDEX_URL" -o "$INDEX_FILE"

PLUGIN_IDS=$(jq -r '.[]' "$PLUGINS_JSON")

if [ -z "$PLUGIN_IDS" ]; then
  echo "No plugins listed in $PLUGINS_JSON. Nothing to do."
  exit 0
fi

mkdir -p "$DEST_DIR"

for id in $PLUGIN_IDS; do
  echo "\n=== Installing plugin id: $id ==="

  entry=$(jq -r --arg ID "$id" '.[] | select(.id == $ID) | @json' "$INDEX_FILE" || true)
  if [ -z "$entry" ] || [ "$entry" = "null" ]; then
    echo "Warning: plugin id '$id' not found in Obsidian community index. Skipping."
    continue
  fi

  repo=$(echo "$entry" | jq -r '.repo // empty')
  if [ -z "$repo" ]; then
    echo "Warning: no repo found for plugin id '$id'. Skipping."
    continue
  fi

  echo "Resolved repo: $repo"

  # attempt to download latest release zip via GitHub API
  api_url="https://api.github.com/repos/$repo/releases/latest"
  # try to get zipball_url, fallback to archive/refs/heads/master.zip
  zip_url=$(curl -fsSL "$api_url" | jq -r '.zipball_url // empty' || true)
  if [ -z "$zip_url" ]; then
    echo "No releases found, falling back to master branch zip"
    zip_url="https://github.com/$repo/archive/refs/heads/master.zip"
  fi

  outzip="$TMP_DIR/$id.zip"
  echo "Downloading $zip_url ..."
  if ! curl -fsSL "$zip_url" -o "$outzip"; then
    echo "ERROR: failed to download $zip_url for plugin $id"
    continue
  fi

  # extract into temporary dir
  extradir="$TMP_DIR/$id-extract"
  mkdir -p "$extradir"
  unzip -q "$outzip" -d "$extradir"

  # move plugin files into plugin dir
  # plugin releases typically contain a single top-level folder; move its contents
  first_subdir=$(find "$extradir" -mindepth 1 -maxdepth 1 -type d | head -n 1 || true)
  if [ -z "$first_subdir" ]; then
    echo "ERROR: unexpected zip layout for $id"
    continue
  fi

  plugin_dest="$DEST_DIR/$id"
  mkdir -p "$plugin_dest"

  echo "Copying plugin files to $plugin_dest"
  cp -a "$first_subdir"/* "$plugin_dest/" || true

  # ensure plugin has a manifest.json (some repos require build step)
  if [ ! -f "$plugin_dest/manifest.json" ]; then
    echo "WARNING: plugin '$id' does not contain manifest.json. This plugin may require a build step or prebuilt release. Check the plugin repo: https://github.com/$repo"
  else
    echo "Installed plugin '$id' successfully."
  fi

  # small pause to avoid hitting rate limits too fast
  sleep 1

done

echo "\nDone. Review installed plugins in .obsidian/plugins/. To enable them, open Obsidian, go to Settings → Community plugins, and toggle them on (disable Safe Mode if needed)."

echo "Notes:"
echo "- Some plugins require a build step; if manifest.json is missing, check the plugin repository for release artifacts or build instructions."
echo "- GitHub API rate limits may apply for many plugins. If you hit rate limits, try again later or supply an authenticated token in the script (not implemented by default)."

exit 0
