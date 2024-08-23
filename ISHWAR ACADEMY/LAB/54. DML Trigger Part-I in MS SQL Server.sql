--  DML Trigger Part-I in MS SQL Server
-- Use the DEMODB database
USE DEMODB;

-- Create a trigger named TR_MESSAGE on the EMPLOYEE table
CREATE TRIGGER TR_MESSAGE
ON EMPLOYEE
AFTER INSERT 
AS
BEGIN
    -- Display a welcome message after an insertion into the EMPLOYEE table
    PRINT 'WELCOME TO OUR COMPANY';
END;

-- Insert a new record into the EMPLOYEE table
INSERT INTO EMPLOYEE VALUES(8, 'SONU' , 900000, 'D5');

-- Select all records from the EMPLOYEE table
SELECT * FROM EMPLOYEE;




USE DEMODB; -- Replace with your actual database name

SELECT 
    name AS TriggerName,
    OBJECT_NAME(parent_id) AS TableName,
    create_date AS CreationDate,
    modify_date AS LastModifiedDate
FROM sys.triggers;

-- OR

USE DEMODB; -- Replace with your actual database name

SELECT 
    name AS TriggerName,
    OBJECT_NAME(parent_id) AS TableName,
    create_date AS CreationDate,
    modify_date AS LastModifiedDate,
    OBJECT_DEFINITION(object_id) AS TriggerDefinition
FROM sys.triggers;



-- Retrieve details for all triggers in the database
SELECT * FROM sys.triggers;
