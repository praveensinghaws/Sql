--  Modify, Delete, Rename, View User-defined Function in T-SQL
USE DEMODB;
-- View the definition of the function
SELECT definition
FROM sys.sql_modules;

OR 
SELECT definition
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('dbo.MultiplyNumbers');

SELECT * FROM DBO.getAllEmployees(80000);

-- Drop the existing function
DROP FUNCTION dbo.MultiplyNumbers;

-- Drop the MULTI(ALL) existing SCALAR function

DECLARE @functionName NVARCHAR(255);
DECLARE dropFunctionsCursor CURSOR FOR
SELECT name
FROM sys.objects
WHERE type_desc = 'SQL_SCALAR_FUNCTION' AND schema_id = SCHEMA_ID('dbo');

OPEN dropFunctionsCursor;
FETCH NEXT FROM dropFunctionsCursor INTO @functionName;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = 'DROP FUNCTION dbo.' + QUOTENAME(@functionName);
    EXEC sp_executesql @sql;

    FETCH NEXT FROM dropFunctionsCursor INTO @functionName;
END

CLOSE dropFunctionsCursor;
DEALLOCATE dropFunctionsCursor;

-- ===============================
-- Drop the MULTI(ALL) existing TABLE-VALUED function

DECLARE @functionName NVARCHAR(255);
DECLARE dropFunctionsCursor CURSOR FOR
SELECT name
FROM sys.objects
WHERE (type_desc = 'SQL_SCALAR_FUNCTION' OR type_desc = 'SQL_TABLE_VALUED_FUNCTION') AND schema_id = SCHEMA_ID('dbo');

OPEN dropFunctionsCursor;
FETCH NEXT FROM dropFunctionsCursor INTO @functionName;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = 'DROP FUNCTION dbo.' + QUOTENAME(@functionName);
    EXEC sp_executesql @sql;

    FETCH NEXT FROM dropFunctionsCursor INTO @functionName;
END

CLOSE dropFunctionsCursor;
DEALLOCATE dropFunctionsCursor;



