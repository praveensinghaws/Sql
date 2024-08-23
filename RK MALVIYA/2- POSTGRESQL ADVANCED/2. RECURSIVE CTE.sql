--************************************
--1ST EXAMPLE FOR IT DEPARTMENT :
--************************************

-- Create a recursive Common Table Expression (CTE) to retrieve organizational hierarchy within the 'IT' department
WITH RECURSIVE CTE_ORG_IT AS (
    -- Select initial employees who are managers (root nodes)
    SELECT
        EMP_ID,
        EMP_FIRST_NAME,
        MANAGER_ID
    FROM
        demo_test.emp
    WHERE
        DEPT = 'IT' AND
        MANAGER_ID IS NULL -- Select employees with no manager (top-level managers)
    UNION ALL
    -- Recursive part: Join employees with their respective managers
    SELECT
        e.EMP_ID,
        e.EMP_FIRST_NAME,
        e.MANAGER_ID
    FROM
        demo_test.emp e
    INNER JOIN
        CTE_ORG_IT o ON o.EMP_ID = e.manager_id -- Join with the previous level in the hierarchy
)
-- Select and display the organizational hierarchy
SELECT * FROM CTE_ORG_IT;

--************************************
--2ND EXAMPLEV FOR HR DEPARTMENT :
--************************************

-- Create a recursive Common Table Expression (CTE) to retrieve organizational hierarchy within the 'IT' department
WITH RECURSIVE CTE_ORG_HR AS (
    -- Select initial employees who are managers (root nodes)
    SELECT
        EMP_ID,
        EMP_FIRST_NAME,
        MANAGER_ID
    FROM
        demo_test.emp
    WHERE
        DEPT = 'HR' AND
        MANAGER_ID IS NULL -- Select employees with no manager (top-level managers)
    UNION ALL
    -- Recursive part: Join employees with their respective managers
    SELECT
        e.EMP_ID,
        e.EMP_FIRST_NAME,
        e.MANAGER_ID
    FROM
        demo_test.emp e
    INNER JOIN
        CTE_ORG_HR o ON o.EMP_ID = e.manager_id -- Join with the previous level in the hierarchy
)
-- Select and display the organizational hierarchy
SELECT * FROM CTE_ORG_HR;
