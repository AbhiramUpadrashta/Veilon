# Veilon — Installation Guide

**Veilon** by Abhiram Upadrashta · [LinkedIn](https://www.linkedin.com/in/abhiram-upadrashta-3652031b6/) · [GitHub](https://github.com/AbhiramUpadrashta)
Copyright © 2026 Abhiram Upadrashta — MIT License

---

## Easiest way — download the app

1. Go to **https://abhiramupadrashta.github.io/Veilon/** and click **Download for Mac**
   (or download [Veilon.zip](https://github.com/AbhiramUpadrashta/Veilon/releases/latest/download/Veilon.zip) directly).
2. Open **Veilon** from your Downloads folder and click **Move to Applications** — Veilon installs itself.
3. Open Veilon from Applications. If macOS says it can't verify the app:
   **System Settings → Privacy & Security → Open Anyway**
   (or in Terminal: `xattr -dr com.apple.quarantine /Applications/Veilon.app`).
4. Continue with **Step 5 — First-time setup** below.

The rest of this guide is for building Veilon yourself from source.

---

## Requirements

| | |
|---|---|
| macOS | 13 Ventura or later (designed for macOS 27) |
| Mac | Apple Silicon or Intel |
| Tools | Apple Command Line Tools (free, ~1 GB download, one time) |
| Time | About 5 minutes |

---

## Step 1 — Remove the old apps

Quit and remove Hidden Bar, Vanilla, Ice, or any other menu bar hider first.
Two hiders running at once will fight each other.

1. Click each app's menu bar icon → **Quit**.
2. Drag the app from **Applications** to the **Trash**.
3. **System Settings → General → Login Items & Extensions** → remove them from "Open at Login".

## Step 2 — Install Apple's Command Line Tools

Open **Terminal** (press ⌘-Space, type `Terminal`, press Return) and run:

```bash
xcode-select --install
```

Click **Install** in the dialog and wait until it finishes.
If it says *"command line tools are already installed"*, you're done with this step.

> Already have Xcode installed? You can skip this step.

## Step 3 — Put the Veilon folder somewhere

```bash
cd ~/Downloads
git clone https://github.com/AbhiramUpadrashta/Veilon.git
```

(or download the ZIP from GitHub and unzip it). You now have a folder `Hidden-Bar` containing `build.sh`.

## Step 4 — Build and install

In Terminal:

```bash
cd ~/Downloads/Hidden-Bar
chmod +x build.sh uninstall.sh
./build.sh --install
```

This will:

1. Compile Veilon (≈ 30 seconds).
2. Copy `Veilon.app` into your **Applications** folder.
3. Launch it.

You'll see `✅ Veilon is running` and two new items in the menu bar: **`|`** and **`›`**.

> Only want the app without installing? Run `./build.sh` — the app appears in `build/Veilon.app`.

## Step 5 — First-time setup

1. A **Welcome** window explains the basics. Click **Got it**.
2. **Hold ⌘ (Command)** and **drag** each icon you want to hide so it sits to the **left** of `|`.
3. Leave icons you always want to see between `|` and `›`.
4. Click `›` — the icons on the left disappear. Click `‹` to bring them back.
5. Right-click the arrow → **Launch at Login** so Veilon starts automatically.

If macOS asks you to approve the login item, open
**System Settings → General → Login Items & Extensions** and turn Veilon on.

---

## If macOS blocks the app

Veilon is signed "ad-hoc" (on your own Mac), not with a paid Apple Developer ID.
Building it yourself normally avoids any warning. If you received a pre-built copy
from someone else and see *"Veilon can't be opened"*:

```bash
xattr -dr com.apple.quarantine /Applications/Veilon.app
open /Applications/Veilon.app
```

Or: **System Settings → Privacy & Security** → scroll down → **Open Anyway**.

---

## Updating

Replace the Veilon folder with the new version and run `./build.sh --install` again.
Your settings are kept.

## Uninstalling

```bash
cd ~/Downloads/Hidden-Bar
./uninstall.sh
```

This quits Veilon, deletes it from Applications and removes its settings.

---

## How releases are made

Every change to the source on `main` triggers `.github/workflows/release.yml`, which builds
Veilon on GitHub's macOS servers, packages `Veilon.zip` (the app only), and publishes it as a GitHub
Release. The website's Download button always points at the latest release.
To publish a new version, bump `CFBundleShortVersionString` in `Resources/Info.plist`.

---

## Troubleshooting installation

| Problem | Fix |
|---|---|
| `swiftc: command not found` / `Swift compiler not found` | Run `xcode-select --install`, then retry. |
| `xcrun: error: invalid active developer path` | Same as above — the Command Line Tools are missing or broken. |
| `Permission denied` running `./build.sh` | Run `chmod +x build.sh` first. |
| Build error mentioning the SDK after a macOS upgrade | Run `sudo rm -rf /Library/Developer/CommandLineTools` then `xcode-select --install`. |
| Nothing appears in the menu bar | Your menu bar may be full. Quit a few apps, or see the User Guide → "Where did my icons go?". |
