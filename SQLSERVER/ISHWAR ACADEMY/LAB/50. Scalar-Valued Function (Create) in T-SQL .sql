--  Scalar-Valued Function (Create) in T-SQL 
-- Switch to the 'DEMODB' database
USE DEMODB;
GO

-- Create a scalar-valued function named 'SALARY'
CREATE FUNCTION SALARY(@NAME AS VARCHAR(50))
RETURNS DECIMAL
BEGIN
    -- Declare a variable to store the salary
    DECLARE @SAL DECIMAL;

    -- Retrieve the salary for the given employee name
    SELECT @SAL = EMPSALARY FROM Employee
    WHERE EMPNAME = @NAME;

    -- Return the salary
    RETURN @SAL;
END;

-- Use the SALARY function to get the salary for the employee named 'MIKE'
SELECT DBO.SALARY('MIKE') AS MIKE_SALARY;

-- =======================================================

-- Create a scalar-valued function
CREATE FUNCTION dbo.MultiplyNumbers
(
    @num1 INT,
    @num2 INT
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;
    SET @result = @num1 * @num2;
    RETURN @result;
END;

-- Use the scalar-valued function
DECLARE @product INT;
SET @product = dbo.MultiplyNumbers(10, 5);
SELECT @product AS ProductResult;


-- =======================================================
