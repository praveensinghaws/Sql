-- Switch to the DEMODB database
USE DEMODB;
-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Here is the ready script:
create table emp_2020
(
emp_id int,
designation varchar(20)
);

create table emp_2021
(
emp_id int,
designation varchar(20)
)

insert into emp_2020 values (1,'Trainee'), (2,'Developer'),(3,'Senior Developer'),(4,'Manager');
insert into emp_2021 values (1,'Developer'), (2,'Developer'),(3,'Manager'),(5,'Trainee');

select * from emp_2020;
select * from emp_2021;

--  find the change in employee status 
-- Output 1,3,4,5

-- Select a combined 'Emp_id' column using ISNULL to handle null values from either table
-- Use a CASE statement to determine the 'Comment' based on the designation changes and null values
-- Perform a FULL OUTER JOIN on 'emp_id' between 'emp_2020' and 'emp_2021'
-- Filter the results where there is a change in designation between the two tables
SELECT ISNULL(e20.emp_id, e21.emp_id) AS Emp_id,
       CASE
         WHEN e20.designation != e21.designation THEN 'Promoted'
         WHEN e21.designation IS NULL THEN 'Resigned'
         ELSE 'New Joinee'
       END AS Comment
FROM emp_2020 e20
FULL OUTER JOIN emp_2021 e21 ON e20.emp_id = e21.emp_id
WHERE ISNULL(e20.designation, 'xxx') != ISNULL(e21.designation, 'yyy');
