--  TCL (Commit, Rollback, Save) in MS SQL Server

-- Switch to the DEMODB database.
USE DEMODB;

-- Select all records from the EMPLOYEE table.
SELECT * FROM EMPLOYEE;

-- Create a table named sampleTable with a column named id of type int.
CREATE TABLE sampleTable (id int);

-- Insert two records into the sampleTable.
INSERT INTO sampleTable VALUES (1001);
INSERT INTO sampleTable VALUES (1002);

-- Select all records from the sampleTable.
SELECT * FROM sampleTable;

-- Start a transaction and insert two records into the sampleTable.
-- Roll back the transaction, undoing the changes made within it.
BEGIN TRANSACTION;
    INSERT INTO sampleTable VALUES (1003);
    INSERT INTO sampleTable VALUES (1004);
ROLLBACK;

-- Start a transaction and insert two records into the sampleTable.
-- Save the transaction with a marker named A.
BEGIN TRANSACTION;
    INSERT INTO sampleTable VALUES (1003);
    INSERT INTO sampleTable VALUES (1004);
SAVE TRANSACTION A;

-- Start a new transaction and insert two records into the sampleTable.
-- Save the transaction with a marker named B.
BEGIN TRANSACTION;
    INSERT INTO sampleTable VALUES (1005);
    INSERT INTO sampleTable VALUES (1006);
SAVE TRANSACTION B;

-- Roll back to the marker A, undoing changes made since the marker was set.
ROLLBACK TRANSACTION A;

-- Start a new transaction and insert two records into the sampleTable.
-- Save the transaction with a marker named A.
BEGIN TRANSACTION;
    INSERT INTO sampleTable VALUES (1003);
    INSERT INTO sampleTable VALUES (1004);
SAVE TRANSACTION A;

-- Start a new transaction and insert two records into the sampleTable.
-- Save the transaction with a marker named B.
BEGIN TRANSACTION;
    INSERT INTO sampleTable VALUES (1005);
    INSERT INTO sampleTable VALUES (1006);
SAVE TRANSACTION B;

-- Commit the changes made in the current transaction.
COMMIT;

-- Attempt to roll back the entire transaction without a corresponding BEGIN TRANSACTION.
-- This will result in an error.
ROLLBACK; -- The ROLLBACK TRANSACTION request has no corresponding BEGIN TRANSACTION.
