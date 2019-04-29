### Automatic Azure DB copy (sort of a DIY backup solution). This script works better when scheduled, and it renames the copies in a nice search-friendly way (with dates). ###

# Prerequisites and variable declarations

Install-Module -Name Azure
Import-Module Azure
Add-AzureAccount
$day = Get-Date -Format dd
$month = Get-Date -Format MM
$targetserver = sql-server-name
$targetdb = database-name

# Copy job and completion percentage check

Write-Output "Copying the DB..."
$copy= "database-name-copy-" + $day + "-" + $month
$analytics= Start-AzureSqlDatabaseCopy -ServerName $targetserver -DatabaseName $targetdb -PartnerDatabase $copy
$i = 0
do
{
    sleep -Seconds 5
    $check = Get-AzureSqlDatabaseCopy -ServerName $targetserver -DatabaseName $targetdb
    $i = $check.PercentComplete
}
while ($i -ne $null)