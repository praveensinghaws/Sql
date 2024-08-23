-- ***** QUERY 3 DELETE ALL TABLES FROM DATABASE  ******
USE employeeDB; -- Replace with your actual database name

DECLARE @TableName NVARCHAR(128)

DECLARE tableCursor CURSOR FOR
SELECT table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'

OPEN tableCursor
FETCH NEXT FROM tableCursor INTO @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @Sql NVARCHAR(MAX)
    SET @Sql = 'DROP TABLE ' + @TableName
    EXEC(@Sql)
    
    FETCH NEXT FROM tableCursor INTO @TableName
END

CLOSE tableCursor
DEALLOCATE tableCursor