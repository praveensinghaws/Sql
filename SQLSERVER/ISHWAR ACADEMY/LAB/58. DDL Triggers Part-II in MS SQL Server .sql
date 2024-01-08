-- DDL Triggers Part-II in MS SQL Server 

-- Use the DEMODB database
USE DEMODB;

-- Comment: Displaying information about triggers in the database.
SELECT * FROM SYS.triggers;

-- Comment: Creating or altering a DDL trigger on the DATABASE level to capture table rename events.
CREATE OR ALTER TRIGGER tr_TableRename
ON DATABASE
FOR RENAME
AS
BEGIN
	PRINT 'TABLE IS RENAMED';
END;

-- Comment: Creating a new table named 'demotable' with specified columns.
CREATE TABLE demotable (
   id INT,
   name VARCHAR(10),
   salary DECIMAL
);

-- Displaying information about tables in the database
SELECT * FROM SYS.TABLES;

-- Comment: Renaming the table from 'SampleTableNew' to 'Trigger_DemoTable'.
sp_rename 'SampleTableNew', 'Trigger_DemoTable';

-- ===================================================================================

-- Comment: Creating a table named 'ddl_logs' to store information about DDL events.
CREATE TABLE ddl_logs (
	id INT IDENTITY PRIMARY KEY,
	event_data XML,
	performed_by SYSNAME,
	event_type VARCHAR(200)
);

-- Comment: Creating or altering a DDL trigger named 'tr_ddlEventTrigger' on the DATABASE level to capture CREATE_TABLE, RENAME, and DROP_TABLE events.
CREATE OR ALTER TRIGGER tr_ddlEventTrigger
ON DATABASE
FOR CREATE_TABLE, RENAME, DROP_TABLE
AS
BEGIN
	-- Inserting information about the DDL event into the 'ddl_logs' table.
	INSERT INTO ddl_logs (event_data, performed_by, event_type)
	VALUES (EVENTDATA(), USER, EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(max)'));
END;

-- Comment: Renaming 'Trigger_DemoTable' to 'EventCapture'
sp_rename 'demotable', 'EventCapture';

-- Comment: Creating a new table named 'village' with specified columns.
CREATE TABLE village (Vill_ID INT, Vill_Name VARCHAR(20), District VARCHAR(20));

-- Comment: Dropping the 'EventCapture' table.
DROP TABLE EventCapture;

-- Comment: Displaying the contents of the 'ddl_logs' table to view captured DDL events.
SELECT * FROM ddl_logs;
