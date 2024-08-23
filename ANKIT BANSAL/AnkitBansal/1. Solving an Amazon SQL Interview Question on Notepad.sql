-- 1. Solving an Amazon SQL Interview Question on Notepad

-- Drop the existing database and create a new one
DROP DATABASE IF EXISTS ankitdb;
CREATE DATABASE ankitdb;
USE ankitdb;

-- Drop the table if it exists and create a new one
DROP TABLE IF EXISTS subscription_history;

CREATE TABLE subscription_history (
    customer_id INT,
    marketplace VARCHAR(10),
    event_date DATE,
    event CHAR(1),
    subscription_period INT
);

-- Insert data into the subscription_history table
INSERT INTO subscription_history VALUES (1, 'India', '2020-01-05', 'S', 6);
INSERT INTO subscription_history VALUES (1, 'India', '2020-12-05', 'R', 1);
INSERT INTO subscription_history VALUES (1, 'India', '2021-02-05', 'C', NULL);
INSERT INTO subscription_history VALUES (2, 'India', '2020-02-15', 'S', 12);
INSERT INTO subscription_history VALUES (2, 'India', '2020-11-20', 'C', NULL);
INSERT INTO subscription_history VALUES (3, 'USA', '2019-12-01', 'S', 12);
INSERT INTO subscription_history VALUES (3, 'USA', '2020-12-01', 'R', 12);
INSERT INTO subscription_history VALUES (4, 'USA', '2020-01-10', 'S', 6);
INSERT INTO subscription_history VALUES (4, 'USA', '2020-09-10', 'R', 3);
INSERT INTO subscription_history VALUES (4, 'USA', '2020-12-25', 'C', NULL);
INSERT INTO subscription_history VALUES (5, 'UK', '2020-06-20', 'S', 12);
INSERT INTO subscription_history VALUES (5, 'UK', '2020-11-20', 'C', NULL);
INSERT INTO subscription_history VALUES (6, 'UK', '2020-07-05', 'S', 6);
INSERT INTO subscription_history VALUES (6, 'UK', '2021-03-05', 'R', 6);
INSERT INTO subscription_history VALUES (7, 'Canada', '2020-08-15', 'S', 12);
INSERT INTO subscription_history VALUES (8, 'Canada', '2020-09-10', 'S', 12);
INSERT INTO subscription_history VALUES (8, 'Canada', '2020-12-10', 'C', NULL);
INSERT INTO subscription_history VALUES (9, 'Canada', '2020-11-10', 'S', 1);

-- Query All Data
SELECT * 
FROM subscription_history;

-- Query to find the most recent valid subscriptions as of 2020-12-31
WITH CTE AS 
(
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY event_date DESC) AS rn 
    FROM subscription_history
    WHERE event_date <= '2020-12-31'
)
SELECT *,
       DATE_ADD(event_date, INTERVAL subscription_period MONTH) AS valid_till
FROM CTE
WHERE rn = 1
  AND event != 'C'
  AND DATE_ADD(event_date, INTERVAL subscription_period MONTH) >= '2020-12-31';