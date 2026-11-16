# Create a "Read Clipboard Aloud" Start Menu shortcut with a global hotkey (default: Ctrl+Alt+R).
param([string]$Hotkey = 'Ctrl+Alt+R')

$script = Join-Path $PSScriptRoot 'read.ps1'
$lnk    = Join-Path ([Environment]::GetFolderPath('Programs')) 'Read Clipboard Aloud.lnk'

$sc = (New-Object -ComObject WScript.Shell).CreateShortcut($lnk)
$sc.TargetPath       = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe"
$sc.Arguments        = "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$script`""
$sc.WorkingDirectory = $PSScriptRoot
$sc.WindowStyle      = 7   # start minimized
$sc.Hotkey           = $Hotkey
$sc.IconLocation     = (Join-Path $PSScriptRoot 'icon.ico') + ',0'   # Fluent UI Emoji "Speaker high volume" (MIT, microsoft/fluentui-emoji)
$sc.Save()

"Installed: $lnk ($Hotkey)"
