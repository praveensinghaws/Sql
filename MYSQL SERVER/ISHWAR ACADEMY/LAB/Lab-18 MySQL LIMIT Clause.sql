-- LIMIT Clause: https://dev.mysql.com/doc/refman/8.2/en/limit-optimization.html

-- Selects all columns from the 'employee' table, orders the results by 'age', and limits the output to 5 rows
SELECT 
    *
FROM 
    employee
ORDER BY 
    age
LIMIT 
    5;

-- Selects 'age' as 'Age' and the sum of 'Salary' as 'Total_Salary' from the 'employee' table, groups the results by 'age', orders by the total salary in descending order, and limits the output to 3 rows
SELECT 
    age AS Age,
    SUM(Salary) AS Total_Salary
FROM 
    employee
GROUP BY 
    age
ORDER BY 
    Total_Salary DESC
LIMIT 
    3;
