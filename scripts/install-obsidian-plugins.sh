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

  # attempt to download latest release via GitHub API
  api_url="https://api.github.com/repos/$repo/releases/latest"
  release_json=$(curl -fsSL "$api_url" || true)

  # prefer a release asset (zip/tar) if available (these are often prebuilt plugin packages)
  asset_url=$(echo "$release_json" | jq -r '.assets[]?.browser_download_url | select(. != null) | select(endswith(".zip") or endswith(".tar.gz") or endswith(".tgz"))' 2>/dev/null | head -n 1 || true)

  if [ -n "$asset_url" ]; then
    zip_url="$asset_url"
    echo "Using release asset: $zip_url"
  else
    # fallback to release zipball (source) if present
    zipball_url=$(echo "$release_json" | jq -r '.zipball_url // empty' 2>/dev/null || true)
    if [ -n "$zipball_url" ]; then
      zip_url="$zipball_url"
      echo "Using release source zip: $zip_url"
    else
      echo "No releases or assets found, falling back to master branch zip"
      zip_url="https://github.com/$repo/archive/refs/heads/master.zip"
    fi
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

  # Find the directory that contains manifest.json (plugin root). Some releases include prebuilt dist folders.
  manifest_path=$(find "$extradir" -type f -name manifest.json | head -n 1 || true)
  if [ -n "$manifest_path" ]; then
    plugin_source_dir=$(dirname "$manifest_path")
    echo "Found manifest at $manifest_path, using directory $plugin_source_dir as plugin root"
  else
    # No manifest found — the package may be source that requires building. Try to locate a 'dist' folder containing manifest.json
    dist_manifest=$(find "$extradir" -type f -path "*/dist/manifest.json" | head -n 1 || true)
    if [ -n "$dist_manifest" ]; then
      plugin_source_dir=$(dirname "$dist_manifest")
      echo "Found dist manifest at $dist_manifest, using directory $plugin_source_dir as plugin root"
    else
      echo "WARNING: no manifest.json found in the downloaded package for '$id'. This plugin likely requires a build step and cannot be installed automatically. See https://github.com/$repo"
      continue
    fi
  fi

  plugin_dest="$DEST_DIR/$id"
  rm -rf "$plugin_dest"
  mkdir -p "$plugin_dest"

  echo "Copying plugin files from $plugin_source_dir to $plugin_dest"
  cp -a "$plugin_source_dir/". "$plugin_dest/" || true

  # verify manifest.json exists in destination
  if [ ! -f "$plugin_dest/manifest.json" ]; then
    echo "ERROR: after copying, manifest.json still missing for plugin '$id' — skipping."
    rm -rf "$plugin_dest"
    continue
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
