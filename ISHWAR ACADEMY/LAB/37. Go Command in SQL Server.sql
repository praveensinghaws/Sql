-- Go Command in SQL Server

-- Switch the database context to DEMO
USE DEMO;

-- Declare and set the value for the @NAME variable
DECLARE @NAME VARCHAR(50);
SELECT @NAME = 'Microsoft';

-- Display the value of the @NAME variable with the alias 'NAME'
SELECT @NAME AS 'NAME';

GO

-- Declare and set the value for the @NAME variable
DECLARE @NAME VARCHAR(50);
SELECT @NAME = 'DATA ANALYST';
-- Display the value of the @NAME variable multiple times
SELECT @NAME AS 'NAME', @NAME AS 'NAME1', @NAME AS 'NAME2', @NAME AS 'NAME3';
