-- WHILE Loop in T-SQL
USE DEMODB;
GO

DECLARE @Counter INT;
SET @Counter = 1;

WHILE @Counter <= 10
BEGIN
    PRINT 'Counter value: ' + CAST(@Counter AS NVARCHAR(10));
    SET @Counter = @Counter + 1;
END

GO
-- ===================================================================
USE DEMODB;
GO

-- Display the initial state of the Employee table
SELECT * FROM Employee;
GO

-- Begin a transaction for the update process
BEGIN TRANSACTION;

BEGIN
    WHILE (SELECT MIN(EmpSalary) FROM Employee) < 80000
    BEGIN 
        UPDATE Employee SET EmpSalary = EmpSalary + 10000 ;
        PRINT 'SALARY UPDATED';

        -- Check if the minimum salary is greater than or equal to 80000
        IF (SELECT MIN(EmpSalary) FROM Employee) >= 80000
        BEGIN
            PRINT 'MIN SALARY IS GREATER THAN OR EQUAL TO 80000';
            BREAK;  -- Break out of the WHILE loop
        END
    END
END

-- Commit the transaction
COMMIT TRANSACTION;

-- Display the updated state of the Employee table
SELECT * FROM Employee;
GO
