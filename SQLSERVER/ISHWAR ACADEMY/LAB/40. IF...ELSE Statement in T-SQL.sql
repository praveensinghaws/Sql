--  IF...ELSE Statement in T-SQL

-- Section 1:

-- Use the DEMODB database
USE DEMODB;
GO

-- Begin block to calculate average salary and check conditions
BEGIN 
    -- Declare variable for average salary
    DECLARE @salary DECIMAL;

    -- Calculate the average salary of employees
    SELECT @salary = AVG(EmpSalary) FROM employee;

    -- Display the average salary
    SELECT @salary as 'Avg Salary';

    -- Check if the average salary is greater than 25000
    IF @salary > 25000
    BEGIN	
        -- Print a message if the average salary is greater than 25000
        PRINT 'Avg salary is greater than 25000';
    END
-- End of the block
END
GO


-- Section 2:

-- Use the DEMODB database
USE DEMODB;
GO

-- Begin block to calculate average salary and check conditions
BEGIN 
    -- Declare variable for average salary
    DECLARE @salary DECIMAL;

    -- Calculate the average salary of employees
    SELECT @salary = AVG(EmpSalary) FROM employee;

    -- Display the average salary
    SELECT @salary as 'Avg Salary';

    -- Check if the average salary is greater than 80000
    IF @salary > 80000
    BEGIN	
        -- Print a message if the average salary is greater than 80000
        PRINT 'Avg salary is greater than 80000';
    END
-- End of the block
END
GO


-- Section 3:

-- Use the DEMODB database
USE DEMODB;
GO

-- Begin block to calculate average salary and check conditions
BEGIN 
    -- Declare variable for average salary
    DECLARE @salary DECIMAL;

    -- Calculate the average salary of employees
    SELECT @salary = AVG(EmpSalary) FROM employee;

    -- Display the average salary
    SELECT @salary as 'Avg Salary';

    -- Check if the average salary is greater than 25000
    IF @salary > 25000
    BEGIN	
        -- Print a message if the average salary is greater than 25000
        PRINT 'Avg salary is greater than 25000';
    END
    ELSE 
    BEGIN
        -- Print a message if the average salary is less than or equal to 25000
        PRINT 'Avg salary is less than or equal to 25000';
    END
-- End of the block
END
GO


--  Section 4:

-- Use the DEMODB database
USE DEMODB;
GO

-- Begin block to calculate average salary and check conditions
BEGIN 
    -- Declare variable for average salary
    DECLARE @salary DECIMAL;

    -- Calculate the average salary of employees
    SELECT @salary = AVG(EmpSalary) FROM employee;

    -- Display the average salary
    SELECT @salary as 'Avg Salary';

    -- Check if the average salary is greater than 85000
    IF @salary > 85000
    BEGIN	
        -- Print a message if the average salary is greater than 85000
        PRINT 'Avg salary is greater than 85000';
    END
    ELSE 
    BEGIN
        -- Print a message if the average salary is less than or equal to 85000
        PRINT 'Avg salary is less than or equal to 85000';
    END
-- End of the block
END
GO

