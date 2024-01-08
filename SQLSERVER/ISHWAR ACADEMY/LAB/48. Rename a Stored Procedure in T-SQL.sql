--  Rename a Stored Procedure in T-SQL
-- Switch to the 'DEMODB' database
USE DEMODB;
GO

-- Rename the stored procedure from 'PROC_ALLEMPDETAILS' to 'PROC_DISPLAYEMPLOYEEDETAILS'
EXEC SP_RENAME 'PROC_ALLEMPDETAILS', 'PROC_DISPLAYEMPLOYEEDETAILS';
GO

-- Create a new stored procedure named 'PROC_DISPLAYEMPLOYEEDETAILS'
CREATE PROCEDURE PROC_DISPLAYEMPLOYEEDETAILS
AS
BEGIN 
    -- Select employee name, salary, and department location from Employee and Department tables
    SELECT e.EmpName, e.EmpSalary, d.DeptLocation
    FROM Employee e
    INNER JOIN Department d ON e.EmpDeptID = d.DeptID;
END;
GO

-- Select all records from SYS.sql_modules (this might be used for verification or checking the procedure's definition)
SELECT * FROM SYS.sql_modules;
