### This script changes OneDrive for Business user storage quotas, depending on their membership to targeted Active Directory groups. StorageQuota values are expressed in MBytes ###
$username= "service_user"
$password= "service_user_password"
$credential = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $userName, $(convertto-securestring $Password -asplaintext -force)
Connect-SPOService -Url https://tenant-admin.sharepoint.com -Credential $credential

$5GBnames=Get-ADGroupMember -Identity "OneDriveforBusiness-Max5GB" | Get-ADUser -Properties UserPrincipalName
foreach ($5GBname in $5GBnames) 
{
    Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($5GBname.UserPrincipalName)'"
    Set-SPOSite -Identity (Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($5GBname.UserPrincipalName)'").url -StorageQuota 5120
    Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($5GBname.UserPrincipalName)'"
}
$10GBnames=Get-ADGroupMember -Identity "OneDriveforBusiness-Max10GB" | Get-ADUser -Properties UserPrincipalName
foreach ($10GBname in $10GBnames) 
{
    Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($10GBname.UserPrincipalName)'"
    Set-SPOSite -Identity (Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($10GBname.UserPrincipalName)'").url -StorageQuota 10240
    Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($10GBname.UserPrincipalName)'"
}
$15GBnames=Get-ADGroupMember -Identity "OneDriveforBusiness-Max15GB" | Get-ADUser -Properties UserPrincipalName
foreach ($15GBname in $15GBnames) 
{
    Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($15GBname.UserPrincipalName)'"
    Set-SPOSite -Identity (Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($15GBname.UserPrincipalName)'").url -StorageQuota 15360
    Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "owner -eq '$($15GBname.UserPrincipalName)'"
}