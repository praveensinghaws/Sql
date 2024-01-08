-- Section 1: Basic BEGIN...END block in T-SQL

USE DEMODB;
GO
-- Select all records from the employee table
SELECT * FROM employee;
GO
-- BEGIN...END block for selecting employee information based on department ID
BEGIN 
    -- Declare variables
    DECLARE @name VARCHAR(50), @salary INTEGER, @DeptID VARCHAR(10) = 'D3';

    -- Select employee information based on department ID
    SELECT @name = EmpName, @salary = EmpSalary
    FROM employee
    WHERE EmpDeptID = @DeptID;

    -- Display selected employee information
    SELECT @name AS 'EmployeeName', @salary AS 'EmployeeSalary';
END
GO


-- Section 2: Example of Nesting BEGIN...END
USE DEMODB;
GO
-- Select all records from the Employee table
SELECT * FROM Employee;
GO
-- Main block with nested block
BEGIN 
    -- Variable declarations
    DECLARE @name VARCHAR(50), @salary INTEGER, @DeptID VARCHAR(10) = 'D3';

    -- Selecting the employee name and salary based on the department ID
    SELECT @name = EmpName, @salary = EmpSalary FROM employee      
    WHERE EmpDeptID = @DeptID;

    -- Displaying the selected employee name and salary
    SELECT @name AS 'EmployeeName', @salary AS 'EmployeeSalary';

    -- Nested block
    BEGIN 
        -- Printing the department ID
        PRINT 'Department ID: ' + @DeptID;
    END
END



-- Section 3:  Example using another database (MOVIESDB)
USE MOVIESDB;

-- Select all records from the MOVIES table
SELECT * FROM MOVIES;

-- Declare variables for movie information
BEGIN
    DECLARE @movie_name VARCHAR(50), @studio VARCHAR(50), 
            @imdb_rating DECIMAL(3, 1) = 5.0;

    -- Select movie information based on IMDb rating criteria
    SELECT @movie_name = title, @studio = studio
    FROM movies
    WHERE imdb_rating < @imdb_rating;

    -- Display selected movie information
    SELECT @movie_name AS 'MOVIE_TITLE', @studio AS 'MOVIE_STUDIO';
END



-- Section 4:  Example of using IF statement with PRINT
DECLARE @Value INT = 7;

IF @Value > 5
BEGIN
    PRINT 'Value is greater than 5.';
END;
