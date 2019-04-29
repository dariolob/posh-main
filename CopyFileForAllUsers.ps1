### This script copies some files of your choice in the user folder for all the users who have a profile on the target computer(s) ###

$workingDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
ForEach ($user in (Get-ChildItem "C:\Users" -Exclude Public)) 
{
    Copy-Item -Path $workingDirectory\file1.ini -Destination $user\AppData\Roaming\path\file1.ini
    Copy-Item -Path $workingDirectory\file2.xml -Destination $user\AppData\Roaming\path\file2.xml
}

## Optional registry key to leverage SCCM detection method, in case you wish to distribute this script as a ConfigMgr Application. Change names to your liking! ##

# New-Item 'HKCU:\Software\KeyName' -Force | New-ItemProperty -Name ValueName -Value 1 -Force | Out-Null