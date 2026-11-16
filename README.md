<p align="center"><img src="icon.png" width="96" alt=""></p>

<h1 align="center">Read Aloud</h1>

<p align="center">Copy any text, press <b>Ctrl+Alt+R</b>, and hear it read in Microsoft Edge's natural voices.</p>

I wrote it to listen to long AI chat replies away from the screen, while eating or tidying up. It's free: it uses the Online (Natural) voices built into Edge through the Web Speech API — no API key, no account. Those voices are Microsoft's cloud voices, so the text is sent to Microsoft to be spoken, the same as Edge's own Read Aloud.

## What it does

- Reads whatever is on your clipboard in a small Edge window.
- Cleans up Markdown chat text first, so it sounds like speech: no "asterisk asterisk", links read as their site name, arrows read as "then".
- Picks a natural English voice, or a Japanese one when the text is mostly Japanese. You can change the voice and the speed; both are remembered.
- Splits the text into sentences you can click to jump to.

**Keys:** `Space` play / pause · `Esc` stop · `←` `→` previous / next sentence · `Ctrl+V` read something new.

## Install (Windows)

Needs Windows and Microsoft Edge.

```powershell
git clone https://github.com/wmCmo/read-aloud.git
cd read-aloud
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

This adds a **Read Clipboard Aloud** shortcut to the Start Menu with the hotkey Ctrl+Alt+R. To use another hotkey: `.\install.ps1 -Hotkey "Ctrl+Alt+S"`.

## How it works

| File | Role |
|---|---|
| `read.ps1` | Writes the clipboard to `text.js` and opens `reader.html` in an Edge app window, with its own profile so autoplay works while your normal Edge is open |
| `reader.html` | Cleans the text, splits it into sentences and speaks them with `speechSynthesis` |
| `install.ps1` | Creates the Start Menu shortcut and its hotkey |

`text.js` holds the last thing you read, so it is git-ignored.

## License

MIT. The icon is Fluent UI Emoji "Speaker high volume" by Microsoft (MIT) — see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
