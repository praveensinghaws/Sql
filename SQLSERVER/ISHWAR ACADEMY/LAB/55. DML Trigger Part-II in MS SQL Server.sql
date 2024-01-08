-- DML Trigger Part-II in MS SQL Server

-- Separate batches with GO
GO

-- Switch to the DEMODB database
USE DEMODB;
GO

-- View details for all triggers in the database
SELECT * FROM sys.triggers;
GO

-- Selecting all data from the Employee table
SELECT * FROM Employee;
GO

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

-- Selecting all data from the employeeLogs table
SELECT * FROM employeeLogs;
GO

-- Trigger to log insertions into the Employee table
CREATE TRIGGER tr_employee_after_insert
ON employee
AFTER INSERT
AS
BEGIN
   INSERT INTO employeeLogs
   SELECT EmpId, EmpName, EmpSalary, EmpDeptID, 'Praveen Singh', GETDATE() 
   FROM inserted; -- Magic Table 'INSERTED'
END;
GO

-- Inserting a new record into the Employee table
INSERT INTO Employee VALUES (6, 'RAHUL', 50000, 'D5');
GO

-- Selecting all data from the Employee table
SELECT * FROM Employee;
GO

-- Selecting all data from the employeeLogs table
SELECT * FROM employeeLogs;
GO

-- Trigger to log updates in the Employee table
CREATE TRIGGER tr_employee_after_update
ON employee
AFTER UPDATE
AS
BEGIN
   INSERT INTO employeeLogs
   SELECT EmpId, EmpName, EmpSalary, EmpDeptID, 'Praveen Singh', GETDATE()
   FROM inserted; -- Magic Table 'INSERTED'
END;
GO

-- Selecting all data from the Employee table
SELECT * FROM Employee;
GO

-- Selecting all data from the employeeLogs table
SELECT * FROM employeeLogs;
GO

-- Updating the Employee table and triggering the update trigger
UPDATE Employee SET EmpSalary = EmpSalary + 20000 WHERE EmpID = 6;
GO

-- Selecting all data from the Employee table
SELECT * FROM Employee;
GO

-- Selecting all data from the employeeLogs table
SELECT * FROM employeeLogs;
GO

-- Trigger to log deletions from the Employee table
CREATE TRIGGER tr_employee_after_delete
ON employee
AFTER DELETE
AS
BEGIN
   INSERT INTO employeeLogs
   SELECT EmpId, EmpName, EmpSalary, EmpDeptID, 'Praveen Singh', GETDATE()
   FROM deleted; -- Magic Table 'DELETED'
END;
GO

-- Deleting a record from the Employee table and triggering the delete trigger
DELETE FROM Employee WHERE EmpName = 'RAHUL';
GO

-- Selecting all data from the Employee table
SELECT * FROM Employee;
GO

-- Selecting all data from the employeeLogs table
SELECT * FROM employeeLogs;
GO
