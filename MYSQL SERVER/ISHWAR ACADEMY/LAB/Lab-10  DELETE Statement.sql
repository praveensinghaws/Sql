-- Delete Statement:  https://dev.mysql.com/doc/refman/8.0/en/delete.html

-- Select all records from the 'empnew' table
SELECT * FROM empnew;

-- Delete a specific record from 'empnew' where Emp_ID is 'emp002'
DELETE FROM empnew WHERE Emp_ID = 'emp002';

-- Delete records from 'empnew' where the salary is greater than or equal to 50000
DELETE FROM empnew WHERE Salary >= 50000;

DELETE FROM  EMPNEW WHERE DOJ  LIKE '%-03-%';


