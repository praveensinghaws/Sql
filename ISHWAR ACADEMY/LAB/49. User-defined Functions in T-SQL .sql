-- User-defined Functions in T-SQL 
/*
In T-SQL (Transact-SQL), user-defined functions (UDFs) allow you to encapsulate a reusable piece of logic that can be called within SQL statements. There are two main types of user-defined functions: scalar functions and table-valued functions.

Scalar Functions:
A scalar function returns a single value based on the input parameters. Here's an example:
*/
-- Create a scalar function
CREATE FUNCTION dbo.AddTwoNumbers
(
    @num1 INT,
    @num2 INT
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;
    SET @result = @num1 + @num2;
    RETURN @result;
END;

-- Use the scalar function
DECLARE @sum INT;
SET @sum = dbo.AddTwoNumbers(5, 7);
SELECT @sum AS SumResult;


/*
In this example, the AddTwoNumbers function takes two integer parameters and returns their sum.

Table-Valued Functions:
A table-valued function returns a table as its result. Here's an example:
*/
-- Create a table-valued function
CREATE FUNCTION dbo.GetEmployeesByDepartment
(
    @deptID VARCHAR(10)
)
RETURNS TABLE
AS
RETURN
(
    SELECT EmpName, EmpSalary
    FROM Employee
    WHERE EmpDeptID = @deptID
);

-- Use the table-valued function
SELECT * FROM dbo.GetEmployeesByDepartment('D2');

-- Use the table-valued function with a specific department ID (replace 1 with the actual department ID)
SELECT * FROM dbo.GetEmployeesByDepartment('D1');


/*
In this example, the GetEmployeesByDepartment function takes a department ID as a parameter and returns a table with employee names and salaries for that department.

Remember that UDFs can be used in SELECT statements, WHERE clauses, JOIN conditions, and other places where expressions are allowed. They provide a way to modularize and reuse code within your SQL queries.
*/

