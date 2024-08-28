
SELECT * FROM information_schema.tables; 

-- Step 1: Switch to the target database
-- USE demodb;
GO

-- Step 2: Generate the DROP TABLE statements
DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql = @sql + 'DROP TABLE [' + TABLE_SCHEMA + '].[' + TABLE_NAME + '];' + CHAR(13)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Step 3: Execute the generated SQL
EXEC sp_executesql @sql;



-- Drop the DEMODB database if it already exists to avoid conflicts
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'DEMODB')
BEGIN
    DROP DATABASE DEMODB;
END;

-- Create a new database named DEMODB
CREATE DATABASE DEMODB;

-- Switch the context to the DEMODB database
USE DEMODB;
