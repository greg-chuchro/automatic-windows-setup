$webClient = New-Object System.Net.WebClient
$webClient.Headers['User-Agent'] = 'AutomaticWindowsSetup'

$url = 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi'
$currentPath = (Get-Item .).FullName
$fileName = 'wsl_update_x64.msi'
$webClient.DownloadFile($url, "$currentPath\$fileName")

. $fileName /passive

wsl --set-default-version 2