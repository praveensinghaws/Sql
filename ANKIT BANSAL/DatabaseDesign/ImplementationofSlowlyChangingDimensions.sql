select * from information_schema.tables;
/* Implimenting scd type 1 and scd 2 using SQL
	•	SCD Type 1: Updates records directly in the dimension table without retaining historical data.
	•	SCD Type 2: Maintains history by closing existing records (updating the End_Date) and inserting new records with updated data.
*/

--------------------------------------------------------------
-- SCD TYPE 1
--------------------------------------------------------------
-- Drop the staging table if it exists
DROP TABLE IF EXISTS product_stg;

-- Create a staging table to temporarily hold product data
CREATE TABLE product_stg (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(9,2)
);

-- Drop the dimension table if it exists
DROP TABLE IF EXISTS product_dim;

-- Create a dimension table to store product data with a last update timestamp
CREATE TABLE product_dim (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(9,2),
    Last_update DATE
);

-- Insert initial data into the staging table
INSERT INTO product_stg VALUES (1, 'iphone13', 40000), (2, 'iphone14', 70000);

-- Declare a date variable for the initial update
DECLARE @today DATE = '2024-01-01';

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, @today
    FROM product_stg
    WHERE Product_id NOT IN (SELECT Product_id FROM product_dim);

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Insert updated and new data into the staging table
INSERT INTO product_stg VALUES (1, 'iphone13', 30000), (3, 'iphone15', 90000);

-- Update existing records in the dimension table with new data from the staging table
SET @today = '2024-01-20';
UPDATE product_dim
SET Price = product_stg.Price, Last_update = @today
FROM product_stg
WHERE product_stg.Product_id = product_dim.Product_id;

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, @today
    FROM product_stg
    WHERE Product_id NOT IN (SELECT Product_id FROM product_dim);

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Insert more data into the staging table
INSERT INTO product_stg VALUES (2, 'iphone14', 40000), (4, 'iphone16', 100000);

-- Update existing records in the dimension table with new data from the staging table
SET @today = '2024-01-25';
UPDATE product_dim
SET Price = product_stg.Price, Last_update = @today
FROM product_stg
WHERE product_stg.Product_id = product_dim.Product_id;

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, @today
    FROM product_stg
    WHERE Product_id NOT IN (SELECT Product_id FROM product_dim);

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Check the final state of the dimension and staging tables
SELECT * FROM product_dim;
SELECT * FROM product_stg;

--------------------------------------------------------------
-- SCD TYPE 2
--------------------------------------------------------------

-- Drop the staging table if it exists
DROP TABLE IF EXISTS product_stg;

-- Create a staging table for SCD Type 2
CREATE TABLE product_stg (
    Product_Id INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(9,2)
);

-- Drop the dimension table if it exists
DROP TABLE IF EXISTS product_dim;

-- Create a dimension table for SCD Type 2 with Start and End dates to track changes
CREATE TABLE product_dim (
    Product_Key INT IDENTITY(1,1) PRIMARY KEY,
    Product_Id INT,
    Product_Name VARCHAR(50),
    Price DECIMAL(9,2),
    Start_Update DATE,
    End_Date DATE
);

-- Insert initial data into the staging table
INSERT INTO product_stg VALUES (1, 'iphone13', 40000), (2, 'iphone14', 70000);

-- Declare a date variable for the initial update
DECLARE @today DATE = '2024-01-01';

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, @today, '9999-12-31'
    FROM product_stg
    WHERE Product_id NOT IN (SELECT Product_id FROM product_dim);

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Insert updated and new data into the staging table
INSERT INTO product_stg VALUES (1, 'iphone13', 30000), (3, 'iphone15', 90000);

-- Declare a variable for the current update date
DECLARE @today DATE = '2024-01-20';

-- Update the End_Date of existing records in the dimension table when data changes
UPDATE product_dim
SET End_Date = DATEADD(DAY, -1, @today)
FROM product_stg
WHERE product_stg.Product_id = product_dim.Product_Id
AND End_Date = '9999-12-31';


-- Declare the variable for the current update date
DECLARE @today DATE = '2024-01-20';

-- Insert new records from the staging table into the dimension table
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, @today, '9999-12-31'
    FROM product_stg;

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Insert updated and new data into the staging table
INSERT INTO product_stg VALUES (2, 'iphone14', 40000), (4, 'iphone16', 100000);

-- Declare a variable for the new update date
SET @today = '2024-01-25';

