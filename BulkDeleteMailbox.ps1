### This script helps you in the deletion of large quantities of Exchange Online mailboxes (shared, user, rooms, everything!) ###

# Authentication
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

# Deletion job
$mails= Get-Content C:\Temp\mailboxlist.txt
foreach ($mail in $mails) {Remove-Mailbox -Identity $mail}