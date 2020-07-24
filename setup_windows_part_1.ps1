$ErrorActionPreference = "Stop"

$currentPath = (Get-Item .).FullName
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce'
$fileName = "setup_windows_part_2.ps1"

$batchCommand = "powershell -ExecutionPolicy Bypass -File ""$currentPath\run_as_admin_in_local_dir.ps1"" ""$fileName"""
Set-ItemProperty $key AutomaticWindowsSetup $batchCommand

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

echo "restart PC to continue"
Restart-Computer -Confirm
