--  Clustered Index in MS SQL Server

-- Creating a clustered index named idx_employee_name on the 'employee' table with the 'name' column in descending order.
CREATE  CLUSTERED INDEX idx_employee_name
ON employee(name ASC);

-- Dropping the index named IDX_EMP_SALARY on the 'employee' table.
DROP INDEX IDX_EMP_SALARY ON EMPLOYEE;

-- Dropping the index named IDX_EMPLOYEE_NAME on the 'employee' table.
DROP INDEX IDX_EMPLOYEE_NAME ON EMPLOYEE;

-- Selecting all records from the 'employee' table.
SELECT * FROM employee;

CREATE  CLUSTERED INDEX idx_emp_name_location
ON employee(id desc , location asc );

-- Selecting all records from the 'employee' table.
SELECT * FROM employee;