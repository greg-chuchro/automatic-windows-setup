$file = $args[0]
$workingDirectory = $args[1]
$oldWorkingDir = (Get-Item .).FullName

cd $workingDirectory
Invoke-Expression ./$file
cd $oldWorkingDir
