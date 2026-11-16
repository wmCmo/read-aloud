# CLAUDE.md

Zach's read-aloud hotkey: copy text, press **Ctrl+Alt+R**, and an Edge app window reads it with Edge's Online (Natural) voices via the Web Speech API. He uses it to listen to long Claude messages, and called it "basically ideal".

- `read.ps1`: clipboard → `text.js`, then launches Edge with its own profile (`%LOCALAPPDATA%\read-aloud-edge`) and the autoplay flag.
- `reader.html`: Markdown cleanup, chunking; voice and speed are saved.
- `install.ps1`: Start Menu shortcut with the hotkey (`-Hotkey` to change it).

If he wants something read to him, point him at the hotkey or extend this tool rather than building a new one. Scripting claude.ai's own TTS endpoint was declined (consumer terms, account risk); this is the sanctioned alternative.
