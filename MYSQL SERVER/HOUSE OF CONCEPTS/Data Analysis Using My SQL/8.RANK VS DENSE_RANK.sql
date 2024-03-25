RANK VS DENSE_RANK
/*
RANK() VS DENSE_RANK()

Window Function
*/
-- Case 1 Demo---

-- Create a temporary table named A
CREATE TEMPORARY TABLE A (
    val NUMERIC
);

-- Insert values into table A
INSERT INTO A VALUES (10);
INSERT INTO A VALUES (20);
INSERT INTO A VALUES (30);
INSERT INTO A VALUES (40);
INSERT INTO A VALUES (50);

-- Query to rank values in the val column of table A using the RANK() function
SELECT 
    val,
    RANK() OVER (ORDER BY val) AS rnk
FROM 
    A;

-- Case 2 Demo---

-- Create a temporary table named empnew
CREATE TEMPORARY TABLE empnew (
    EmpName VARCHAR(20),
    EmpSalary NUMERIC
);

-- Insert values into table empnew
INSERT INTO empnew VALUES ('Aman', 10000);
INSERT INTO empnew VALUES ('Baby', 20000);
INSERT INTO empnew VALUES ('Cintu', 30000);
INSERT INTO empnew VALUES ('Deepak', 30000);
INSERT INTO empnew VALUES ('Emraan', 40000);

-- Query to rank rows based on EmpSalary using RANK and DENSE_RANK functions
SELECT 
    *,
    RANK() OVER (ORDER BY EmpSalary) AS Rnk,
    DENSE_RANK() OVER (ORDER BY EmpSalary) AS Dense_Rnk
FROM 
    empnew;

-- ************************************** OTHER EXAMPLES  **********************************
-- Query to retrieve rows with the highest EmpSalary using DENSE_RANK() function
SELECT 
    * 
FROM 
    (
        SELECT 
            *,
            DENSE_RANK() OVER (ORDER BY EmpSalary DESC) AS Dense_Rnk
        FROM 
            empnew
    ) x 
WHERE 
    Dense_Rnk = 1;


-- Query to retrieve rows with the third highest EmpSalary using DENSE_RANK() function
SELECT 
    * 
FROM 
    (
        SELECT 
            *,
            DENSE_RANK() OVER (ORDER BY EmpSalary DESC) AS Dense_Rnk
        FROM 
            empnew
    ) x 
WHERE 
    Dense_Rnk = 3;

-- Query to retrieve rows with the second highest EmpSalary using RANK() function
SELECT 
    * 
FROM 
    (
        SELECT 
            *,
            RANK() OVER (ORDER BY EmpSalary DESC) AS Rnk
        FROM 
            empnew
    ) x 
WHERE 
    Rnk = 2;



SELECT * from empnew