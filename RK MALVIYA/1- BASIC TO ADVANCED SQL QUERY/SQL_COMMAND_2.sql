SELECT * FROM demo_test.Customers;

-- CREATING TWO TABLES FOR SQL JOINS:
-- TABLE 1 CUSTOMER:
CREATE TABLE demo_test.Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO demo_test.Customers (customer_name, city)
VALUES
    ('Alice', 'New York'),
    ('Bob', 'Los Angeles'),
    ('Carol', 'Chicago'),
    ('David', 'Houston'),
    ('Eve', 'Miami'),
    ('Frank', 'Seattle'),
    ('Grace', 'Boston'),
    ('Henry', 'Atlanta'),
    ('Iris', 'Denver'),
    ('Jack', 'Phoenix');
	
	-- TABLE 2 ORDERS:
	
	CREATE TABLE demo_test.Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES demo_test.Customers(customer_id),
    order_amount DECIMAL(10, 2)
);

INSERT INTO demo_test.Orders (customer_id, order_amount)
VALUES
    (2, 150.00),
    (5, 200.00),
    (1, 75.00),
    (8, 300.00),
    (4, 120.00),
    (3, 250.00),
    (9, 80.00),
    (6, 175.00),
    (7, 100.00),
    (10, 220.00);

-- THIRD TABLE FOR CROSS JOIN 

CREATE TABLE demo_test.Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

INSERT INTO demo_test.Products (product_name, category)
VALUES
    ('Laptop', 'Electronics'),
    ('Smartphone', 'Electronics'),
    ('T-shirt', 'Clothing'),
    ('Jeans', 'Clothing'),
    ('Headphones', 'Electronics'),
    ('Sneakers', 'Footwear'),
    ('Watch', 'Accessories'),
    ('Backpack', 'Accessories'),
    ('Sunglasses', 'Accessories'),
    ('Desk', 'Furniture');

-- Creating Students_a table
CREATE TABLE demo_test.Students_A (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    house_number VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    grad_year INT
);

INSERT INTO demo_test.Students_A (first_name, last_name, house_number, phone, email, grad_year)
VALUES
    ('Alice', 'Johnson', '123 Main St', '555-1234', 'alice@example.com', 2023),
    ('Bob', 'Smith', '456 Elm St', '555-5678', 'bob@example.com', 2023),
    ('Carol', 'Williams', '789 Oak St', '555-9876', 'carol@example.com', 2024),
    ('David', 'Brown', '101 Maple Ave', '555-4567', 'david@example.com', 2022),
    ('Eve', 'Davis', '202 Pine Rd', '555-8765', 'eve@example.com', 2024);
	
	-- Creating same Students_b table from students_a
CREATE table demo_test.students_B
as 
SELECT * FROM demo_test.students_A WHERE 1=2;


  	INSERT INTO demo_test.Students_B (student_id, first_name, last_name, house_number, phone, email, grad_year)
VALUES
    (6, 'John', 'Miller', '789 Elm St', '555-2345', 'john@example.com', 2022),
    (7, 'Emily', 'Taylor', '456 Oak St', '555-6789', 'emily@example.com', 2023),
    (8, 'Daniel', 'Anderson', '123 Maple Ave', '555-3456', 'daniel@example.com', 2024),
    (9, 'Olivia', 'Jackson', '101 Pine Rd', '555-7654', 'olivia@example.com', 2023),
    (10, 'Michael', 'White', '202 Birch Ln', '555-9876', 'michael@example.com', 2022),
    (11, 'Praveen', 'Singh', 'Lucknow', '94544', 'praveen@example.com', 2010);

DELETE FROM demo_test.registration
WHERE student_id in (1,2,3,4,5);

truncate demo_test.registration;

CREATE TABLE demo_test.registration (
    student_id INT NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    status VARCHAR(10),
    start_date DATE
);

INSERT INTO demo_test.registration (student_id, first_name, last_name, status, start_date)
SELECT student_id, first_name, last_name, 'A', NULL FROM demo_test.students_b;



UPDATE demo_test.registration
SET status = 'D' where student_id =6;

