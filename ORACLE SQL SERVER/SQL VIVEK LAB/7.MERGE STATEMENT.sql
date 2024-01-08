-- MERGE STATEMENT
--Merge statement is used to select rows from  one or more sources For update or 
--insertion into a table or view.
-- Merge the statement provides a convenient way to combine multiple operations
--It lets you avoid multiple insert, update and delete DML statements 
--FIRST TABLE IS THE TABLE WHERE INSERT UPDATE , DELETE ARE PERFORMED. 
MERGE INTO SALES_HISTORY AS dest
USING SALES AS src
-- condition
ON (



)
WHEN MATCHED THEN
    UPDATE SET target_column1 = source_column1, target_column2 = source_column2, ...
WHEN NOT MATCHED THEN
    INSERT (target_column1, target_column2, ...)
    VALUES (source_column1, source_column2, ...)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
