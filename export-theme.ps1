$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'
$accentColor = (Get-ItemProperty $key AccentColorMenu).AccentColorMenu.ToString("X")
'$accentColor = 0x' + $accentColor
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'
$accentPalette = (Get-ItemProperty $key AccentPalette).AccentPalette
'$accentPalette = [byte]' + $([string]$accentPalette -replace " ",',')
''
'$startMenuR = ' + $accentPalette[20]
'$startMenuG = ' + $accentPalette[21]
'$startMenuB = ' + $accentPalette[22]
''
'$startMenuSelectionR = ' + $accentPalette[16]
'$startMenuSelectionG = ' + $accentPalette[17]
'$startMenuSelectionB = ' + $accentPalette[18]
''
$key = 'HKCU:\Control Panel\Colors'
'$backgroundColor = "' + (Get-ItemProperty $key Background).Background + '"'
'$hilight = "' + (Get-ItemProperty $key Hilight).Hilight + '"'
''
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize'
'$appsUseLightTheme = ' + (Get-ItemProperty $key AppsUseLightTheme).AppsUseLightTheme
'$systemUsesLightTheme = ' + (Get-ItemProperty $key SystemUsesLightTheme).SystemUsesLightTheme.ToString("X")
''
$key = 'HKCU:\Control Panel\Desktop'
$wallPaperPath = (Get-ItemProperty $key WallPaper).WallPaper
if ([System.IO.File]::Exists($wallpaperPath)) {
    '$wallPaperBase64String = "' + [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($wallPaperPath)) + '"'
}
''
''
'. ./_base.ps1'
''