--******************************************************************************
-- DDL (Data Defination Language ) [CREATE , DROP , TRUNCATE , RENAME AND ALTER]
--******************************************************************************	

-- 1. ## CREATE NEW DATABASE
CREATE DATABASE demo;

-- 2. ## DELETE DATABASE
DROP DATABASE demo;

-- CREATE SCHEMA
CREATE SCHEMA demo_test;

CREATE TABLE demo_test.emp (
    id INT PRIMARY KEY,
    emp_name VARCHAR(50)
);

--  OR

-- Table: demo_test.emp

-- DROP TABLE IF EXISTS demo_test.emp;

CREATE TABLE IF NOT EXISTS demo_test.emp
(
    id integer NOT NULL,
    emp_name character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT emp_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS demo_test.emp
    OWNER to postgres;
	
-- Insert Data in Table:	
	
INSERT INTO demo_test.emp( id , emp_name) values  (1, 'Praveen Singh')

-- Select Command :
select * from demo_test.emp;

-- "Using TRUNCATE will empty the table, and it cannot be rolled back."
TRUNCATE demo_test.emp;

-- Dropping the table
DROP TABLE demo_test.emp;

-- Alter the column data type
ALTER TABLE demo_test.emp
ALTER COLUMN emp_name TYPE VARCHAR(100);

-- Rename the table
ALTER TABLE demo_test.emp
RENAME TO employee;

-- Creating new table 'Students'
CREATE TABLE demo_test.students
(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    house_number INTEGER,
    phone VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE,
    grad_year INTEGER
);

--****************************************************************
-- DML (Data Manipulation Language) [INSERT , UPDATE AND DELETE]
--****************************************************************

INSERT INTO demo_test.students (first_name, last_name, house_number, phone, email, grad_year)
VALUES
    ('Alice', 'Smith', 101, '555-1111', 'alice@example.com', 2023),
    ('Bob', 'Johnson', 202, '555-2222', 'bob@example.com', 2022),
    ('Eve', 'Brown', 303, '555-3333', 'eve@example.com', 2024),
    ('Charlie', 'Davis', 404, '555-4444', 'charlie@example.com', 2023),
    ('Grace', 'Wilson', 505, '555-5555', 'grace@example.com', 2022);
	
	
INSERT INTO demo_test.students (first_name, last_name, house_number, phone, email, grad_year)
VALUES
    ('Praveen', 'Singh', 111, '555-999', 'praveen@example.com', 2023),
    ('Rahul', 'Gandhi', 222, '555-99999', 'rahul@example.com', 2022),
    ('Priyanka', 'Gandhi', 333, '555-7878', 'priyanka@example.com', 2024),
    ('Sujeet', 'Yadav', 444, '555-5453', 'sujeet@example.com', 2023),
    ('Akhilesh', 'Yadav', 555, '555-67667', 'akhilesh@example.com', 2022);

-- Updating Single record in Table:
UPDATE demo_test.students
SET last_name = 'Yadav'
WHERE student_id = 17;

-- Updating Multiple record in Table:
UPDATE demo_test.students
SET last_name = 'Mishra'
WHERE student_id in (6,7,8,9);

--Deleting Single record in Table:
delete FROM demo_test.students where student_id = 10;

--Deleting Multiple records in Table:
delete FROM demo_test.students WHERE student_id in (6,7,8,9);

--*******************************************************************************************************
-- DQL (Data Quert Language) [* , DISTINCT , ORDER BY , WHERE , LIMIT , GROUP BY(sum,avg,min,max,count),
-- HAVING , INNTER JOIN , LEFT JOIN , RIGHT JOIN , FULL OUTER JOIN , CROSS JOIN clauses  ]
--*******************************************************************************************************
SELECT * FROM demo_test.students;
