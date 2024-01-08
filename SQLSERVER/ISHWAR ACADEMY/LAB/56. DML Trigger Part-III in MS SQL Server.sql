-- 56. DML Trigger Part-III in MS SQL Server

-- Use the DEMODB database
USE DEMODB;
GO

-- Display all triggers in the database
SELECT * FROM SYS.triggers;
GO

DROP TABLE IF EXISTS employeeLogs  ;

-- Creating the employeeLogs table to log modifications
CREATE TABLE employeeLogs (
   id INT,
   name VARCHAR(255),
   salary DECIMAL,
   deptid VARCHAR(255),
   modifiedBy VARCHAR(255),
   modifiedON DATE
);
GO


-- Display the current contents of the employee and employeeLogs tables
SELECT * FROM employee;
GO
SELECT * FROM employeeLogs;
GO


-- Creating a trigger to handle all DML operations on the employee table
CREATE OR ALTER TRIGGER tr_employee_allDMLOperations
ON employee
AFTER INSERT, DELETE, UPDATE
AS 
BEGIN
   -- INSERT
   IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
      INSERT INTO employeeLogs
      SELECT EmpId, EmpName, EmpSalary, EmpDeptID, 'Praveen Singh', GETDATE() 
      FROM deleted; -- Magic Table 'DELETED'

   -- UPDATE
   ELSE IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
      INSERT INTO employeeLogs
      SELECT EmpId, EmpName, EmpSalary, EmpDeptID, 'Praveen Singh', GETDATE() 
      FROM deleted; -- Magic Table 'DELETED'

   -- DELETE
   ELSE IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
      INSERT INTO employeeLogs
      SELECT EmpId, EmpName, EmpSalary, EmpDeptID, 'Praveen Singh', GETDATE() 
      FROM deleted; -- Magic Table 'DELETED'

   ELSE 
      BEGIN
         PRINT 'NOTHING CHANGED'
         RETURN
      END
END;
GO

-- Deleting a record from the Employee table where EmpID is 10
DELETE FROM EMPLOYEE WHERE EmpID = 10;
GO

-- Display the current contents of the employee table
SELECT * FROM employee;
GO
-- Display the contents of the employeeLogs table after modifications
SELECT * FROM employeeLogs;
GO

-- Inserting a new record into the Employee table
INSERT INTO Employee VALUES (9, 'PRAVEEN', 100000 , 'D3');
GO

-- Display the current contents of the employee table
SELECT * FROM employee;
GO
-- Display the contents of the employeeLogs table after modifications
SELECT * FROM employeeLogs;
GO

-- Updating a record in the Employee table
UPDATE Employee SET EmpSalary = 200000 WHERE EmpID = 10;
GO

-- Display the current contents of the employee table
SELECT * FROM employee;
GO
-- Display the contents of the employeeLogs table after modifications
SELECT * FROM employeeLogs;
GO
-- Deleting a record from the Employee table
DELETE FROM Employee WHERE EmpName = 'ADAM';
GO

-- Display the current contents of the employee table
SELECT * FROM employee;
GO
-- Display the contents of the employeeLogs table after modifications
SELECT * FROM employeeLogs;
GO










/*
DROP TABLE employeeLogs;
DROP TRIGGER tr_employee_allDMLOperations;
*/