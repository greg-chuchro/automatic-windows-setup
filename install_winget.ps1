Start-Process 'ms-windows-store://pdp/?PFN=Microsoft.DesktopAppInstaller_8wekyb3d8bbwe'

echo "Please, install App Installer (winget)"
while ($true) {
    if (Get-Command -ErrorAction Ignore -Type Application winget) { break }
    Start-Sleep -Seconds 2
echo "Please, install App Installer (winget)"
}