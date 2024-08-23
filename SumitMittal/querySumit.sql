SELECT * FROM employee LIMIT 1;

/*	
-- OVER (PARTITION BY )
SELECT 
    e.fname, 
    e.lname, 
    e.location, 
    t.total_count, 
    t.avg_salary 
FROM 
    employee e
JOIN 
    (SELECT 
        location, 
        COUNT(location) AS total_count, 
        AVG(salary) AS avg_salary 
     FROM 
        employee 
     GROUP BY 
        location) t 
ON 
    e.location = t.location;

-- **************************************************************
SELECT 
    fname, 
    lname, 
    location, 
    count(location) OVER (PARTITION BY location) as total_count, 
    avg(salary) OVER (PARTITION BY location) as avg_salary 
FROM 
	employee;
-- **************************************************************

-- ROW NUMBER


SELECT * FROM
(
SELECT 
    fname, 
    lname, 
    salary, 
	ROW_NUMBER() OVER (ORDER BY salary DESC) AS rownum
FROM employee
) X 
WHERE rownum <= 5;
-- **************************************************************

-- OVER (PARTITION BY  ORDER BY) 
SELECT 
    fname, 
    lname,
	location, 
    salary, 
	ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary DESC) AS rownum
FROM employee;
-- **************************************************************

SELECT * FROM 
(
SELECT 
    fname, 
    lname,
	location, 
    salary, 
	ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary DESC) AS rownum
FROM employee
) X

WHERE rownum = 1;
-- **************************************************************

SELECT * FROM 
(
SELECT 
    fname, 
    lname,
	location, 
    salary, 
	rank() OVER (PARTITION BY location ORDER BY salary DESC) AS rnk
FROM employee
) X

WHERE rnk = 1;
-- **************************************************************

SELECT 
    fname, 
    lname,
    location, 
    salary, 
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,   -- Assigns a unique row number within each partition
    RANK() OVER (ORDER BY salary DESC) AS rnk,         -- Assigns the same rank to tied values, with gaps in rank numbers
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rnk   -- Assigns the same rank to tied values, without gaps in rank numbers
FROM 
    employee;
*/    
SELECT * FROM
(
SELECT 
    fname, 
    lname,
    location, 
    salary, 

    RANK() OVER (PARTITION BY location ORDER BY salary DESC) AS rnk
FROM 
    employee
) X
WHERE rnk =1;







































































/*

*****************
| LEARNING SQL	|
*****************

SELECT GROUP_CONCAT(COLUMN_NAME SEPARATOR ', ') AS column_names 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'students';

**********************************************************************************************************

### Example Queries:

If you have a table named `students` in a database named `demodb`, here’s how you can check the constraints:

1. **Foreign Key Constraints**:
    ```sql
    SELECT 
        CONSTRAINT_NAME, 
        TABLE_NAME, 
        COLUMN_NAME, 
        REFERENCED_TABLE_NAME, 
        REFERENCED_COLUMN_NAME 
    FROM 
        INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
    WHERE 
        REFERENCED_TABLE_NAME IS NOT NULL 
        AND TABLE_SCHEMA = 'demodb'
        AND TABLE_NAME = 'students';
    ```

2. **Check Constraints**:
    ```sql
    SELECT 
        CONSTRAINT_NAME, 
        TABLE_NAME, 
        CHECK_CLAUSE 
    FROM 
        INFORMATION_SCHEMA.CHECK_CONSTRAINTS 
    WHERE 
        CONSTRAINT_SCHEMA = 'demodb'
        AND TABLE_NAME = 'students';
    ```

3. **Primary Key Constraints**:
    ```sql
    SELECT 
        CONSTRAINT_NAME, 
        TABLE_NAME, 
        COLUMN_NAME 
    FROM 
        INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
    WHERE 
        CONSTRAINT_NAME = 'PRIMARY'
        AND TABLE_SCHEMA = 'demodb'
        AND TABLE_NAME = 'students';
    ```
*************************************************************************

-- Rename the table 'old_table' to 'new_table'
RENAME TABLE old_table TO new_table;

***************************************************************************
To execute or query a view in MariaDB or MySQL, you use a `SELECT` statement just like you would with a regular table. Here’s how you can do it:

### Query the View

To retrieve data from a view named `mydata`, use:

```sql
SELECT * FROM mydata;
```

### Example

Assuming you have created a view `mydata` with the following SQL:

```sql
CREATE VIEW mydata AS
SELECT student_company,
       COUNT(*) AS count_exp
FROM students
GROUP BY student_company;
```

You can execute the view to see the results by running:

```sql
SELECT * FROM mydata;
```
*/


















