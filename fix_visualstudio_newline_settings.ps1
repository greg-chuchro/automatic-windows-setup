$key = "HKLM:\\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\devenv.exe"
$visualstudioExeFile = (Get-ItemProperty $key)."(Default)" -replace '"'

$visualStudioLocalAppDataFolder = "$env:LOCALAPPDATA\Microsoft\VisualStudio"
$visualStudioDataFolderName = (Get-ChildItem $visualStudioLocalAppDataFolder | Where-Object { $_.Name -match '[0-9]+\.[0-9]_.+' } | Select-Object -Last 1).Name
$settingsFile = "$visualStudioLocalAppDataFolder\$visualStudioDataFolderName\Settings\CurrentSettings.vssettings"

echo "Please, enter Visual Studio to continue"
while ($true) {
    if (Test-Path $settingsFile) { break }
	Start-Process -Wait $visualstudioExeFile "/Command ""exit"""
	Start-Sleep -Seconds 2
}

$settings = Get-Content $settingsFile
$settings = $settings -replace '<PropertyValue name="(newline)(.*)">1</PropertyValue>','<PropertyValue name="$1$2">0</PropertyValue>'
$settings = $settings -replace '<PropertyValue name="(newline)(.*)">true</PropertyValue>','<PropertyValue name="$1$2">false</PropertyValue>'
$settings = $settings -replace '<PropertyValue name="(newline)(.*)_(each)(.*)">0</PropertyValue>','<PropertyValue name="$1$2_$3$4">1</PropertyValue>'
$settings = $settings -replace '<PropertyValue name="(newline)(.*)_(each)(.*)">false</PropertyValue>','<PropertyValue name="$1$2_$3$4">true</PropertyValue>'
$settings | Out-File $settingsFile -Encoding ASCII
