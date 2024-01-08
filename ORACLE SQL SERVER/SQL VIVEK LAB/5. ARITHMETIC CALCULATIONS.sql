-- Arithmetic expressions on null values. 
--Any arithmetic expressions which Evolves a NULL value  Returns null value as the output. 

-- Performing arithmetic operations with NULL values
SELECT 10 + NULL FROM DUAL;    -- Result: NULL
SELECT 10 - NULL FROM DUAL;    -- Result: NULL
SELECT 10 * NULL FROM DUAL;    -- Result: NULL
SELECT 10 / NULL FROM DUAL;    -- Result: NULL

-- Avoiding NULLs when calculating average and count from the "SALES" table
-- DON'T: This query includes NULL values in calculations
SELECT AVG(TAX_AMOUNT) FROM SALES;
SELECT COUNT(TAX_AMOUNT) FROM SALES;

-- DO: This query uses NVL function to replace NULL with 0 before calculations
SELECT AVG(NVL(TAX_AMOUNT, 0)) FROM SALES;
SELECT COUNT(NVL(TAX_AMOUNT, 0)) FROM SALES;

