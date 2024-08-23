*****************
| LEARNING SQL	|
*****************

SELECT GROUP_CONCAT(COLUMN_NAME SEPARATOR ', ') AS column_names 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'students';

**********************************************************************************************************

### Example Queries:

If you have a table named `students` in a database named `demodb`, here’s how you can check the constraints:

1. **Foreign Key Constraints**:
    ```sql
    SELECT 
        CONSTRAINT_NAME, 
        TABLE_NAME, 
        COLUMN_NAME, 
        REFERENCED_TABLE_NAME, 
        REFERENCED_COLUMN_NAME 
    FROM 
        INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
    WHERE 
        REFERENCED_TABLE_NAME IS NOT NULL 
        AND TABLE_SCHEMA = 'demodb'
        AND TABLE_NAME = 'students';
    ```

2. **Check Constraints**:
    ```sql
    SELECT 
        CONSTRAINT_NAME, 
        TABLE_NAME, 
        CHECK_CLAUSE 
    FROM 
        INFORMATION_SCHEMA.CHECK_CONSTRAINTS 
    WHERE 
        CONSTRAINT_SCHEMA = 'demodb'
        AND TABLE_NAME = 'students';
    ```

3. **Primary Key Constraints**:
    ```sql
    SELECT 
        CONSTRAINT_NAME, 
        TABLE_NAME, 
        COLUMN_NAME 
    FROM 
        INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
    WHERE 
        CONSTRAINT_NAME = 'PRIMARY'
        AND TABLE_SCHEMA = 'demodb'
        AND TABLE_NAME = 'students';
    ```
*************************************************************************

-- Rename the table 'old_table' to 'new_table'
RENAME TABLE old_table TO new_table;

***************************************************************************
To execute or query a view in MariaDB or MySQL, you use a `SELECT` statement just like you would with a regular table. Here’s how you can do it:

### Query the View

To retrieve data from a view named `mydata`, use:

```sql
SELECT * FROM mydata;
```

### Example

Assuming you have created a view `mydata` with the following SQL:

```sql
CREATE VIEW mydata AS
SELECT student_company,
       COUNT(*) AS count_exp
FROM students
GROUP BY student_company;
```

You can execute the view to see the results by running:

```sql
SELECT * FROM mydata;
```

### Additional Queries

You can also perform more complex queries on the view, such as filtering, sorting, or joining with other tables:

- **Filtering:**
  ```sql
  SELECT * FROM mydata
  WHERE count_exp > 10;
  ```

- **Sorting:**
  ```sql
  SELECT * FROM mydata
  ORDER BY count_exp DESC;
  ```

- **Joining with Another Table:**
  ```sql
  SELECT m.student_company, m.count_exp, s.other_column
  FROM mydata m
  JOIN some_other_table s ON m.student_company = s.company_column;
  ```

These queries allow you to interact with the view in various ways depending on your needs.