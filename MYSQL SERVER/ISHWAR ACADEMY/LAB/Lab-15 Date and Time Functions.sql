-- Date and Time Functions: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html

-- Query: Retrieve the current date using different functions
SELECT CURDATE() AS curdate_result, CURRENT_DATE() AS current_date_result, CURRENT_DATE AS current_date_result;

-- Query: Retrieve the current time using different functions
SELECT CURTIME() AS curtime_result, CURRENT_TIME() AS current_time_result, CURRENT_TIME AS current_time_result;

-- Query: Retrieve the current date and time using the NOW() function
SELECT NOW() AS current_datetime;


-- Selects the current date using the CURDATE() function
SELECT CURDATE() AS 'Current Date',

-- Adds 10 days to the current date using the ADDDATE() function
ADDDATE(CURDATE(), 10) AS 'Date 10 Days Later';

-- Selects the current time using the CURTIME() function
SELECT CURTIME() AS 'Current Time',

-- Adds 1 hour and 30 minutes to the current time using the ADDTIME() function
ADDTIME(CURTIME(), '01:30:00') AS 'Time 1 Hour 30 Minutes Later'; -- HH:mm:ss

-- Selects the current date using the CURDATE() function
SELECT CURDATE() AS 'Current Date',

-- Retrieves the month name of the current date using the MONTHNAME() function
MONTHNAME(CURDATE()) AS 'Month Name';

-- Selects the current date and time using the NOW() function
SELECT NOW() AS 'Current Date and Time',

-- Formats the current date and time in the specified format using the DATE_FORMAT() function
DATE_FORMAT(NOW(), '%D-%M-%Y') AS 'Formatted Date';

-- Converts the input date string '1990-08-11' to a proper date format
SELECT STR_TO_DATE('1990-08-11', '%Y-%m-%d') AS 'Converted Date';

-- Calculates the difference in days between two dates using the DATEDIFF() function
SELECT DATEDIFF('2023-12-31', '2023-01-31') AS 'Date Difference';

-- Calculates the difference in days between the specified date and the current date using the DATEDIFF() function
SELECT DATEDIFF('2023-12-31', CURDATE()) AS 'Date Difference';





