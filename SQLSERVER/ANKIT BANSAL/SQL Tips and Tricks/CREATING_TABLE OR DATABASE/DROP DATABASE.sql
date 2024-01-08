-- Check if the database exists before attempting to drop it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DEMODB')
BEGIN
    -- Drop the DEMODB database
    DROP DATABASE DEMODB;
END


CREATE DATABASE DEMODB;