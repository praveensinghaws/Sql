USE MoviesDB;
SELECT * FROM INFORMATION_SCHEMA.TABLES ;
-- How to do Pattern Matching in SQL using Wild Card Characters | Like Operator in SQL

-- Select movies with titles starting with 'I' and ending with 'R'
SELECT * FROM movies 
WHERE TITLE LIKE 'I%R'

-- Select movies with 'LOVE' anywhere in the title
SELECT * FROM movies 
WHERE TITLE LIKE '%LOVE%'


-- Select movies with titles having three characters, where the second character is 'N'
SELECT * FROM movies 
WHERE TITLE LIKE '__N%'

-- Select movies with titles having exactly three characters
SELECT * FROM movies 
WHERE TITLE LIKE '___'

-- Select movies with titles starting with 'A', followed by either 'v' or 'c'
SELECT * FROM movies 
WHERE TITLE LIKE 'A[vc]%'

-- Select movies with titles having a single character, followed by either 'c' or 'a'
SELECT * FROM movies 
WHERE TITLE LIKE '_[ca]%'

-- Select movies with titles having a single character, not followed by 'c' or 'a'
SELECT * FROM movies 
WHERE TITLE LIKE '_[^ca]%'

-- Select movies with titles having a single character, followed by a character in the range 'i' to 'k'
SELECT * FROM movies 
WHERE TITLE LIKE '_[i-k]%'

-- Note: The opposite can be achieved using the NOT LIKE operator
