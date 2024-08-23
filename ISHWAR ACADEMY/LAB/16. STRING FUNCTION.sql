DROP FUNCTION IF EXISTS TitleCase;
DROP FUNCTION IF EXISTS ProperCase;

/*
CREATE FUNCTION TitleCase(@inputString NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Result NVARCHAR(MAX);
    SET @Result = '';
    DECLARE @Index INT;
    SET @Index = 1;

    WHILE @Index <= LEN(@inputString)
    BEGIN
        SET @Result = @Result + 
            CASE 
                WHEN @Index = 1 OR SUBSTRING(@inputString, @Index - 1, 1) = ' ' THEN UPPER(SUBSTRING(@inputString, @Index, 1))
                ELSE LOWER(SUBSTRING(@inputString, @Index, 1))
            END;

        SET @Index = @Index + 1;
    END;

    RETURN @Result;
END;


*/

--********************************************************************************************************

-- Select EMPNAME, calculate the length of each name, and convert each name to title case
SELECT 
    EMPNAME, -- Original employee name
    LEN(EMPNAME) AS lengthOfEmpName, -- Calculate the length of each employee name
    UPPER(EMPNAME) AS upperEmpName, -- Convert each employee name to uppercase
    LOWER(EMPNAME) AS lowerEmpName, -- Convert each employee name to lowercase
    dbo.TitleCase(EMPNAME) AS titleCaseEmpName -- Convert each employee name to title case
FROM 
    EMPLOYEE_INFO;

-- This query trims leading spaces from 'ANYSTRING' and trailing spaces from 'ANY STRING'
SELECT LTRIM('                ANYSTRING') AS LeftTrimmed, RTRIM('ANY STRING                ') AS RightTrimmed;

-- This query extracts a substring from 'MICROSOFT', starting from the 6th character and including the next 9 characters
SELECT SUBSTRING('MICROSOFT', 6, 9) AS SubstringResult;

-- This query replaces 'PRAVEEN' with 'SONU' in the string 'PRAVEEN SINGH'
SELECT REPLACE('PRAVEEN SINGH' , 'PRAVEEN' , 'SONU') AS ReplacedString;

-- This query replicates the string 'DUMMY' five times without spaces and with spaces
SELECT REPLICATE('DUMMY', 5) AS WithoutSpace, REPLICATE('DUMMY ', 5) AS WithSpace;
