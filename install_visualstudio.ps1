$webClient = New-Object System.Net.WebClient
$webClient.Headers['User-Agent'] = 'AutomaticWindowsSetup'

$currentPath = (Get-Item .).FullName

$appId = "Microsoft.VisualStudio.Community"
$additionalSwitches = "--config ""$currentPath\VisualStudio.vsconfig"""

$version = (((winget show $appId) -match '^\s*Version:') -replace '^\s*Version:').Trim()
$manifestUrlBasePath = "https://raw.githubusercontent.com/microsoft/winget-pkgs/master/manifests"
$appPath = $appId -replace '\.','/'
$manifestUrl = "$manifestUrlBasePath/$appPath/$version.yaml"
$silentWithProgressSwitches = ((($webClient.DownloadString($manifestUrl) -split '\n') -match '^\s*SilentWithProgress:') -replace '^\s*SilentWithProgress:').Trim()
$customSwitches = ((($webClient.DownloadString($manifestUrl) -split '\n') -match '^\s*Custom:') -replace '^\s*Custom:').Trim()

$customSwitches = ($customSwitches -replace '--add\s+.+').Trim() #TODO generic processing for switch removal

$overrideString = "$silentWithProgressSwitches $customSwitches $additionalSwitches" -replace '"','\"'
winget install --exact --id $appId --override "$overrideString"
