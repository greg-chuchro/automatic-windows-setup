$packageFamilyName = (Get-AppxPackage -Name "Microsoft.WindowsTerminal*").packageFamilyName
$settingsFile = "$env:LOCALAPPDATA\Packages\$packageFamilyName\LocalState\settings.json"

$mergedSettings = dotnet script merge_json_files.csx -- "$env:LOCALAPPDATA\Packages\$packageFamilyName\LocalState\settings.json" ".\WindowsTerminalSettings.json"
$mergedSettings | ConvertFrom-Json | ConvertTo-Json -Depth 99 | Out-File $settingsFile -Encoding ASCII
