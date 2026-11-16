# Read the clipboard aloud: write it to text.js, then open reader.html in an Edge app window.
# install.ps1 binds this to Ctrl+Alt+R. Compatible with Windows PowerShell 5.1.

$dir  = $PSScriptRoot
$text = Get-Clipboard -Raw
if ([string]::IsNullOrWhiteSpace($text)) { $text = '' }

$json = ConvertTo-Json -InputObject $text -Compress
[IO.File]::WriteAllText((Join-Path $dir 'text.js'), "window.READ_TEXT = $json;", [Text.UTF8Encoding]::new($false))

$page    = ([Uri](Join-Path $dir 'reader.html')).AbsoluteUri + '?t=' + [DateTimeOffset]::Now.ToUnixTimeMilliseconds()
$edgeData = Join-Path $env:LOCALAPPDATA 'read-aloud-edge'

# Use a dedicated Edge profile, so the autoplay flag applies even while normal Edge is running.
Start-Process msedge -ArgumentList @(
  "--app=$page",
  "--user-data-dir=`"$edgeData`"",
  '--autoplay-policy=no-user-gesture-required',
  '--no-first-run',
  '--window-size=760,820'
)
