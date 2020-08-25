$webClient = New-Object System.Net.WebClient
$webClient.Headers['User-Agent'] = 'AutomaticWindowsSetup'

$url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"

$release = $webClient.DownloadString($url) | ConvertFrom-Json
$fileName = $release.assets.browser_download_url -split '/' | Select-Object -Last 1

$currentPath = (Get-Item .).FullName
$webClient.DownloadFile($release.assets.browser_download_url, "$currentPath\$fileName")
Add-AppxPackage -Path .\$fileName

# FIXME https://docs.microsoft.com/en-us/windows/application-management/apps-in-windows-10