-- Update the End_Date of existing records in the dimension table when data changes
UPDATE product_dim
SET End_Date = DATEADD(DAY, -1, @today)
FROM product_stg
WHERE product_stg.Product_id = product_dim.Product_Id
AND End_Date = '9999-12-31';

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, @today, '9999-12-31'
    FROM product_stg;

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Check the final state of the dimension and staging tables
SELECT * FROM product_dim;
SELECT * FROM product_stg;

----------------------------------------------------------------------------------
-- “Note: Instead of DECLARE @today DATE = '2024-01-01', I can use GETDATE().”
----------------------------------------------------------------------------------
--------------------------------------------------------------
-- SCD TYPE 1
--------------------------------------------------------------

-- Drop the staging table if it exists
DROP TABLE IF EXISTS product_stg;

-- Create a staging table to temporarily hold product data
CREATE TABLE product_stg (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(9,2)
);

-- Drop the dimension table if it exists
DROP TABLE IF EXISTS product_dim;

-- Create a dimension table to store product data with a last update timestamp
CREATE TABLE product_dim (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(9,2),
    Last_update DATE
);

-- Insert initial data into the staging table
INSERT INTO product_stg VALUES (1, 'iphone13', 40000), (2, 'iphone14', 70000);

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, GETDATE()
    FROM product_stg
    WHERE Product_id NOT IN (SELECT Product_id FROM product_dim);

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Insert updated and new data into the staging table
INSERT INTO product_stg VALUES (1, 'iphone13', 30000), (3, 'iphone15', 90000);

-- Update existing records in the dimension table with new data from the staging table
UPDATE product_dim
SET Price = product_stg.Price, Last_update = GETDATE()
FROM product_stg
WHERE product_stg.Product_id = product_dim.Product_id;

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, GETDATE()
    FROM product_stg
    WHERE Product_id NOT IN (SELECT Product_id FROM product_dim);

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Insert more data into the staging table
INSERT INTO product_stg VALUES (2, 'iphone14', 40000), (4, 'iphone16', 100000);

-- Update existing records in the dimension table with new data from the staging table
UPDATE product_dim
SET Price = product_stg.Price, Last_update = GETDATE()
FROM product_stg
WHERE product_stg.Product_id = product_dim.Product_id;

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, GETDATE()
    FROM product_stg
    WHERE Product_id NOT IN (SELECT Product_id FROM product_dim);

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Check the final state of the dimension and staging tables
SELECT * FROM product_dim;
SELECT * FROM product_stg;

--------------------------------------------------------------
-- SCD TYPE 2
--------------------------------------------------------------

-- Drop the staging table if it exists
DROP TABLE IF EXISTS product_stg;

-- Create a staging table for SCD Type 2
CREATE TABLE product_stg (
    Product_Id INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(9,2)
);

-- Drop the dimension table if it exists
DROP TABLE IF EXISTS product_dim;

-- Create a dimension table for SCD Type 2 with Start and End dates to track changes
CREATE TABLE product_dim (
    Product_Key INT IDENTITY(1,1) PRIMARY KEY,
    Product_Id INT,
    Product_Name VARCHAR(50),
    Price DECIMAL(9,2),
    Start_Update DATE,
    End_Date DATE
);

-- Insert initial data into the staging table
INSERT INTO product_stg VALUES (1, 'iphone13', 40000), (2, 'iphone14', 70000);

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, GETDATE(), '9999-12-31'
    FROM product_stg
    WHERE Product_id NOT IN (SELECT Product_id FROM product_dim);

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Insert updated and new data into the staging table
INSERT INTO product_stg VALUES (1, 'iphone13', 30000), (3, 'iphone15', 90000);

-- Update the End_Date of existing records in the dimension table when data changes
UPDATE product_dim
SET End_Date = DATEADD(DAY, -1, GETDATE())
FROM product_stg
WHERE product_stg.Product_id = product_dim.Product_Id
AND End_Date = '9999-12-31';

-- Insert new records from the staging table into the dimension table
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, GETDATE(), '9999-12-31'
    FROM product_stg;

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Insert updated and new data into the staging table
INSERT INTO product_stg VALUES (2, 'iphone14', 40000), (4, 'iphone16', 100000);

-- Update the End_Date of existing records in the dimension table when data changes
UPDATE product_dim
SET End_Date = DATEADD(DAY, -1, GETDATE())
FROM product_stg
WHERE product_stg.Product_id = product_dim.Product_Id
AND End_Date = '9999-12-31';

-- Insert new records from the staging table into the dimension table if they don't exist
INSERT INTO product_dim
    SELECT Product_id, Product_Name, Price, GETDATE(), '9999-12-31'
    FROM product_stg;

-- Clear the staging table after processing
DELETE FROM product_stg;

-- Check the final state of the dimension and staging tables
SELECT * FROM product_dim;
SELECT * FROM product_stg;