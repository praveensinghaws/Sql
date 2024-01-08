-- Operators: https://dev.mysql.com/doc/refman/8.0/en/non-typed-operators.html
-- OPERATORS

-- Addition
SELECT 1 + 1;  -- Result: 2

-- Subtraction
SELECT 1 - 1;  -- Result: 0

-- Multiplication
SELECT 1 * 1;  -- Result: 1

-- Division
SELECT 1 / 1;  -- Result: 1


-- Increase salary by 1000
SELECT *, Salary + 1000 AS New_Salary FROM Employee;

-- Decrease salary by 5000
SELECT *, Salary - 5000 AS New_Salary FROM Employee;

-- Calculate 20% of the salary
SELECT *, Salary * 0.2 AS New_Salary FROM Employee;

-- Divide salary by 2000
SELECT *, Salary / 2000 AS New_Salary FROM Employee;

-- Select employees with salary > 50000 and job = 'Engineer'
SELECT * FROM Employee WHERE Salary > 50000 AND Job = 'Engineer';

-- Select all records from the 'product' table
SELECT * FROM product;

-- Select all records from the 'Employee' table
SELECT * FROM Employee;

-- Select products with price > 1000 and category = 'Electronics'
SELECT * FROM product WHERE Price > 1000 AND Category = 'Electronics';

-- Select products with price > 1000 or company = 'XYZ Tech'
SELECT * FROM product WHERE Price > 1000 OR Company = 'XYZ Tech';


