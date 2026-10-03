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
curl -fsSL -o "$TMP/Veilon.zip" "$URL"

echo "▸ Installing to $DEST"
pkill -x Barveil 2>/dev/null || true; pkill -x Veilon 2>/dev/null || true
rm -rf "$DEST/Barveil.app" "$DEST/Veilon.app"
ditto -x -k "$TMP/Veilon.zip" "$DEST"
xattr -dr com.apple.quarantine "$DEST/Veilon.app" 2>/dev/null || true
rm -rf "$TMP"

open "$DEST/Veilon.app"
echo "✅ Veilon is installed in $DEST and running — look for | and › in your menu bar."
