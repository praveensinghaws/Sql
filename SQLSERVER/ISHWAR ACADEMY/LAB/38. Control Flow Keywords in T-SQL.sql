-- Control Flow Keywords in T-SQL

/*
Certainly! In Transact-SQL (T-SQL), control flow is managed using various keywords and constructs. Here are some of the key control flow keywords in T-SQL along with examples:

1. **IF...ELSE:**
   - The `IF` statement is used to conditionally execute a block of statements.

   ```sql */

   DECLARE @Number INT = 10;

   IF @Number > 0
   BEGIN
       PRINT 'Number is positive.';
   END
   ELSE
   BEGIN
       PRINT 'Number is non-positive.';
   END
  
  /*```

2. **WHILE:**
   - The `WHILE` statement is used to repeatedly execute a block of statements as long as a condition is true.

   ```sql */

   DECLARE @Counter INT = 1;

   WHILE @Counter <= 5
   BEGIN
       PRINT 'Counter: ' + CAST(@Counter AS VARCHAR(10));
       SET @Counter = @Counter + 1;
   END
   
   /*```

3. **BEGIN...END:**
   - `BEGIN` and `END` are used to define a block of statements. They are often used in conjunction with control flow statements.

   ```sql */

   DECLARE @Value INT = 7;

   IF @Value > 5
   BEGIN
       PRINT 'Value is greater than 5.';
   END
   
   /*```

4. **CASE:**
   - The `CASE` statement is used for conditional logic similar to a switch statement in other programming languages.

   ```sql */

   DECLARE @Grade CHAR(1) = 'B';

   SELECT
       CASE @Grade
           WHEN 'A' THEN 'Excellent'
           WHEN 'B' THEN 'Good'
           WHEN 'C' THEN 'Average'
           ELSE 'Below Average'
       END AS 'GradeDescription';
   
   /*```

5. **BEGIN TRY...END TRY, BEGIN CATCH...END CATCH:**
   - Used for error handling. `BEGIN TRY` defines a block of statements to try, and `BEGIN CATCH` defines a block of statements to handle any errors that occur.

   ```sql */

   BEGIN TRY
       -- Code that might raise an error
       SELECT 1 / 0;
   END TRY
   BEGIN CATCH
       -- Handle the error
       PRINT 'An error occurred: ' + ERROR_MESSAGE();
   END CATCH
  
  /*```

These examples showcase the usage of key control flow constructs in T-SQL. Feel free to ask if you have specific questions or if you'd like more examples!