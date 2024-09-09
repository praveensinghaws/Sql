/*
--Write a Query to provide the date for nth occurrence of Sunday in future from given date
datepart
sunday-1
monday-2
friday-6
saturday-7
*/

/*
To find the date of the nth occurrence of Sunday from a given date, you can use the following approach:

1. Calculate how many days to add from the given date to reach the next Sunday.
2. Add the required number of weeks (n-1) after finding the first occurrence of Sunday.

Here's the complete query:
*/

DECLARE @today_date DATE;
DECLARE @n INT;

-- Initialize variables
SET @today_date = '2024-09-08'; -- Saturday
SET @n = 3; -- Looking for the 3rd Sunday from the given date

-- Calculate the date of the nth occurrence of Sunday
SELECT DATEADD(DAY, 
              (7 - DATEPART(WEEKDAY, @today_date) + 1) % 7 + 7 * (@n - 1), 
              @today_date) AS nth_sunday;

/*
### Explanation:
- **`DATEPART(WEEKDAY, @today_date)`**: Finds the weekday number of the given date (`@today_date`).
- **`(7 - DATEPART(WEEKDAY, @today_date) + 1) % 7`**: Calculates the number of days to add to reach the next Sunday. The `% 7` ensures the calculation handles dates already on a Sunday correctly (returns 0 days to add).
- **`7 * (@n - 1)`**: Adds the required number of weeks (multiplied by 7 days) to find the nth Sunday after the first occurrence.

This query will return the date of the 3rd occurrence of Sunday from the given date (`2022-01-02`). Adjust the variables to find other occurrences as needed!
*/