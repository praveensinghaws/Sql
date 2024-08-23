
-- Acies Global SQL Interview Question | Empoyee Swipe in and out.

-- Drop the existing database and create a new one
DROP DATABASE IF EXISTS ankitdb;
CREATE DATABASE ankitdb;
USE ankitdb;

-- Drop the table if it exists and create a new one
DROP TABLE IF EXISTS swipe;

CREATE TABLE swipe (
    employee_id INT,
    activity_type VARCHAR(10),
    activity_time DATETIME
);

-- Insert sample data
INSERT INTO swipe (employee_id, activity_type, activity_time) VALUES
(1, 'login', '2024-07-23 08:00:00'),
(1, 'logout', '2024-07-23 12:00:00'),
(1, 'login', '2024-07-23 13:00:00'),
(1, 'logout', '2024-07-23 17:00:00'),
(2, 'login', '2024-07-23 09:00:00'),
(2, 'logout', '2024-07-23 11:00:00'),
(2, 'login', '2024-07-23 12:00:00'),
(2, 'logout', '2024-07-23 15:00:00'),
(1, 'login', '2024-07-24 08:30:00'),
(1, 'logout', '2024-07-24 12:30:00'),
(2, 'login', '2024-07-24 09:30:00'),
(2, 'logout', '2024-07-24 10:30:00');

SELECT *
FROM swipe;


Acies global interview question
We have a swipe table which keeps track of the employee login and logout timings.
1.Find out the time employee person spent in office on a particular day(office hours = last logout_time - first login_time)

2.Find out how productive he was at office on a particular day. (He might have done many swipes per day. I need to find actual time spent at office).
*/


SELECT * FROM swipe;

WITH cte AS (
    SELECT *,
           CAST(activity_time AS DATE) AS activity_day,
           LEAD(activity_time, 1) OVER (PARTITION BY employee_id, CAST(activity_time AS DATE) ORDER BY activity_time) AS logout_time
    FROM swipe
) 
SELECT 
    employee_id,
    activity_day,
    TIMESTAMPDIFF(HOUR, MIN(activity_time), MAX(logout_time)) AS total_hours,
    SUM(TIMESTAMPDIFF(HOUR, activity_time, logout_time)) AS inside_hours
FROM cte
WHERE activity_type = 'login'
GROUP BY employee_id, activity_day;