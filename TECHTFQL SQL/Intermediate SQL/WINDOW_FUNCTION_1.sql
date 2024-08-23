-- WINDOW FUNCTION PART 1 

--1. max
select dept_name ,max(salary) 
from emp
group by dept_name;

select e.*,
max(salary) OVER(partition by dept_name ORDER by emp_id) as Max_Salary
from emp e;

--2. row_number 

select e.*,
row_number () OVER(partition by dept_name) as rn
from emp e;

-- row_number Question: fetch the first 2 employee from each department to join the comapany.
SELECT * from (
    select e.*,
    row_number () OVER(partition by dept_name ORDER by emp_id) as rn
    from emp e) x
WHERE rn < 3;

--3. rank 
-- question : Fetch the top 3 employees in each department earning the max salary.
SELECT * from (
select e.*,
    rank () OVER(partition by dept_name ORDER by salary DESC) as rnk
    from emp e) x
    WHERE rnk < 4


--4. dense_rank 
SELECT * from (
select e.*,
    rank() OVER(partition by dept_name ORDER by salary DESC) as rnk, -- rank will skip value every duplicate
    dense_rank () OVER(partition by dept_name ORDER by salary DESC) as dense_rnk-- dense_rank will not skip any value
    from emp e) x
    WHERE dense_rnk < 4

-- row_number , rank and dense_rank
SELECT * from (
select e.*,
    rank() OVER(partition by dept_name ORDER by salary DESC) as rnk, 
    dense_rank () OVER(partition by dept_name ORDER by salary DESC) as dense_rnk,
    row_number () OVER(partition by dept_name ORDER by salary DESC) as rn
    from emp e) x

-- lead and lag
select e.*,
lag(salary) OVER(PARTITION BY dept_name ORDER by emp_id) as Previos_emp_Salary,
lead(salary) OVER(PARTITION BY dept_name ORDER by emp_id) as next_emp_Salary
from emp e 

--Question: Fetch a query to display if the salary of an employee is higher , lower or equal to the previous employee.

select e.*,
lag(salary) OVER(PARTITION BY dept_name ORDER by emp_id) as Previos_emp_Salary,
CASE
     when e.salary > lag(salary) OVER(PARTITION BY dept_name ORDER by emp_id) then 'higher than the previos salary'
     when e.salary < lag(salary) OVER(PARTITION BY dept_name ORDER by emp_id) then 'lower than the previos salary'
     when e.salary = lag(salary) OVER(PARTITION BY dept_name ORDER by emp_id) then 'same as the previos salary'
end  salary_range
from emp e;
