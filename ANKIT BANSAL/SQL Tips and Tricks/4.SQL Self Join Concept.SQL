-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

DROP TABLE IF EXISTS EMP_NEW;
CREATE TABLE EMP_NEW (
    EMP_ID INT,
    EMP_NAME VARCHAR(50),
    SALARY INT,
    MANAGER_ID INT
);

INSERT INTO EMP_NEW (EMP_ID, EMP_NAME, SALARY, MANAGER_ID)
VALUES
(1, 'ANKIT', 10000, 4),
(2, 'MOHIT', 15000, 5),
(3, 'VIKAS', 10000, 4),
(4, 'ROHIT', 5000, 2),
(5, 'MUDIT', 12000, 6),
(6, 'AGRAM', 12000, 2),
(7, 'SANJAY', 9000, 2),
(8, 'ASHISH', 5000, 2);

-- Retrieve details of employees and their managers where the employee's salary is greater than the manager's salary
SELECT 
    E.EMP_ID, 
    E.EMP_NAME, 
    M.EMP_NAME AS MANAGER, 
    E.SALARY AS EMP_SAL, 
    M.SALARY AS MGR_SAL
FROM 
    EMP_NEW E
JOIN 
    EMP_NEW M ON E.MANAGER_ID = M.EMP_ID
WHERE 
    E.SALARY > M.SALARY;
