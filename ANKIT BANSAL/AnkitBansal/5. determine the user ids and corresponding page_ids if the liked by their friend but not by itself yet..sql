
-- determine the user ids and corresponding page_ids if the liked by their friend but not by itself yet.


-- Drop the existing database and create a new one
DROP DATABASE IF EXISTS ankitdb;
CREATE DATABASE ankitdb;
USE ankitdb;


CREATE TABLE friends (
    user_id INT,
    friend_id INT
);

-- Insert data into friends table
INSERT INTO friends VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(3, 4),
(4, 1),
(4, 3);

-- Create likes table
CREATE TABLE likes (
    user_id INT,
    page_id CHAR(1)
);

-- Insert data into likes table
INSERT INTO likes VALUES
(1, 'A'),
(1, 'B'),
(1, 'C'),
(2, 'A'),
(3, 'B'),
(3, 'C'),
(4, 'B');


-- determine the user ids and corresponding page_ids if the liked by their friend but not by itself yet.

-- SOLUTION 1 :

WITH user_pages AS
(
    SELECT DISTINCT f.user_id, l.page_id
    FROM friends f
    INNER JOIN likes l ON f.user_id = l.user_id
),
friends_pages AS
(
    SELECT DISTINCT f.user_id, f.friend_id, l.page_id
    FROM friends f
    INNER JOIN likes l ON f.friend_id = l.user_id
)
SELECT DISTINCT fp.user_id, fp.page_id
FROM friends_pages fp
LEFT JOIN user_pages up 
ON fp.user_id = up.user_id 
AND fp.page_id = up.page_id
WHERE up.user_id IS NULL
ORDER BY fp.user_id;


-- SOLUTION 2 :

SELECT DISTINCT f.user_id, fp.page_id
FROM friends f
INNER JOIN likes fp ON f.friend_id = fp.user_id
LEFT JOIN likes up 
ON f.user_id = up.user_id 
AND fp.page_id = up.page_id
WHERE up.page_id IS NULL
ORDER BY f.user_id;


-- SOLUTION 3 :

SELECT DISTINCT f.user_id, fp.page_id
FROM friends f
INNER JOIN likes fp ON f.friend_id = fp.user_id
WHERE CONCAT(f.user_id, fp.page_id) NOT IN 
(
    SELECT DISTINCT CONCAT(f.user_id, l.page_id)
    FROM friends f
    INNER JOIN likes l ON f.user_id = l.user_id
);
