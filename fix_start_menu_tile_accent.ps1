$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'
$accentPalette = (Get-ItemProperty $key AccentPalette).AccentPalette
$accentPalette[12] = $accentPalette[16]
$accentPalette[13] = $accentPalette[17]
$accentPalette[14] = $accentPalette[18]
Set-ItemProperty $key AccentPalette $accentPalette