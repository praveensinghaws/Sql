--MULTI TABLE INSERT's
--The American inside odd statement is used to add multiple rows with a single
--insert statement The rows can be inserted into one table or multiple tables
--using only one sql command.

--INSERTING INTO ONE TABLE:
-- Insert multiple records into the "customer1" table using the INSERT ALL statement
INSERT ALL
    INTO customer1 (customer_id, customer_name) VALUES (1, 'SBI')
    INTO customer1 (customer_id, customer_name) VALUES (2, 'UCO')
    INTO customer1 (customer_id, customer_name) VALUES (3, 'UBI')
SELECT * FROM DUAL;
--In this statement: We are inserting multiple records into the "customer1" table 
--in a single query using the INSERT ALL statement.Each INTO clause specifies the 
--values to be inserted for the "customer_id" and "customer_name" columns.The 
--SELECT * FROM DUAL; statement at the end is used as a placeholder because 
--INSERT ALL requires a SELECT statement, but it doesn't affect the actual data
--being inserted.The comments provide an explanation of the purpose of the statement.
--------------------------------------------------------------------------------
SELECT * FROM CUSTOMER1
-- Insert multiple records into the "customer1" and "SALES1" tables using the INSERT ALL statement
INSERT ALL
    INTO customer1 (customer_id, customer_name) VALUES (6, 'HDFC')
    INTO customer1 (customer_id, customer_name) VALUES (7, 'AXIS')
    INTO SALES1 (SALES_DATE, ORDER_ID, TOTAL_AMOUNT) VALUES ('12-JAN-2022', 345, 900)
    INTO SALES1 (SALES_DATE, ORDER_ID, TOTAL_AMOUNT) VALUES ('12-JAN-2022', 445, 1800)
SELECT * FROM DUAL;

COMMIT;
