--  Alter (Modify) a Stored Procedure in T-SQL

-- Switch to the DEMODB database
USE DEMODB;
GO

-- Alter the PROC_ALLEMPDETAILS stored procedure
ALTER PROCEDURE PROC_ALLEMPDETAILS 
AS
BEGIN 
    SELECT e.EmpName, e.EmpSalary, d.DeptLocation
    FROM Employee e
    INNER JOIN Department d ON e.EmpDeptID = d.DeptID;
END;
GO

-- Execute the PROC_ALLEMPDETAILS stored procedure
EXEC PROC_ALLEMPDETAILS;
GO

-- Alter the PROC_EMPDETAILSLOCATIONWISE stored procedure
ALTER PROCEDURE PROC_EMPDETAILSLOCATIONWISE
    @LOCATION AS VARCHAR(50)
AS
BEGIN
    SELECT e.EmpName, e.EmpSalary, d.DeptLocation
    FROM Employee e
    INNER JOIN Department d ON e.EmpDeptID = d.DeptID
    WHERE d.DeptLocation = @LOCATION;
END;
GO

-- Execute the PROC_EMPDETAILSLOCATIONWISE stored procedure with the parameter 'MUMBAI'
EXECUTE PROC_EMPDETAILSLOCATIONWISE @LOCATION = 'MUMBAI';
GO
