-- Switch to the employeeDB database
USE employeeDB;

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';

-- Inserting 5 records with Indian data
INSERT INTO employee_info (empid, empname, empsalary, job, phone, deptid)
VALUES
(1, 'Rajesh Kumar', 50000.00, 'Developer', 9876543210, 101),
(2, 'Priya Sharma', 60000.00, 'Manager', 8765432109, 102),
(3, 'Amit Patel', 55000.00, 'Analyst', 7654321098, 103),
(4, 'Sneha Gupta', 52000.00, 'Designer', 6543210987, 101),
(5, 'Anand Singh', 58000.00, 'Engineer', 5432109876, 104);

-- Inserting 2 records with specific columns including NULL in Phone
INSERT INTO employee_info (EmpId, EmpName, EmpSalary, Job, Phone, DeptID)
VALUES
(6, 'Praveen Kumar', 50000.00, 'Developer', 9876543212, 101),
(7, 'Rahul Sharma', 60000.00, 'Manager', 9876543211, 102);


-- Insert 5 records into the department_info table
INSERT INTO department_info (DeptId, deptname, deptLocation) VALUES
    (101, 'IT', 'New York'),
    (102, 'Finance', 'London'),
    (103, 'HR', 'Paris'),
    (104, 'Marketing', 'Tokyo'),
    (105, 'Operations', 'Sydney');
