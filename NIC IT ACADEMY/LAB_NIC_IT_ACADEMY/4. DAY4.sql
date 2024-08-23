-- =================
-- Select statements:
-- =================

-- Select all columns from the "employees" table
SELECT * FROM employees;

-- Select specific columns from the "employees" table with aliases
SELECT
    employee_id,
    first_name,
    email,
    hire_date,
    salary,
    department_id
FROM employees;

-- =========================
-- COLUMN ALIAS :
-- =========================
-- Use column aliases with the AS keyword
SELECT
    employee_id AS emp_id,
    first_name,
    email,
    hire_date,
    salary,
    department_id
FROM employees;

-- Use column aliases without the AS keyword
SELECT
    employee_id emp_id,
    first_name,
    email,
    hire_date,
    salary,
    department_id
FROM employees;

-- Error in the SELECT statement, missing comma after "hire_date"
SELECT
    employee_id emp_id,
    first_name,
    email,
    hire_date salary,  -- Should be "hire_date, salary"
    department_id
FROM employees;

-- =========================
-- COLUMN CONCATINATION :
-- =========================

-- Concatenate first_name and last_name columns and alias it as full_name
SELECT
    employee_id,
    first_name,
    last_name,
    CONCAT(first_name, last_name) full_name,  -- Concatenate first_name and last_name
    email,
    hire_date,
    salary,
    department_id
FROM employees;

-- Correct the alias and include the "last_name" column
SELECT
    employee_id,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) full_name,  -- Concatenate first_name and last_name with a space
    email,
    hire_date,
    salary,
    department_id
FROM employees;

-- Error in the CONCAT function, should be CONCAT(CONCAT(first_name, ' '), last_name)
-- This will produce an "ORA-00909: invalid number of arguments" error
SELECT
    employee_id,
    first_name,
    last_name,
    CONCAT(CONCAT(first_name, ' '), last_name) full_name,  -- Error in CONCAT function
    email,
    hire_date,
    salary,
    department_id
FROM employees;

-- Using the CONCAT function
SELECT
   employee_id,
   FIRST_NAME,
   LAST_NAME,
   CONCAT(CONCAT(FIRST_NAME, '_'), LAST_NAME) FULL_NAME
FROM employees;
-- =========================
-- ALTERNATE WAY PIPE "||"
-- =========================
-- Using the || operator for concatenation
SELECT
   employee_id,
   FIRST_NAME,
   LAST_NAME,
   FIRST_NAME||' '|| LAST_NAME FULL_NAME
FROM employees;

-- =========================
-- COLUMN CALCULATION :
-- =========================

-- Calculate a new salary with a $1000 increase and rename it as "new_salary"
SELECT
    employee_id,
    first_name,
    email,
    hire_date,
    salary,
    salary + 1000 AS new_salary,  -- Calculate the new salary
    department_id
FROM employees;

-- Calculate the annual salary by multiplying the monthly salary by 12 and rename it as "annual_salary"
SELECT
    employee_id,
    first_name,
    email,
    hire_date,
    salary,
    salary * 12 AS annual_salary,  -- Calculate the annual salary
    department_id
FROM employees;

-- =========================
-- UNIQUE DEPARTMENT_ID :
-- =========================
-- Retrieve all department_id values from the employees table
SELECT department_id FROM employees;

-- Count the total number of department_id values in the employees table
SELECT COUNT(department_id) FROM employees;

-- Retrieve distinct department_id values from the employees table
SELECT DISTINCT department_id FROM employees;

-- Count the number of distinct department_id values in the employees table
SELECT COUNT(DISTINCT department_id) FROM employees; -- WILL NOT COUNT NULL

-- Count the number of distinct department_id values in the employees table, including NULLs
SELECT COUNT(DISTINCT NVL(department_id, '0')) FROM employees; --WILL COUNT NULL

-- Count the number of distinct combinations of department_id and job_id
SELECT COUNT(*) FROM (
    SELECT DISTINCT department_id, job_id FROM employees
);

-- =========================
-- WHERE CLAUSE :
-- =========================
-- Retrieve employees with a salary greater than 10,000
SELECT * FROM employees WHERE salary > 10000;

-- Retrieve employees with a salary less than 3,000
SELECT * FROM employees WHERE salary < 3000;

-- Retrieve employees with a salary between 5,000 and 7,000 (exclusive)
SELECT * FROM employees WHERE salary > 5000 AND salary < 7000;

-- Retrieve employees with a salary between 5,000 and 7,000 (inclusive)
SELECT * FROM employees WHERE salary >= 5000 AND salary <= 7000;

