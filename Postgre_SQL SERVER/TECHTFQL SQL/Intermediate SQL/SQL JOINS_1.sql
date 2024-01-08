-- SELECT * from information_schema.tables  where table_schema = 'public';

-- fetch the epmloyee name and the department name they belong to.
-- INNER JOIN /JOIN 
SELECT emp_name, d.DEPT_NAME 
from employee e    
INNER JOIN department d 
on e.DEPT_ID = d.DEPT_ID
ORDER by 1;

-- fetch ALL the epmloyee name and the department name they belong to.
-- LEFT JOIN 
SELECT emp_name, d.DEPT_NAME 
from employee e    
LEFT JOIN department d 
on e.DEPT_ID = d.DEPT_ID
ORDER by 1;

-- RIGHT JOIN  = [INNER JOIN + ANY ADDITIONAL RECORDS FROM THE RIGHT TABLE]
SELECT emp_name, d.DEPT_NAME 
from employee e    
RIGHT JOIN department d 
on e.DEPT_ID = d.DEPT_ID
ORDER by 1;





