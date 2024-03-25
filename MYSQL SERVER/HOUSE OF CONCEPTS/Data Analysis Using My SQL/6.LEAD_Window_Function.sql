/*
****************************************************
 LEAD(expr,offset,default) Window Function in MySQL
****************************************************

To return value from row that follows the current row [by a specified number of rows]
=> expr: expression to be evaluated for the subsequent row
=> offset: number of rows forward to the current row
=> default: default value to be returned if there is no subsequent row

==========
 SYNTAX :
==========
LEAD(expr[, offset[, default]])
OVER (
[PARTITION BY expr]
[ORDER BY expr]
*/ --**************************************** Basic Scenario ****************************************************

SELECT *,
       lead(salary, 2, 0) OVER(PARTITION BY Department_name
                               ORDER BY salary) as lead_salary
FROM Employee;

--**************************************** Advanced Scenario ****************************************************
-- Create the table

CREATE TABLE project_task_schedule (Task_ID INT, Task_Name VARCHAR(255),
                                                           Start_Date DATETIME,
                                                           End_Date DATETIME);

-- Insert the data

INSERT INTO project_task_schedule (Task_ID, Task_Name, Start_Date, End_Date)
VALUES (1, 'Task A', '2023-01-01 00:00:00', '2023-01-05 00:00:00'),
       (2, 'Task B', '2023-01-04 00:00:00', '2023-01-10 00:00:00'),
       (3, 'Task C', '2023-01-09 00:00:00', '2023-01-15 00:00:00'),
       (4, 'Task D', '2023-01-14 00:00:00', '2023-01-20 00:00:00'),
       (5, 'Task E', '2023-01-18 00:00:00', '2023-01-25 00:00:00');

-- Query:

SELECT *,
       LEAD(DATE(Start_Date)) OVER(
                                   ORDER BY Start_Date) as Next_Task_Start_Date,
       DATE(End_Date) - LEAD(DATE(Start_Date)) OVER(
                                                    ORDER BY Start_Date)+1 as Overlaping_Days
FROM project_task_schedule;