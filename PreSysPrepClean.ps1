### Pre-sysprep script for Windows 10 reference machines (tested through build 1809) ###
#Requires –RunAsAdminstrator

Write-Host "***Got admin rights, starting app cleaning***"

# This deletes EVERY Windows app, except: Store, Calculator, Photos, Edge, DesktopAppInstaller and StorePurchaseApp (these last two are system apps that shouldn't be removable, I included them just in case). Feel free to customize the list at your risk!
Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*Microsoft.WindowsStore*"} | where-object {$_.name -notlike "*Microsoft.WindowsCalculator*"} | where-object {$_.name -notlike "*Microsoft.Windows.Photos*"} | where-object {$_.name -notlike "*Microsoft.MicrosoftEdge*"} | where-object {$_.name -notlike "*Microsoft.DesktopAppInstaller*"} | where-object {$_.name -notlike "*Microsoft.StorePurchaseApp*"} | Remove-AppxPackage
Get-AppxProvisionedPackage -online | where-object {$_.packagename -notlike "*Microsoft.WindowsStore*"} | where-object {$_.packagename -notlike "*Microsoft.WindowsCalculator*"} | where-object {$_.packagename -notlike "*Microsoft.Windows.Photos*"} | where-object {$_.name -notlike "*Microsoft.MicrosoftEdge*"} | where-object {$_.name -notlike "*Microsoft.DesktopAppInstaller*"} | where-object {$_.name -notlike "*Microsoft.StorePurchaseApp*"} | Remove-AppxProvisionedPackage -online

# These registry keys block apps autodownload (don't skip this part or Windows 10 will try to re-download all the previously removed apps)
Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v AutoDownload /t REG_DWORD /d 2 /f
Reg Add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f

# This disables the User Experience Reporting (because why not?)
Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f

# This disables the first logon animation (the nonsensical "Hi! We're installing the apps....")
Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f

Write-Host "***End***"