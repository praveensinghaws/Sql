-- Select all columns from the 'employee_info' table where EmpSalary is greater than or equal to 55000
SELECT * FROM employee_info 
WHERE EmpSalary >= 55000;



-- Select all columns from the 'employee_info' table where Job is greater than or equal to 'Manager'
SELECT * FROM employee_info 
WHERE Job >= 'Manager';


-- Update EmpSalary in the 'employee_info' table by subtracting 15000 for employees not in the 'Manager' role
UPDATE employee_info 
SET EmpSalary = EmpSalary - 15000 
WHERE Job != 'Manager';


-- Delete records from the 'employee_info' table where EmpId is greater than 5
DELETE FROM employee_info 
WHERE EmpId > 5;
