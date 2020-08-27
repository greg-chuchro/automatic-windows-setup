$wsl_distros = wsl -l -q  | Out-String
$wsl_distros = $wsl_distros -replace '\0','' # wsl outputs 0x00 after every character
$distro_name = ($wsl_distros -split '\r\n') -match 'Ubuntu' | Select-Object -Last 1

net use w: \\wsl$\$distro_name /persistent:yes

# mount configuration is separate for normal and elevated processes
# elevated process cannot modify mount configuration for regular processes
# WSL isn't accessible to SYSTEM user
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce'
$batchCommand = "powershell -Noexit -ExecutionPolicy Bypass -Command ""Invoke-Expression """"net use w: \\wsl$\$distro_name /persistent:yes"""""""
Set-ItemProperty $key AutomaticWindowsSetupMountWSL $batchCommand
