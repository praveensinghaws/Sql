-- Numeric Functions: https://dev.mysql.com/doc/refman/8.0/en/non-typed-operators.html
USE MOVIESDB;
-- NUMERIC FUNCTION
-- Query 1: Absolute Value
SELECT abs(-10) AS ABS_VALUE;

-- Query 2: Ceiling Function with a decimal number
SELECT ceil(5.5) AS CEILING_VALUE;

-- Query 3: Ceiling Function with a decimal number
SELECT ceil(10.2) AS CEILING_VALUE;

-- Query: Floor Function with a decimal number
SELECT floor(5.5) AS FLOOR_VALUE;

-- Query 1: Modulus of 15 divided by 3
SELECT mod(15, 3) AS MODULUS_RESULT;

-- Query 2: Modulus of 25 divided by 4
SELECT mod(25, 4) AS MODULUS_RESULT;

-- Query 1: Round Function rounding up with a decimal number
SELECT round(5.5) AS ROUNDUP_VALUE;

-- Query 2: Round Function rounding down with a decimal number
SELECT round(5.4) AS ROUNDDOWN_VALUE;

-- Query 1: Round Function to round the value of pi to 2 decimal places
SELECT round(pi(), 2) AS PI_VALUE;

-- Query 2: Truncate Function to truncate a decimal number to 2 decimal places
SELECT truncate(12345.987979798, 2) AS TRUNCATE_VALUE;

-- Query: Truncate Function to truncate the value of pi to 3 decimal places
SELECT truncate(pi(), 3) AS PI_VALUE;

-- Query 1: Generate a random value between 0 and 1
SELECT rand() AS RAND_VALUE;

-- Query 2: Generate a random integer between 0 and 9 using FLOOR
SELECT FLOOR(rand() * 10) AS RAND_VALUE;

-- Query 3: Generate a random integer between 1 and 10 using CEIL
SELECT CEIL((rand() * 10)) AS RAND_VALUE;

-- Query: Calculate the power of 5 raised to the 3rd exponent
SELECT pow(5, 3) AS POWER_RESULT;

-- Query: Calculate the power of 5 raised to the 4th exponent
SELECT POWER(5, 4) AS POWER_RESULT;

-- Query: Calculate sin, cos, and tan of 0 radians
SELECT sin(0) AS SIN_RESULT, cos(0) AS COS_RESULT, tan(0) AS TAN_RESULT;

-- Query: Calculate truncated sin, cos, and tan values for specific angles
SELECT
    truncate(sin(-30), 2) AS SIN_RESULT,
    truncate(cos(45), 2) AS COS_RESULT,
    truncate(tan(187), 2) AS TAN_RESULT;



















