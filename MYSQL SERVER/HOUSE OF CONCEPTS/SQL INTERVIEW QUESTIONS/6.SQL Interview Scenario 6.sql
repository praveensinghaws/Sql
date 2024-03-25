--Scenario 6
--Write a query to fetch Employee details order by FullName Ascending and Project Descending.

-- Solution to retrieve data from EmployeeDetails and EmployeeSalary tables and order the results
SELECT 
    A.FullName,
    B.Project,
    * 
FROM 
    EmployeeDetails A WITH (NOLOCK)
INNER JOIN 
    EmployeeSalary B WITH (NOLOCK) ON A.EmpId = B.EmpId 
ORDER BY 
    A.FullName ASC, 
    B.Project DESC;

