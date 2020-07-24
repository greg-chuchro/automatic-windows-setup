$packageFamilyName = (Get-AppxPackage -Name "Microsoft.WindowsTerminal*").packageFamilyName
$settingsFile = "$env:LOCALAPPDATA\Packages\$packageFamilyName\LocalState\settings.json"

$settings = (Get-Content $settingsFile) -replace "^\s*//.*" | Out-String | ConvertFrom-Json
$settings.defaultProfile = ($settings.profiles.list -match "Ubuntu" | Select-Object -Last 1).guid
$settings | ConvertTo-Json -Depth 99 | Out-File $settingsFile -Encoding ASCII
