USE master;
GO

SELECT name , database_id , physical_database_name
FROM sys.databases;
GO
USE DEMODB;
GO
SELECT * FROM sys.all_views;