USE DEMODB;

drop table if EXISTS EMPLOYEE;
-- Create the EMPLOYEE table without constraints
CREATE TABLE EMPLOYEE
(
    EMP_ID INT,
    EMP_NAME VARCHAR(50),
    SALARY DECIMAL(10, 2),
    CREATE_TIMESTAMP DATETIME
);

-- Insert 10 records into the EMPLOYEE table with manual EMP_ID values
INSERT INTO EMPLOYEE
    (EMP_ID, EMP_NAME, SALARY, CREATE_TIMESTAMP)
VALUES
    (101, 'John Doe', 50000.00, GETDATE()),
    (102, 'Jane Smith', 60000.00, GETDATE()),
    (103, 'Bob Johnson', 55000.00, GETDATE()),
    (104, 'Alice Brown', 65000.00, GETDATE()),
    (105, 'Charlie Wilson', 70000.00, GETDATE()),
    (106, 'Emma Davis', 48000.00, GETDATE()),
    (107, 'Frank Miller', 52000.00, GETDATE()),
    (108, 'Grace Taylor', 59000.00, GETDATE()),
    (109, 'David Lee', 63000.00, GETDATE()),
    (110, 'Eva Martin', 54000.00, GETDATE());

SELECT *
FROM EMPLOYEE;

-- Using a Common Table Expression (CTE) to identify duplicate records in the EMPLOYEE table
-- and assigning row numbers based on EMP_ID and CREATE_TIMESTAMP.
WITH DuplicateCTE AS (
    SELECT
        EMP_ID,
        CREATE_TIMESTAMP,
        ROW_NUMBER() OVER (PARTITION BY EMP_ID ORDER BY CREATE_TIMESTAMP) AS RowNum
    FROM EMPLOYEE
)
-- Delete records from the CTE where the row number is greater than 1,
-- effectively keeping only the records with the minimum CREATE_TIMESTAMP for each EMP_ID.
DELETE FROM DuplicateCTE WHERE RowNum > 1;




INSERT INTO EMPLOYEE
    (EMP_ID, EMP_NAME, SALARY, CREATE_TIMESTAMP)
VALUES
    (101, 'John Doe', 50000.00, GETDATE()),
    (102, 'Jane Smith', 60000.00, GETDATE()),
    (103, 'Bob Johnson', 55000.00, GETDATE()),
    (101, 'John Doe', 50000.00, GETDATE()),
    (101, 'John Doe', 50000.00, GETDATE());

-- Create a backup table EMPLOYEE_BACKUP with the same structure and data as EMPLOYEE
SELECT * INTO EMPLOYEE_BACKUP FROM EMPLOYEE;

-- Insert distinct records from EMPLOYEE_BACKUP into EMPLOYEE
INSERT INTO EMPLOYEE
SELECT DISTINCT * FROM EMPLOYEE_BACKUP;

-- Insert records with the lowest salary for each EMP_ID from EMPLOYEE_BACKUP into EMPLOYEE
INSERT INTO EMPLOYEE
SELECT EMP_ID, EMP_NAME, SALARY, CREATE_TIMESTAMP FROM 
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY EMP_ID ORDER BY SALARY) AS RN
    FROM EMPLOYEE_BACKUP
) X
WHERE RN = 1;

-- Display the contents of the EMPLOYEE_BACKUP table
SELECT * FROM EMPLOYEE_BACKUP;

-- Delete all records from the EMPLOYEE table
DELETE FROM EMPLOYEE ;

-- Delete all records from the EMPLOYEE table
DELETE FROM EMPLOYEE_BACKUP ;

-- Insert records with the lowest salary for each EMP_ID from EMPLOYEE_BACKUP into EMPLOYEE
INSERT INTO EMPLOYEE
SELECT EMP_ID, EMP_NAME, SALARY, CREATE_TIMESTAMP FROM 
(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY EMP_ID ORDER BY CREATE_TIMESTAMP DESC) AS RN
    FROM EMPLOYEE_BACKUP
) X
WHERE RN = 1;


-- Delete duplicate records from EMPLOYEE table, keeping only the ones with the latest CREATE_TIMESTAMP for each EMP_ID and SALARY combination
DELETE FROM EMPLOYEE
WHERE CREATE_TIMESTAMP IN (
    -- Subquery to assign row numbers based on descending CREATE_TIMESTAMP within each EMP_ID and SALARY partition
    SELECT CREATE_TIMESTAMP
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY EMP_ID, SALARY ORDER BY CREATE_TIMESTAMP DESC) AS RN
        FROM EMPLOYEE
    ) X
    WHERE RN != 1 -- Keep only the records with row number 1 (latest CREATE_TIMESTAMP)
);


-- Delete records from EMPLOYEE except those with the latest CREATE_TIMESTAMP for each EMP_ID
DELETE FROM E
FROM EMPLOYEE E
LEFT JOIN (
    SELECT EMP_ID, MAX(CREATE_TIMESTAMP) AS MaxTimestamp
    FROM EMPLOYEE
    GROUP BY EMP_ID
) LatestTimestamps ON E.EMP_ID = LatestTimestamps.EMP_ID AND E.CREATE_TIMESTAMP = LatestTimestamps.MaxTimestamp
WHERE LatestTimestamps.EMP_ID IS NULL;




