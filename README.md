# POSH-MAIN
## or, a nice collection of sysadmin-oriented PowerShell scripts

### AzureDBCopy
A nice no-frills solution to make automatic copies of your Azure SQL DBs, in case you want to be extra sure to have some spare copies lying around.

### BulkDeleteMailbox

Need to delete hundreds of Exchange Online mailboxes at once? Fear no more!

### CopyFileForAllUsers

An useful script in case you need to copy file(s) to one or more PCs with multiple user profiles.

### OneDriveSetLimit

Since OneDrive for Business doesn't currently support changing individual storage quotas, here's a simple script that will do the trick, without changing the tenant default. Just create an AD group (or more, if you want to create more quotas), put some users in it and run the script! In the included sample script I've considered a case with 3 different quotas.

### PreSysPrepClean

If you (like me) still rely on golden image sysprepping and capturing when preparing a Windows 10 image for deployment, then this script could save you some precious time. It will automatically delete all the crappy Windows 10 modern apps (exceptions are supported, take a look at the script!) and add some useful registry keys. I'm actually planning on expanding it in the near future, so stay tuned!