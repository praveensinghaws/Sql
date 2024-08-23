-- #########################################################################################################################
/*																															|
In PostgreSQL, subqueries can be used in various ways to retrieve data or perform operations within the context of another  |
query. Here are some types of subqueries commonly used in PostgreSQL:														|
*/--																														|
-- #########################################################################################################################

/*
---------------------
1: Scalar Subquery: |
---------------------
Returns a single value and can be used in a context where a single value is expecte
>>>>>>>>>>>>>>>>>>>>>>>
SELECT column_name
FROM table_name
WHERE column_name = (SELECT another_column FROM another_table WHERE condition);
*/

--==============
-- SAME TYPE-1 |
--==============
SELECT E.FIRST_NAME , E.LAST_NAME , E.SALARY
FROM EMPLOYEES E
WHERE SALARY >
        (SELECT AVG(SALARY)
         FROM EMPLOYEES);


--==============
-- SAME TYPE-2 |
--==============

SELECT E.FIRST_NAME , E.LAST_NAME , E.SALARY , AVG_SAL.AVGSAL 
FROM EMPLOYEES E 
JOIN (SELECT ROUND(AVG(SALARY),2) AVGSAL 
FROM EMPLOYEES) AVG_SAL
ON E.SALARY > AVG_SAL.AVGSAL;

/*
-------------------
 2: Row Subquery: |  [MULTIPLE ROW SUBQUERY]
-------------------


>>>>>>>>>>>>>>>>>>>>>>>
SELECT column_name
FROM table_name
WHERE (column1, column2) = (SELECT column1, column2 FROM another_table WHERE condition);
*/
 -- 1.SUBQUERY WHICH RETURNS MULTIPLE COLUMN AND MULTIPLE ROW.
-- Q1. FIND THE  EPMLOYEES WHO CAN EARN THE HIGHEST SALARY EN EACH DEPARTMENT.

SELECT * FROM employees E
JOIN departments D ON D.department_id = E.department_id
WHERE (D.department_name , salary) IN (
                                        SELECT D.department_name , MAX(salary)
                                        FROM employees E
                                        JOIN departments D ON E.department_id = D.department_id
                                        GROUP BY D.department_name );

 -- 2.SUBQUERY WHICH RETURNS ONLY 1 RCOLUMN AND MULTIPLE ROW.
-- Q2. FIND DEPARTMENT WHO DO NOT HAVE ANY EMPLOYEES.
-- SUBQUERY
SELECT * FROM departments
WHERE department_id NOT IN 
                        (
                        SELECT DISTINCT department_id 
                        FROM employees
                        );

-- OR  SUBQUERY

SELECT * FROM departments
WHERE department_id NOT IN 
                        (
                        SELECT DISTINCT department_id FROM employees 
                        WHERE department_id IS NOT NULL
                        );

-- OR WITH JOIN 
SELECT departments.*
FROM departments
LEFT JOIN employees 
ON departments.department_id = employees.department_id
WHERE employees.department_id IS NULL;

/*
---------------------
3: Column Subquery: |
---------------------
Returns a single column of values.
>>>>>>>>>>>>>>>>>>>>>>>
SELECT column_name
FROM table_name
WHERE column_name OPERATOR (SELECT column_name FROM another_table WHERE condition);

*/





/* 
-------------------
4:Table Subquery: |
-------------------
Returns a whole table.
>>>>>>>>>>>>>>>>>>>>>>>
SELECT *
FROM table_name
WHERE (column1, column2) IN (SELECT column1, column2 FROM another_table WHERE condition);
*/




/*
-----------------------
5:Correlated Subquery:|
-----------------------
Depends on the values of the outer query and can reference columns from the outer query.
>>>>>>>>>>>>>>>>>>>>>>>
SELECT column_name
FROM table_name outer
WHERE column_name OPERATOR (SELECT column_name FROM another_table WHERE condition = outer.column_name);
*/

-- CORRELATED SYBQUERY
-- Q1. FIND THE EMPLOYEES IN EACH DEPARTMENTS WHO EAR MORE THAN THE AVERAGE SALARY IN THAT DEPARTMENT.

SELECT * FROM employees E1
 WHERE salary > 
                (SELECT AVG(SALARY) 
                FROM employees E2
                 WHERE E2.department_id =E1.department_id);

/*
It retrieves all rows from the employees table where the salary is greater than the average salary
in the same department. This type of query is using a subquery to calculate the average salary for 
each department and then compares each employee's salary to the average of their respective department.
*/



/*
--------------------
6:Exists Subquery: |
--------------------
Checks for the existence of rows that satisfy a specified condition.
>>>>>>>>>>>>>>>>>>>>>>>
SELECT column_name
FROM table_name outer
WHERE EXISTS (SELECT 1 FROM another_table WHERE condition = outer.column_name);
*/

-- Q2. FIND DEPARTMENT WHO DO NOT HAVE ANY EMPLOYEES.

SELECT *
FROM departments D
WHERE NOT EXISTS (SELECT 1 FROM employees E WHERE D.department_id=E.department_id );


-- NESTED SUBQUERY 
-- Q1. 