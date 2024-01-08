--  DDL Trigger Part-I in MS SQL Server
-- Use the DEMODB database
USE DEMODB;

-- Display all triggers in the database
SELECT * FROM SYS.triggers;

-- Display the current contents of the Employee table
SELECT * FROM Employee;


-- Comment: Creating or altering a DDL trigger on the DATABASE level to capture both table creation and table deletion events.
CREATE OR ALTER TRIGGER tr_OnTableCreate
ON DATABASE
FOR CREATE_TABLE, DROP_TABLE
AS
BEGIN
	PRINT 'New Table is Created or Dropped Successfully....!';
END;

-- Creating a sample table
CREATE TABLE SAMPLETABLE (ID INT, NAME VARCHAR(20));

-- Dropping the sample table
DROP TABLE SAMPLETABLE;