--*********************************************************
-- SQL JOINS 
--*********************************************************
SELECT * FROM demo_test.students_a;
SELECT * FROM demo_test.students_b;
SELECT * from demo_test.registration;

-- INNER JOIN 
select a.student_id , a.first_name ,  c.status from demo_test.students_a a 
INNER join demo_test.registration c 
on a.student_id = c.student_id ;


-- LEFT JOIN OR LEFT OUTER JON  
select reg.student_id , reg.first_name ,reg.status ,std.last_name from demo_test.registration reg 
LEFT join demo_test.students_a std 
on std.student_id = reg.student_id ;


-- FULL JOIN OR FULL OUTER JON  
select reg.student_id ,reg.first_name ,reg.status ,std.last_name from demo_test.registration reg 
FULL join demo_test.students_a std 
on std.student_id = reg.student_id ;


-- CROSS JOIN OR CROSS OUTER JON  
select reg.student_id ,reg.first_name ,reg.status ,std.last_name from demo_test.students_a std 
CROSS join demo_test.registration reg where reg.first_name = 'Praveen';


-- SET Operations UNION , UNION ALL , INTERSECT and EXCEPT

-- UNION ALL (PRINT ALL RECORDS FROM BOTH THE TABLE)
SELECT student_id ,first_name , last_name  FROM demo_test.students_a
UNION ALL
SELECT student_id ,first_name , last_name  FROM demo_test.students_b;

-- UNION  (PRINT UNIQUE RECORDS FROM BOTH THE TABLE)
SELECT student_id ,first_name , last_name  FROM demo_test.students_a 
UNION 
SELECT student_id ,first_name , last_name  FROM demo_test.students_b;

-- INTERSECT  (The INTERSECT operator in SQL is used to retrieve distinct rows that are common between the result sets of two queries. In other words, it returns the shared data between two result sets. Like EXCEPT, the INTERSECT operator also removes duplicate rows from its result.)
--Example:1
SELECT student_id ,first_name FROM demo_test.registration 
INTERSECT 
SELECT student_id ,first_name  FROM demo_test.students_b;

--Example:2
SELECT student_id ,first_name FROM demo_test.students_a 
INTERSECT
SELECT student_id ,first_name  FROM demo_test.registration;

-- EXCEPT  (The EXCEPT operator in SQL is used to retrieve distinct rows from the result of the first query that are not present in the result of the second query. In other words, it returns the difference between the two result sets. The EXCEPT operator removes duplicate rows from its result.)
--Example:1
SELECT student_id ,first_name FROM demo_test.registration 
EXCEPT
SELECT student_id ,first_name  FROM demo_test.students_a;


--Example:2
SELECT student_id ,first_name FROM demo_test.students_a 
EXCEPT
SELECT student_id ,first_name  FROM demo_test.registration;

--*****************
--Advance Level
--*****************
--Example:1
SELECT student_id ,first_name FROM demo_test.students_a 
WHERE student_id in (3,4,5)
UNION ALl
SELECT student_id ,first_name  FROM demo_test.registration
WHERE student_id in (3,7,8)
order by student_id ASC;  -- ORDER BY Clause used in last statement.


--****************************************************************
--LIKE , ILIKE , NOT LIKE and NOT ILIKE  WITH X% , --% ---,% etc
--****************************************************************

-- ILIKE [ CASE Sensitive]
--Example 1:
SELECT * FROM demo_test.students_a    
WHERE first_name LIKE 'B%';   -- Start from letter 'B' 

--Example 2:
SELECT * FROM demo_test.students_a
WHERE first_name LIKE '%e';		-- End letter 'e'	

--Example 3:
SELECT * FROM demo_test.registration
WHERE first_name LIKE '%cha%';		-- charector  'cha' in 	word


--Example 4:
SELECT * FROM demo_test.registration
WHERE first_name LIKE '___' ;		-- word with 3 letters  '___' Underscore 


--Example 5:
SELECT * FROM demo_test.registration
WHERE first_name LIKE '%D____' ;		-- word with 5 letters as Start from 'D'  '%D___' Underscore 

