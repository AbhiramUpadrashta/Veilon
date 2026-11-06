# Veilon — User Guide

**Veilon** by Abhiram Upadrashta · [LinkedIn](https://www.linkedin.com/in/abhiram-upadrashta-3652031b6/) · [GitHub](https://github.com/AbhiramUpadrashta)
Copyright © 2026 Abhiram Upadrashta — MIT License

---

## 1. The idea in one picture

```
            HIDDEN ZONE               VISIBLE ZONE
 ┌──────────────────────────────┐ ┌──────────────┐
  🟦 🟩 🟨 🟥 🟪                  |  💬 🎧            ›    🔋 📶 🕐
                                  ▲                  ▲
                              separator            arrow
```

- Icons **left of `|`** → hidden when you collapse.
- Icons **between `|` and `›`** → always visible.
- System items (battery, Wi-Fi, clock, Control Centre) on the far right are never touched.

## 2. Arranging icons

macOS lets you move any menu bar icon:

1. **Hold ⌘ (Command).**
2. **Click and drag** the icon left or right.
3. Let go.

Drag the icons you rarely need to the left of `|`. You can also move `|` and `›` themselves this way.

> ⚠️ `|` must always be **to the left of** `›`. If it isn't, Veilon refuses to hide and shows a warning — otherwise it would hide its own arrow.

## 3. Hiding, showing and editing (works like Hidden Bar)

| Action | How |
|---|---|
| Hide / show icons | Click `›` / `‹` — no lines are shown, the layout is locked |
| Start **edit mode** | **Right-click `›`** — the `|` line (and the always-hidden `┃` bar) appear and every icon is shown |
| Move icons | In edit mode, hold ⌘ and drag icons left/right of the lines |
| Finish editing | **Right-click `›` again** — the lines disappear and the layout is frozen |
| Keyboard | **⌥⌘B** (default — changeable in Preferences) |

## 4. The menu (edit mode → right-click the line)

- **Preferences…** (⇧⌘P)
- **Disable / Enable Auto Collapse** (⌘T)
- **Quit** (⌘Q) — shows all icons, then quits

## 5. Preferences

### General
- A preview of your menu bar sections (Hidden | Shown, plus Always hidden when enabled)
- **Start Veilon when I log in** · **Show preferences on launch** · **Hide icons when Veilon starts**
- **Enable always hidden section** — adds a translucent `┃` bar. Icons left of it stay hidden even when
  Veilon is expanded; edit mode (right-click `›`) shows them. Drag `┃` to the LEFT of `|`.
- **Automatically hide icons after** 5 s – 5 min
- **Show / hide icon** — pick Chevron, Arrow, Circle or Eye
- **Global shortcut** — tick ⌃ ⌥ ⇧ ⌘ and pick a key
- **Extra spacers (macOS 27, large displays)** and diagnostics

### About
- Version, **Check for Updates…**, automatic update checks
- Know more about us (LinkedIn) · Open source on GitHub · Download the latest version · Email us

## 6. macOS 27 notes

macOS 27 changed the menu bar in two ways that matter:

1. **Oversized status items are deleted.** Anything half the screen wide or more is thrown away,
   which is why Hidden Bar broke. Veilon keeps each piece just under that limit.
2. **Native overflow button («).** When the menu bar runs out of room, macOS 27 moves the extra
   icons into a system overflow button. When Veilon collapses, your hidden icons go there.
   So you can reach a hidden icon **without** expanding Veilon: click the system `«` button.

What you'll notice when collapsed on macOS 27: an empty stretch of menu bar to the left of your
visible icons. That empty stretch **is** the separator doing its job — it's intentional.

## 7. Multiple / external displays

- Veilon recalculates its size whenever a display is connected, disconnected or changes resolution.
- On macOS 27 it adds invisible spacer items so the hidden zone is wide enough for your biggest screen.
- If a hidden icon still shows on a very wide monitor: **Settings → Advanced → Extra spacers →
  Automatic + 1** (or +2).

## 8. Where did my icons go? (FAQ)

**An icon disappeared and I can't get it back.**
Click `‹` to expand. On macOS 27 also check the system `«` overflow button. As a last resort,
choose **Quit Veilon** — all icons return.

**Veilon's own `|` or `›` is missing.**
The menu bar is probably full (especially on MacBooks with a notch). Quit an app or two, then
relaunch Veilon. On macOS 27 check the `«` overflow button — you can ⌘-drag them back out.

**The warning "Separator is on the wrong side" appears.**
⌘-drag `|` to the left of `›`.

**New app icons appear in the visible zone.**
macOS decides where new icons go. ⌘-drag them left of `|` once — macOS remembers.

**Does Veilon need Accessibility or Screen Recording permission?**
No. It only uses standard, public menu bar APIs.

**Does it collect data or use the internet?**
No. Nothing leaves your Mac. The only links are the LinkedIn/GitHub buttons you click yourself.

**CPU / battery?**
Effectively zero — Veilon sleeps until you click or press the shortcut.

## 9. Resetting everything

```bash
pkill Veilon
defaults delete com.abhiramupadrashta.Barveil
open /Applications/Barveil.app
```

This restores default settings and shows the welcome screen again.

---

## Credits

Designed and built by **Abhiram Upadrashta**

- LinkedIn: https://www.linkedin.com/in/abhiram-upadrashta-3652031b6/
- GitHub: https://github.com/AbhiramUpadrashta

Released under the MIT License — see `LICENSE` and `COPYRIGHT.md`.
