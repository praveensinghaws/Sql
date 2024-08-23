/*           *****   DATE & TIME FUNCTIONS   *****

1. GETDATE() , getDate(), current_timestamp , sysdatetime()
2. datename() 
3. datediff()
4. dateadd()

*/


-- Retrieving the current date and time using the GETDATE() function with alias 'CurrentDateTime'
SELECT GETDATE() AS CurrentDateTime;

-- Retrieving the current date and time using the SYSDATETIME() function with alias 'SystemDateTime'
SELECT SYSDATETIME() AS SystemDateTime;

-- Retrieving the current date and time using the CURRENT_TIMESTAMP function with alias 'Timestamp'
SELECT CURRENT_TIMESTAMP AS Timestamp;


/*
All three functions, `GETDATE()`, `SYSDATETIME()`, and `CURRENT_TIMESTAMP`, are used to retrieve the current date and time in SQL Server, but they have some differences:

1. **GETDATE():**
   - `GETDATE()` returns the current date and time with a fractional seconds part, but its precision is limited to milliseconds.
   - It is compatible with older versions of SQL Server.

2. **SYSDATETIME():**
   - `SYSDATETIME()` returns the current date and time with a higher precision than `GETDATE()`. It includes fractional seconds with precision up to microseconds.
   - It is more accurate for time-sensitive operations that require higher precision.

3. **CURRENT_TIMESTAMP:**
   - `CURRENT_TIMESTAMP` is an ANSI SQL standard function that returns the current date and time with fractional seconds precision. It is equivalent to `SYSDATETIME()` in SQL Server.
   - It's more portable across different database systems as it adheres to the ANSI SQL standard.

In summary, the choice between these functions depends on the required precision and the SQL Server version you are using. If you need higher precision, `SYSDATETIME()` or `CURRENT_TIMESTAMP` is preferable, but if millisecond precision is sufficient and you want compatibility with older systems, `GETDATE()` can be used.
*/
-- *********** DATENAME()

-- Retrieving the current month name using DATENAME function with alias 'CurrentMonthName'
SELECT DATENAME(MONTH, CURRENT_TIMESTAMP) AS CurrentMonthName;

-- Retrieving the current year using DATENAME function with alias 'CurrentYear'
SELECT DATENAME(YEAR, CURRENT_TIMESTAMP) AS CurrentYear;


-- Retrieving the current hour using DATENAME function with alias 'CurrentHour'
SELECT DATENAME(HOUR, CURRENT_TIMESTAMP) AS CurrentHour;

-- ******************** DATEDIFF()

-- Calculating the age in years based on the difference between 'AUGUST 11 1990' and the current timestamp
SELECT DATEDIFF(YEAR, 'AUGUST 11 1990', CURRENT_TIMESTAMP) AS YearsSinceBirth;

-- Calculating the difference in months between 'AUGUST 11 1990' and the current timestamp
SELECT DATEDIFF(MONTH, 'AUGUST 11 1990', CURRENT_TIMESTAMP) AS MonthsSinceBirth;

-- Calculating the difference in days between 'AUGUST 11 1990' and the current timestamp
SELECT DATEDIFF(DAY, 'AUGUST 11 1990', CURRENT_TIMESTAMP) AS DaysSinceBirth;


-- Calculating the difference in years between 'AUGUST 11 1990' and 'JANUARY 1 2020'
SELECT DATEDIFF(YEAR, 'AUGUST 11 1990', 'JANUARY 1 2020') AS YearsSinceBirth;


-- ******************** DATEADD()

-- Adding 20 years to the current timestamp
SELECT DATEADD(YEAR, 20, CURRENT_TIMESTAMP) AS FutureDate;

-- Adding 24 months to the current timestamp
SELECT DATEADD(MONTH, 24, CURRENT_TIMESTAMP) AS FutureDate1;

-- Subtracting 20 years from the current timestamp
SELECT DATEADD(YEAR, -20, CURRENT_TIMESTAMP) AS PastDate;

-- Subtracting 60 months from the current timestamp
SELECT DATEADD(MONTH, -60, CURRENT_TIMESTAMP) AS PastDate1;