-- ILIKE [ INCASE Sensitive]
--Example 1:
SELECT * FROM demo_test.registration    
WHERE first_name ILIKE 'p%';   -- Start from letter 'p' ,I used small letter.

--Example 2:
SELECT * FROM demo_test.registration    
WHERE first_name ILIKE '%h%';   --  'h' letter in between ,I used small letter.


-- NOT LIKE [ CASE Sensitive]

--Example 1:
SELECT * FROM demo_test.registration    
WHERE first_name Not LIKE '%h%';   --  'h' letter in between ,I used small letter.


-- NOT ILIKE [ IN CASE Sensitive]

--Example 1:
SELECT * FROM demo_test.registration    
WHERE first_name Not ILIKE '%H%';   --  'H' letter in between ,I used Capital letter.

--********************************************
-- IN  and NOT  IN 
--********************************************
--IN

-- EXAMPLE 1:
SELECT * FROM demo_test.registration  
where student_id in (6,7,11);

--EXAMPLE 2:
SELECT * FROM demo_test.registration  
where first_name in ('Praveen' ,'Bob');

--NOT IN 

-- EXAMPLE 1:
SELECT * FROM demo_test.registration  
where student_id NOT in (6,7,11);

--EXAMPLE 2:
SELECT * FROM demo_test.registration  
where first_name not in ('Praveen' ,'Bob');

--***************************************************************************************************************
-- CAST :In PostgreSQL, the term "CAST" refers to a type conversion operation that allows you to explicitly convert 
	--a value from one data type to another. This is often used when you want to ensure that a certain operation or 
	--comparison can be performed correctly between values of different data types. Casting allows you to change the
	--data type of an expression or a value to another data type.
	
	-- Syntex 1:    CAST(expression AS target_data_type)   [SELECT * FROM users WHERE age::numeric > 25;]
	-- Syntex 2:    expression::target_data_type   [SELECT CAST('123' AS integer);]
--******************************************************************************************************************
-- Syntex 1:    CAST(expression AS target_data_type) 
--Example 1:
SELECT CAST ('100' AS integer);
	
--Example 2:
SELECT CAST ('100' AS varchar);	
	
--Example 3:
SELECT CAST ('01-OCT-2025' AS DATE);		
	
-- Syntex 2:    expression::target_data_type 	

--Example 1:
SELECT '100' :: integer;	

--Example 2:
SELECT '100' :: varchar;	
	
--Example 3:
SELECT '01-OCT-2025' :: date;		
	
--**************************************************************
-- AGGRIGATE FUNCTION [COUN() , SUM() ,MIN(), MAX() and AVG()]
--**************************************************************


--**************************************************************
-- MATHMETICAL OPERATORS +, -, *, /, %, ^, |\, ||\, !, @
-- https://www.postgresql.org/docs/9.5/functions-math.html
--**************************************************************
-- '+'ADDITION:
SELECT 5+6 AS ADDITION;

-- '-'SUBSTRACTION:
SELECT 15-6 AS SUBSTRACTION;

-- '*'MULTIPLICATION:
SELECT 5*6 AS MULTIPLICATION;

-- '/'division (integer division truncates the result)	:
--EXP1:
SELECT 15 /6 AS DIVISION;
--EXP2:
-- '/'division (integer division truncates the result)	:
SELECT ROUND(15.00 /6.00,2) AS DIVISION;

-- '%'modulo (remainder)	:
SELECT 18%4 AS REMAINDER;

-- '^'exponentiation (associates left to right)	:
SELECT 5^3 AS EXPONENTIATION;

-- '|\'square root	:
SELECT |/25 AS SQUARE_ROOT;

-- '||\'cube root	:
SELECT ||/27 AS CUBE_ROOT;

-- '@'absolute value	:
SELECT @ -12.0 AS ABSOLUTE_VALUE;

-- '-'SUBSTRACTION:
SELECT 15-6 AS SUBSTRACTION;


-- '-'SUBSTRACTION:
SELECT 15-6 AS SUBSTRACTION;


-- '-'SUBSTRACTION:
SELECT 15-6 AS SUBSTRACTION;








	
	
	
	
	
