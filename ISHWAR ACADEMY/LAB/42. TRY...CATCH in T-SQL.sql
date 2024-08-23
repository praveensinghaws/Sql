/*
-- TRY...CATCH in T-SQL - Example 1
The TRY...CATCH construct in T-SQL is used for error handling. 
It allows you to gracefully handle errors that may occur during the execution 
of a block of Transact-SQL statements. Here's a basic structure:

BEGIN TRY
    -- Code that might cause an error
END TRY
BEGIN CATCH
    -- Code to handle the error
END CATCH;
*/

USE DEMODB;
GO

BEGIN TRY
    -- Some operation that might cause an error
    SELECT 1 / 0; -- Division by zero to simulate an error
END TRY
BEGIN CATCH
    -- Code to handle the error
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;

--===============================================================

-- Begin TRY block

BEGIN TRY 
    -- Attempt a division operation
    SELECT 10 / 5 AS 'DIVISION';
END TRY 
-- Begin CATCH block
BEGIN CATCH 
    -- Handle any errors that occur in the TRY block
    SELECT ERROR_MESSAGE() AS 'ERROR MESSAGE';
END CATCH

--===============================================================

-- TRY...CATCH in T-SQL - Example 2

-- Begin TRY block
BEGIN TRY 
    -- Attempt a division by zero (which will cause an error)
    SELECT 10 / 0 AS 'DIVISION';
END TRY 
-- Begin CATCH block
BEGIN CATCH 
    -- Handle the division by zero error
    
    -- Display the error message
    SELECT ERROR_MESSAGE() AS 'ERROR MESSAGE',
    -- Display the line number where the error occurred
           ERROR_LINE() AS 'ERROR LINE',
    -- Display the error number
           ERROR_NUMBER() AS 'ERROR NUM',
    -- Display the name of the stored procedure or trigger where the error occurred
           ERROR_PROCEDURE() AS 'ERROR PROCEDURE';
END CATCH

--===============================================================

 -- Display the error message
    SELECT ERROR_MESSAGE() AS 'ERROR MESSAGE',
    -- Display the line number where the error occurred
           ERROR_LINE() AS 'ERROR LINE',
    -- Display the error number
           ERROR_NUMBER() AS 'ERROR NUM',
    -- Display the name of the stored procedure or trigger where the error occurred
           ERROR_PROCEDURE() AS 'ERROR PROCEDURE';
