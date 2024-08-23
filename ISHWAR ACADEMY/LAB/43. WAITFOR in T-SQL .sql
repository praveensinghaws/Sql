-- Switch to the DEMODB database
USE DEMODB;
GO

-- Get the current date and time
SELECT GETDATE();
GO

-- Begin a block of statements
BEGIN
    -- Wait until the specified time (21:35:30) is reached
    WAITFOR TIME '21:35:30';

    -- Select all rows from the Employee table
    SELECT * FROM Employee;
END
-- End the block of statements
GO

-- Get the current date and time
SELECT GETDATE();

-- Switch to the DEMODB database (Move this line before the previous SELECT statement if you want it to be part of the same session)
USE DEMODB;
GO

-- Begin another block of statements
BEGIN
    -- Wait for a delay of 20 seconds
    WAITFOR DELAY '00:00:20';

    -- Select all rows from the Employee table where EmpDeptID is 'D2'
    SELECT * FROM Employee WHERE EmpDeptID = 'D2';
END
-- End the second block of statements
GO

-- Get the current date and time
SELECT GETDATE();
GO
