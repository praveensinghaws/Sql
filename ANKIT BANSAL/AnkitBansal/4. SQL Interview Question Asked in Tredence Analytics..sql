-- SQL Interview Question Asked in Tredence Analytics.

-- Drop the existing database and create a new one
DROP DATABASE IF EXISTS ankitdb;
CREATE DATABASE ankitdb;
USE ankitdb;

CREATE TABLE cinema (
    seat_id INT PRIMARY KEY,
    free int
);
delete from cinema;
INSERT INTO cinema (seat_id, free) VALUES (1, 1);
INSERT INTO cinema (seat_id, free) VALUES (2, 0);
INSERT INTO cinema (seat_id, free) VALUES (3, 1);
INSERT INTO cinema (seat_id, free) VALUES (4, 1);
INSERT INTO cinema (seat_id, free) VALUES (5, 1);
INSERT INTO cinema (seat_id, free) VALUES (6, 0);
INSERT INTO cinema (seat_id, free) VALUES (7, 1);
INSERT INTO cinema (seat_id, free) VALUES (8, 1);
INSERT INTO cinema (seat_id, free) VALUES (9, 0);
INSERT INTO cinema (seat_id, free) VALUES (10, 1);
INSERT INTO cinema (seat_id, free) VALUES (11, 0);
INSERT INTO cinema (seat_id, free) VALUES (12, 1);
INSERT INTO cinema (seat_id, free) VALUES (13, 0);
INSERT INTO cinema (seat_id, free) VALUES (14, 1);
INSERT INTO cinema (seat_id, free) VALUES (15, 1);
INSERT INTO cinema (seat_id, free) VALUES (16, 0);
INSERT INTO cinema (seat_id, free) VALUES (17, 1);
INSERT INTO cinema (seat_id, free) VALUES (18, 1);
INSERT INTO cinema (seat_id, free) VALUES (19, 1);
INSERT INTO cinema (seat_id, free) VALUES (20, 1);

/*
Several friends at a cinema ticket office would like to reserve consecutive available seats.
can you help to query all the consecutive available seats order by the seat_id using the following cinema tables?
Note:
The seat_id is an auto_increment int, and free is boolean ('1' means free and '0' means occupied.). consecutive available seats are more than 2(inclusive) seats consecutively available.
*/

/*
-- METHOD 1
*/
WITH cte AS 
(
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY seat_id) AS rn,
           seat_id - ROW_NUMBER() OVER (ORDER BY seat_id) AS grp
    FROM cinema
    WHERE free = 1
) 
SELECT seat_id AS consecutive_available_seats
FROM 
(
    SELECT *,
           COUNT(*) OVER (PARTITION BY grp) AS cnt
    FROM cte
) x 
WHERE cnt > 1
ORDER BY consecutive_available_seats;

-- METHOD 2
WITH cte AS 
(
    SELECT c1.seat_id AS s1, c2.seat_id AS s2
    FROM cinema c1
    INNER JOIN cinema c2 
    ON c1.seat_id + 1 = c2.seat_id
    WHERE c1.free = 1 AND c2.free = 1
)
SELECT s1 AS consecutive_available_seats 
FROM cte
UNION 
SELECT s2 AS consecutive_available_seats 
FROM cte
ORDER BY consecutive_available_seats;

-- METHOD 3
SELECT seat_id AS consecutive_available_seats 
FROM
(
    SELECT *,
           LAG(free, 1) OVER (ORDER BY seat_id) AS prev_free,
           LEAD(free, 1) OVER (ORDER BY seat_id) AS next_free
    FROM cinema
) x
WHERE free = 1 AND (prev_free = 1 OR next_free = 1);









































