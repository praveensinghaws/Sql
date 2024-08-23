--  Create Stored Procedure in T-SQL

-- Switch to the DEMODB database
USE DEMODB;
GO

-- Create the PROC_ALLEMPDETAILS stored procedure
CREATE PROCEDURE PROC_ALLEMPDETAILS  
AS
BEGIN
    SELECT * FROM Employee;
END;
GO

-- Execute the PROC_ALLEMPDETAILS stored procedure
EXECUTE PROC_ALLEMPDETAILS;
GO
-- OR

-- Execute the PROC_ALLEMPDETAILS stored procedure
EXEC  PROC_ALLEMPDETAILS;
GO
-- ==========================================================
