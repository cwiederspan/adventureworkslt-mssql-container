/*
Enter custom T-SQL here that would run after SQL Server has started up. 
*/
RESTORE FILELISTONLY FROM DISK='/var/opt/mssql/backup/AdventureWorksLT2022.bak'

RESTORE DATABASE [AdventureWorksLT] FROM DISK='/var/opt/mssql/backup/AdventureWorksLT2022.bak'
WITH
FILE = 1,  
MOVE N'AdventureWorksLT2022_Data' TO N'/var/opt/mssql/data/AdventureWorksLT.mdf',
MOVE N'AdventureWorksLT2022_Log' TO N'/var/opt/mssql/data/AdventureWorksLT_log.ldf',
NOUNLOAD,
STATS = 5