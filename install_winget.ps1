$webClient = New-Object System.Net.WebClient
$webClient.Headers['User-Agent'] = 'AutomaticWindowsSetup'

$url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"

$release = $webClient.DownloadString($url) | ConvertFrom-Json
$fileName = $release.assets.browser_download_url -split '/' | Select-Object -Last 1

$webClient.DownloadFile($release.assets.browser_download_url, ".\$fileName")
Add-AppxPackage -Path .\$fileName