-- Retrieve employees with a salary between 5,000 and 7,000 (inclusive) using the BETWEEN operator
SELECT * FROM employees WHERE salary BETWEEN 5000 AND 7000;



-- Retrieve employees with salary not between 5000 and 7000
SELECT * FROM employees WHERE salary NOT BETWEEN 5000 AND 7000;

-- Retrieve employees in department_id 30
SELECT * FROM employees WHERE department_id = 30;

-- Incorrect syntax, should use IN instead of comma-separated values
-- Corrected query using IN:
SELECT * FROM employees WHERE department_id IN (30, 60, 90);

-- Retrieve employees with department_id in 30, 60, or 90
SELECT * FROM employees WHERE department_id IN (30, 60, 90);

-- Retrieve employees with department_id not in 30, 50, or 80
SELECT * FROM employees WHERE department_id NOT IN (30, 50, 80);

-- Retrieve employees in department_id 80 with a salary greater than 10,000
SELECT * FROM employees WHERE department_id = 80 AND salary > 10000;

-- Retrieve employees in department_id 60 or with a salary greater than 15,000
SELECT * FROM employees WHERE department_id = 60 OR salary > 15000;

-- Retrieve employees in department_id 60 or in department_id 80 with a salary greater than 10,000
SELECT * FROM employees WHERE department_id = 60 OR (department_id = 80 AND salary > 10000);

-- Retrieve the first 5 rows from the employees table
SELECT * FROM employees WHERE rownum <= 5;

-- Incorrect queries; should not use "=" or ">" for rownum
-- To retrieve the 5th and onwards rows, use ">" for rownum
SELECT * FROM employees WHERE rownum = 5; -- Wrong
SELECT * FROM employees WHERE rownum > 5; -- Wrong

-- Retrieve rownum, rowid, employee_id, and first_name from employees
SELECT ROWNUM, ROWID, employee_id, first_name FROM employees;

-- Incorrect query; should specify column names instead of "*"
-- Corrected query specifying column names
-- SELECT ROWNUM, ROWID, * FROM employees; -- ORA-00936: missing expression
SELECT ROWNUM, ROWID, e.* FROM employees e;

-- Retrieve employees with a NULL commission_pct
SELECT * FROM employees WHERE commission_pct IS NULL;

-- Retrieve employees with a non-NULL commission_pct
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

-- Count the total number of rows in the employees table
SELECT COUNT(*) FROM employees;


-- Count the number of non-null commission_pct values in the employees table
SELECT COUNT(commission_pct) FROM employees;

-- Count the number of rows where commission_pct is null
SELECT COUNT(*) FROM employees WHERE commission_pct IS NULL;

-- Retrieve employee_id, hire_date, and the year part of hire_date
SELECT employee_id, hire_date, TO_CHAR(hire_date, 'yyyy') FROM employees;

-- Retrieve employee_id, hire_date, and convert the year part of hire_date to a number
SELECT employee_id, hire_date, TO_NUMBER(TO_CHAR(hire_date, 'yyyy')) FROM employees;

-- Retrieve employee_id, hire_date, and the month part of hire_date as a number
SELECT employee_id, hire_date, TO_NUMBER(TO_CHAR(hire_date, 'mm')) FROM employees;

-- Retrieve employee_id, hire_date, and the abbreviated month name
SELECT employee_id, hire_date, TO_CHAR(hire_date, 'mon') FROM employees;

-- Retrieve employee_id, hire_date, and the full month name
SELECT employee_id, hire_date, TO_CHAR(hire_date, 'Month') FROM employees;

-- Retrieve employee_id, hire_date, and the day part of hire_date
SELECT employee_id, hire_date, TO_CHAR(hire_date, 'dd') FROM employees;

-- Retrieve employee_id, hire_date, and the formatted date and time
SELECT employee_id, hire_date, TO_CHAR(hire_date, 'dd-mm-yyyy hh24:mi:ss') FROM employees;

-- Retrieve all employees hired in the year 2005
SELECT * FROM employees WHERE TO_CHAR(hire_date, 'yyyy') = '2005';

-- Retrieve all employees hired between September 2005 and September 2006
SELECT * FROM employees WHERE TO_CHAR(hire_date, 'mmyyyy') BETWEEN '092005' AND '092006';

-- Retrieve all employees hired in February (month '02')
SELECT * FROM employees WHERE TO_CHAR(hire_date, 'mm') = '02';

-- Retrieve all employees hired in March 2005 (month '03' and year '2005')
SELECT * FROM employees WHERE TO_CHAR(hire_date, 'mmyyyy') = '032005';

