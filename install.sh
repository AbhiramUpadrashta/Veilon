#!/bin/bash
# Veilon installer — downloads the latest Veilon and puts it in Applications.
# Usage:  curl -fsSL https://abhiramupadrashta.github.io/Veilon/install.sh | bash
# Copyright © 2026 Abhiram Upadrashta — MIT License
set -e
URL="https://github.com/AbhiramUpadrashta/Veilon/releases/latest/download/Veilon.zip"
DEST="/Applications"
[ -w "$DEST" ] || { DEST="$HOME/Applications"; mkdir -p "$DEST"; }

echo "▸ Downloading Veilon…"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
curl -fsSL --proto '=https' -o "$TMP/Veilon.zip" "$URL"
curl -fsSL --proto '=https' -o "$TMP/Veilon.zip.sha256" "$URL.sha256"

echo "▸ Checking the download…"
WANT="$(awk '{print $1}' "$TMP/Veilon.zip.sha256")"
HAVE="$(shasum -a 256 "$TMP/Veilon.zip" | awk '{print $1}')"
[ -n "$WANT" ] && [ "$WANT" = "$HAVE" ] || { echo "✖ The download doesn't match its checksum — nothing was installed."; exit 1; }
mkdir "$TMP/x"; ditto -x -k "$TMP/Veilon.zip" "$TMP/x"
[ -d "$TMP/x/Veilon.app" ] && [ ! -L "$TMP/x/Veilon.app" ] || { echo "✖ Unexpected download contents — nothing was installed."; exit 1; }
ID="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$TMP/x/Veilon.app/Contents/Info.plist" 2>/dev/null || true)"
[ "$ID" = "com.abhiramupadrashta.Barveil" ] || { echo "✖ Unexpected app in the download — nothing was installed."; exit 1; }
codesign --verify --deep --strict "$TMP/x/Veilon.app" 2>/dev/null || { echo "✖ The app's signature is broken — nothing was installed."; exit 1; }

echo "▸ Installing to $DEST"
pkill -x Barveil 2>/dev/null || true; pkill -x Veilon 2>/dev/null || true
rm -rf "$DEST/Barveil.app" "$DEST/Veilon.app"
ditto "$TMP/x/Veilon.app" "$DEST/Veilon.app"
xattr -dr com.apple.quarantine "$DEST/Veilon.app" 2>/dev/null || true

open "$DEST/Veilon.app"
echo "✅ Veilon is installed in $DEST and running — look for | and › in your menu bar."
