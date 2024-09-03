--  TOPICS NOT CLEAR 
USE DEMODB;

-- Create the 'tickets' table
CREATE TABLE tickets
(
    ticket_id VARCHAR(10),
    create_date DATE,
    resolved_date DATE
);

-- Delete existing data from the 'tickets' table (if any)
DELETE FROM tickets;

-- Insert data into the 'tickets' table
INSERT INTO tickets
VALUES
    ('1', '2022-08-01', '2022-08-03'),
    ('2', '2022-08-01', '2022-08-12'),
    ('3', '2022-08-01', '2022-08-16');

-- Create the 'holidays' table
CREATE TABLE holidays
(
    holiday_date DATE,
    reason VARCHAR(100)
);

-- Delete existing data from the 'holidays' table (if any)
DELETE FROM holidays;

-- Insert data into the 'holidays' table
INSERT INTO holidays
VALUES
    ('2022-08-11', 'Rakhi'),
    ('2022-08-15', 'Independence day');


/*
WRITE A SQL TO FIND BUSINESS DAY BETWEEN CREATE DATE AND RESOLVED DATE BY EXCLUDING WEEKDNS AND PUBLIC HOLIDAYS 
*/

-- Calculate the number of business days between ticket creation and resolution, considering holidays
SELECT *,
    DATEDIFF(DAY, create_date, resolved_date) - 2 * DATEDIFF(WEEK, create_date, resolved_date) - no_of_holidays AS Business_days
FROM (
    -- Subquery to join tickets and holidays, and calculate the count of holidays for each ticket
    SELECT 
        ticket_id, 
        create_date, 
        resolved_date, 
        COUNT(holiday_date) AS no_of_holidays,
        DATEDIFF(DAY, create_date, resolved_date) AS ACTUAL_DAYS
    FROM 
        tickets
    LEFT JOIN 
        holidays ON holiday_date BETWEEN create_date AND resolved_date
    GROUP BY 
        ticket_id, create_date, resolved_date
) x;

----->>>>>>>>>>>>>>.
/*
Great question, solution, and explanation. Thanks for sharing! :)
Don't mean to be a critique but have two suggestions:

1. When counting no. of days between 2 dates we should always add ONE(+1) otherwise we miss a day DATEDIFF(DAY, start_date, end_date) +1.
Also, there might be cases where we don't want to add(+1). So, based on our business needs :)

For example: in the above scenario ('2022-08-01','2022-08-03') --> it should be 3 days and not 2

2. There is a corner case with the above code - this solution would work only when tickets are created on weekdays and not weekends. 
Ideally, as per business case, we should not have a ticket created on weekend but (we all know the kind of data we get is never 100% clean :P)

 Example: Below 2 scenarios will give incorrect results

,(4,'2022-08-19','2022-08-27')
,(5,'2022-08-21','2022-08-27');

I solved this with another approach where the above scenarios are covered.
*/
/*
Certainly! Let's break down your query step by step:

### Step 1: Recursive Common Table Expression (_cte)
```sql
*/
with _cte as (
    select ticket_id, create_date, resolved_date from tickets 
    UNION ALL
    SELECT t.ticket_id, DATEADD(DAY, 1, b.create_date) create_date, T.resolved_date 
    FROM  tickets T
    INNER JOIN _cte b ON b.ticket_id = t.ticket_id
    WHERE b.create_date < T.resolved_date
)
/*
This CTE generates a recursive sequence of dates for each ticket from its creation date to the resolved date. It uses the UNION ALL clause to combine the initial records with the recursively generated ones.

### Step 2: Second Common Table Expression (_CTE2)
```sql
*/
, _CTE2 AS (
    SELECT C.*,
        CASE WHEN DATEPART(WEEKDAY, create_date) IN (1, 7) THEN 1 ELSE 0 END AS BusinessHoliday,
        CASE WHEN H.holiday_date IS NOT NULL THEN 1 ELSE 0 END AS FirmHoliday
    FROM _cte C 
    LEFT JOIN holidays H ON C.create_date = H.holiday_date
)
/*
In this CTE, it adds two additional columns:
- `BusinessHoliday`: Flags whether the created date falls on a weekend (Saturday or Sunday).
- `FirmHoliday`: Flags whether the created date is a holiday based on the holidays table.

### Step 3: Final SELECT
```sql
*/
SELECT 
    ticket_id, 
    MIN(CREATE_DATE) AS MinCreateDate, 
    MAX(CREATE_DATE) AS MaxCreateDate, 
    COUNT(1) AS TotalDays,  
    SUM(BusinessHoliday) AS BusinessHolidays, 
    SUM(FirmHoliday) AS FirmHolidays,
    COUNT(1) - SUM(BusinessHoliday) - SUM(FirmHoliday) AS TotalBusinessDays
FROM _CTE2
GROUP BY ticket_id
ORDER BY ticket_id;
/*
In the final SELECT statement, it calculates various metrics:
- `MinCreateDate` and `MaxCreateDate`: Earliest and latest creation dates for each ticket.
- `TotalDays`: Total number of days for each ticket.
- `BusinessHolidays`: Total number of days created on weekends.
- `FirmHolidays`: Total number of days created on holidays.
- `TotalBusinessDays`: Total number of business days, excluding weekends and holidays.

The result is grouped by `ticket_id`, providing a summary for each ticket. The ORDER BY clause sorts the result by `ticket_id`.
*/

-- ANOTHER WAY TO WRITE SAME 
-- Step 1: Generate Dates for Each Ticket
WITH TicketDays AS (
    SELECT 
        t.ticket_id,
        d.Date AS create_date,
        CASE WHEN DATEPART(WEEKDAY, d.Date) IN (1, 7) THEN 1 ELSE 0 END AS BusinessHoliday,
        CASE WHEN h.holiday_date IS NOT NULL THEN 1 ELSE 0 END AS FirmHoliday
    FROM 
        tickets t
    CROSS APPLY 
        (
            SELECT TOP (DATEDIFF(DAY, t.create_date, t.resolved_date) + 1) 
                DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1, t.create_date) AS Date
            FROM master.dbo.spt_values
        ) d
    LEFT JOIN 
        holidays h ON d.Date = h.holiday_date
)

-- Step 2: Final SELECT
SELECT 
    ticket_id,
    MIN(create_date) AS MinCreateDate,
    MAX(create_date) AS MaxCreateDate,
    DATEDIFF(DAY, MIN(create_date), MAX(create_date)) + 1 AS TotalDays,
    SUM(BusinessHoliday) AS BusinessHolidays,
    SUM(FirmHoliday) AS FirmHolidays,
    COUNT(1) - SUM(BusinessHoliday) - SUM(FirmHoliday) AS TotalBusinessDays
FROM TicketDays
GROUP BY ticket_id
ORDER BY ticket_id;
