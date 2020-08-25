$packageFamilyName = (Get-AppxPackage -Name "Microsoft.WindowsTerminal*").packageFamilyName
$settingsFile = "$env:LOCALAPPDATA\Packages\$packageFamilyName\LocalState\settings.json"

$settings = (Get-Content $settingsFile) -replace 'ctrl\+(.)"','ctrl+shift+$1"'
$settings | Out-File $settingsFile -Encoding ASCII
