-- Table-valued Function in T-SQL
-- 1. SINGLE STATAEMENT
-- Create a table-valued function named 'getAllEmployees'
CREATE FUNCTION getAllEmployees(@salary DECIMAL)
RETURNS TABLE
AS
BEGIN
    -- Return all employees with the specified salary
    RETURN
    (
        SELECT * FROM Employee 
        WHERE EmpSalary = @salary
    );
END;

-- Use the getAllEmployees function to get employees with a salary of 80000
SELECT * FROM DBO.getAllEmployees(80000);

-- =============================================
-- 2. MULTI STATAEMENTS

-- Create a table-valued function named 'getEmployees'
CREATE FUNCTION getEmployees(@id VARCHAR(50))
RETURNS @Result TABLE
(
    ID INT,
    NAME VARCHAR(50),
    SALARY DECIMAL,
    DEPTID VARCHAR(50)
)
AS
BEGIN
    -- Insert employees with the specified department ID into the result table variable
    INSERT INTO @Result
    SELECT * FROM Employee WHERE EmpDeptID = @id;

    -- Return the result table variable
    RETURN;
END;

-- Use the getEmployees function to retrieve employees with department ID 'd2'
SELECT * FROM getEmployees('d2');