-- Retrieve all employees hired on a Monday
SELECT * FROM employees WHERE TO_CHAR(hire_date, 'FMDay') = 'Monday';

-- Retrieve all employees hired on a Tuesday (day '2' in Oracle's date format)
SELECT * FROM employees WHERE TO_CHAR(hire_date, 'D') = '2';

-- Retrieve the current date and time from the database
SELECT SYSDATE FROM DUAL;

-- Retrieve the current date and time from the database (alternative)
SELECT CURRENT_DATE FROM DUAL;

-- Retrieve the current date and time for each employee (Note: This might not be what you intend)
SELECT SYSDATE FROM employees;

-- Retrieve the current timestamp from the database
SELECT SYSTIMESTAMP FROM DUAL;

-- Retrieve the current timestamp from the database, truncated to the nearest second
SELECT TRUNC(SYSTIMESTAMP) FROM DUAL;

-- =========================
-- PATTERN MATCHING LIKE:
-- =========================

-- Retrieve employees with first names starting with 'A'
SELECT * FROM employees WHERE first_name LIKE 'A%';

-- Retrieve employees with first names starting with 'a' (case-insensitive)
SELECT * FROM employees WHERE first_name LIKE 'a%';

-- Retrieve employees with first names starting with 'J' (case-insensitive)
SELECT * FROM employees WHERE UPPER(first_name) LIKE 'J%';

-- Retrieve employees with first names ending with 's'
SELECT * FROM employees WHERE first_name LIKE '%s';

-- Retrieve employees with first names containing 'an'
SELECT * FROM employees WHERE first_name LIKE '%an%';

-- Retrieve employees with first names starting with 'S' and ending with 'n'
SELECT * FROM employees WHERE first_name LIKE 'S%n';

-- Retrieve employees with exactly 7 characters in their first name
SELECT * FROM employees WHERE first_name LIKE '_______';

-- Retrieve employees with first names of length 7
SELECT * FROM employees WHERE LENGTH(first_name) = 7;

-- Retrieve employees with a first name that starts with any character, followed by 'a', and then five more characters
SELECT * FROM employees WHERE first_name LIKE '_a_____';

-- Retrieve employees with a first name that starts with any character, followed by 'a', any character, and then four more characters
SELECT * FROM employees WHERE first_name LIKE '_a_t___';

-- Retrieve employees with first names starting with 'A' and salary ending with '200'
SELECT * FROM employees WHERE first_name LIKE 'A%' AND salary LIKE '%200';

-- Retrieve employees with first names containing an underscore
-- (escape the underscore to match it explicitly using the escape character '\')
SELECT * FROM employees WHERE first_name LIKE '%\_%' ESCAPE '\';


-- =========================
-- SORTING ORDER BY ASC AND DESC:
-- =========================
-- Retrieve all employees
SELECT * FROM employees;

-- Get the ASCII value of 'A' (uppercase)
SELECT ASCII('A') FROM DUAL; -- 65

-- Get the ASCII value of 'a' (lowercase)
SELECT ASCII('a') FROM DUAL; -- 97

-- Retrieve employees sorted by first_name in ascending order
SELECT * FROM employees ORDER BY first_name;

-- Retrieve employees sorted by first_name in descending order
SELECT * FROM employees ORDER BY first_name DESC;

-- Retrieve employees sorted by salary in ascending order
SELECT * FROM employees ORDER BY salary ASC;

-- Retrieve employees sorted by salary in descending order
SELECT * FROM employees ORDER BY salary DESC;

-- =========================
-- NULL TREATED AS HIGHEST VALUE :
-- =========================
-- Retrieve employees sorted by commission_pct in ascending order
SELECT * FROM employees ORDER BY commission_pct;

-- Retrieve employees sorted by commission_pct in descending order
SELECT * FROM employees ORDER BY commission_pct DESC;

-- =========================
-- ORDER BY MORE THAN ONE COLUMN :
-- =========================
-- Sort employees by salary in descending order and then by hire_date in ascending order.
SELECT * FROM employees ORDER BY salary DESC, hire_date ASC;

-- Sort employees by the 8th column (column position) in ascending order.
-- Note: Using column positions is not recommended for readability.
SELECT * FROM employees ORDER BY 8;

-- Sort employees by the 6th column (column position) in ascending order and
-- by the 8th column (column position) in descending order.
-- Note: Using column positions is not recommended for readability.
SELECT * FROM employees ORDER BY 6, 8 DESC;
-- =========================
-- DONE:
-- =========================
