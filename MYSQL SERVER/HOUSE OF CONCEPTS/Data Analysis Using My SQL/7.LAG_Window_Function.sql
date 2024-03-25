/*
************************
 LAG function in MySQL
 ************************

LAG(expression, [offset], [default]) OVER ( [PARTITION BY partition_expression, ...])

The LAG function allows you to access the value of a column from the previous row in a dataset
If there is no such row, the return value is default

1.. Offset refers to the count of rows preceding the present row from which you wish to retrieve a value. The default setting is 1."
2.. The default value is the one that will be provided if there is no row preceding the current row by the specified offset. By default, this value is set to NU

Major Use-Cases
--------------------
Identifying Patterns in Time Series Data
*/ --********************************************* BASIC SCENARIO ********************************************

SELECT *,
       LAG(salary, 2, -1) OVER() as x
FROM employee;

/*
********************************************* ADVANCED SCENARIO ********************************************
Write an SQL query that retrieves the average salary for each skill, along with the previous year's Salary, 
and the percentage change in salary from the previous year..
*/

SELECT 
    *,
    LAG(AverageSalary) OVER(PARTITION BY Skill ORDER BY YEAR ASC) as Previous_Year_Salary,
    CONCAT(ROUND(((AverageSalary - LAG(AverageSalary) OVER(PARTITION BY Skill ORDER BY YEAR ASC)) / LAG(AverageSalary) OVER(PARTITION BY Skill ORDER BY YEAR ASC)) * 100, 2),'%') as Percent_Change
FROM 
    skill_wise_salaries;


-- Calculate percentage change using a subquery
SELECT 
    *,
    CONCAT(ROUND(((AverageSalary - Previous_Year_Salary) / Previous_Year_Salary) * 100, 2), '%') as Percent_Change
FROM
    (SELECT 
         *,
         LAG(AverageSalary) OVER (PARTITION BY Skill ORDER BY Year) as Previous_Year_Salary
     FROM 
         skill_wise_salaries
    ) as x;


