-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Difference Between count(*) ,count(0),count(-1),count(col),count('youtube')

-- Certainly! Let's clarify the differences between the `COUNT` queries:

-- Select all records from the EMP table
SELECT * FROM EMP;

-- Count the total number of records in the EMP table (COUNT: 12)
SELECT COUNT(*) FROM EMP;

-- Count the total number of records in the EMP table (COUNT: 12)
SELECT COUNT(1) FROM EMP;

-- Count the total number of records in the EMP table (COUNT: 12)
SELECT COUNT(0) FROM EMP;

-- Count the total number of records in the EMP table (COUNT: 12)
SELECT COUNT(-1) FROM EMP;

-- Count the total number of records in the EMP table (COUNT: 12)
SELECT COUNT('PRAVEEN') FROM EMP;

-- Count the number of non-null DEP_NAME values in the EMP table (COUNT: 11)
SELECT COUNT(DEP_NAME) FROM EMP;
/*

1. The first query simply selects all records from the `EMP` table, showing the data.

2. The second query (`COUNT(*)`) counts the total number of records in the `EMP` table. The `*` in `COUNT(*)` means counting all rows, so it gives the total count of records in the table (12).

3. The third query (`COUNT(1)`) also counts the total number of records. Using `COUNT(1)` is a common practice, and it also gives the total count of records (12).

4. The fourth query (`COUNT(0)`) counts the total number of records, similar to the previous queries. The argument inside `COUNT` doesn't affect the count, so it also gives the total count of records (12).

5. The fifth query (`COUNT(-1)`) behaves the same as the previous queries, counting the total number of records (12). The argument inside `COUNT` doesn't impact the result.

6. The sixth query (`COUNT('PRAVEEN')`) is interesting. It counts the number of occurrences of the literal string 'PRAVEEN' in the entire result set. However, since 'PRAVEEN' is not present in any column, it still counts all records and returns 12.

7. The seventh query (`COUNT(DEP_NAME)`) counts the number of non-null values in the `DEP_NAME` column. This query gives a count of 11 because one record in the table has a `NULL` value in the `DEP_NAME` column.
*/