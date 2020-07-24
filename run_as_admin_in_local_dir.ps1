$fileName = $args[0]
$localDir = $PSScriptRoot

Start-Process powershell "-Noexit -ExecutionPolicy Bypass -Command ""Invoke-Expression """"$localDir\run_in_dir.ps1"""" """"$fileName"""" """"$localDir""""""" -Verb RunAs
