-- Working with Variables in SQL Server

-- Use the DEMO database
USE DEMO;

-- Section 1: Declare and set variables for name and age
DECLARE @name1 VARCHAR(50), @age1 INT;
SET @name1 = 'Rahul Gandhi'; -- Set the value for the name variable
SET @age1 = 45; -- Set the value for the age variable
SELECT @name1 AS 'Name', @age1 AS 'Age';

-- Section 2: Declare and set variables for name and age in a single SELECT statement
DECLARE @name2 VARCHAR(50), @age INT;
SELECT @name2 = 'Praveen Singh', @age = 32; -- Set values for both variables in a single statement
SELECT @name2 AS 'Name', @age AS 'Age';

-- Section 3: Set the value for the name variable and display it
DECLARE @name VARCHAR(50);
SET @name = 'Lucknow UP';
SELECT @name AS Address;


-- Section 4: Working with numeric variables

-- Declare and initialize a variable
DECLARE @number INT = 100;

-- Perform addition on the variable
SET @number += 50;
-- Display the result of addition
SELECT @number AS 'Number+50';

-- Perform subtraction on the variable
SET @number -= 50;
-- Display the result of subtraction
SELECT @number AS 'Number-50';

-- Perform multiplication on the variable
SET @number *= 50;
-- Display the result of multiplication
SELECT @number AS 'Number*50';

-- Section 5: Using a variable to filter employee information
-- Declare and set the variable for the department location
DECLARE @deptLocation VARCHAR(50);
SET @deptLocation = 'NEW YORK';


DECLARE @EMPNAME VARCHAR(20) , @EMPAGE INT , @SALARY DECIMAL(7,2) = 45000;
SELECT @EMPNAME = 'Priyanka Pandey' , @EMPAGE = '22' ;;
SELECT @EMPNAME AS 'EMP_NAME',@EMPAGE AS 'EMP_AGE',@SALARY AS 'EMP_SALARY';


-- Query: Selecting employee information for those whose department is located in the specified location using a variable
SELECT *
FROM EmployeeTable
WHERE EmpDeptID IN (SELECT DeptID FROM DepartmentTable WHERE DeptLocation = @deptLocation);
