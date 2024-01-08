-- String Functions: https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

-- Query: Retrieve and manipulate title information from the movies table
SELECT 
    title,
    length(title) AS Title_length,
    lower(title) AS Lowercase_title,
    lcase(title) AS Lowercase_title_alias,
    upper(title) AS Uppercase_title,
    ucase(title) AS Uppercase_title_alias
FROM 
    movies limit 5;
    
    
-- Query: Concatenate title, industry and studio columns with a space in between from the movies table
SELECT CONCAT(title, ' ', industry, ' ', studio) AS Concatenated_Result
FROM movies;

-- Query: Concatenate title, "'s", 'rating is :', and imdb_rating columns from the movies table
SELECT CONCAT(title, '\'s', ' ', 'rating is : ', imdb_rating) AS Concatenated_Result
FROM movies;

-- Query: Reverse the characters in the industry column from the movies table
SELECT REVERSE(industry) AS Reversed_Industry
FROM movies;

-- Query: Compare titles and display only when the result is 0 (equal)
-- {Comparison_Result = 0 (Strings are equal):}

SELECT title
FROM movies
WHERE STRCMP(title, 'Avatar') = 0;

-- Query: Compare titles and display only when the result is -1 (smaller)
-- {Comparison_Result = -1 (First string is smaller):}

SELECT title
FROM movies
WHERE STRCMP(title, 'Avatar') = -1;

-- Query: Compare titles and display only when the result is 1 (larger)
-- { Comparison_Result = 1 (First string is larger):}
SELECT title
FROM movies
WHERE STRCMP(title, 'Avatar') = 1;

-- Query: Select industry and the first 5 characters of the industry from the movies table
SELECT industry, SUBSTR(industry, 1, 5) AS Substring_Industry
FROM movies;

-- Query: Replace 'v' with 'b' in the string 'praveen'
SELECT REPLACE('praveen', 'v', 'b') AS Replaced_String;

-- Query: Concatenate 'Miss ' with empname for specific emp_id values
SELECT CONCAT('Miss ', empname) AS Salutation
FROM employee
WHERE emp_id IN ('emp004', 'emp007', 'emp009', 'emp011', 'emp013');

-- Query: Concatenate 'Mr. ' with empname for emp_id values not in the specified list
SELECT CONCAT('Mr. ', empname) AS Salutation
FROM employee
WHERE emp_id NOT IN ('emp004', 'emp007', 'emp009', 'emp011', 'emp013');

select * from employee;

-- Query: Update salutation in the employee table for specific emp_id values
UPDATE employee
SET empname = CONCAT('Miss ', empname)
WHERE emp_id IN ('emp004', 'emp007', 'emp009', 'emp011', 'emp013');

-- Query: Update salutation in the employee table for emp_id values not in the specified list
UPDATE employee
SET empname = CONCAT('Mr. ', empname)
WHERE emp_id NOT IN ('emp004', 'emp007', 'emp009', 'emp011', 'emp013');














