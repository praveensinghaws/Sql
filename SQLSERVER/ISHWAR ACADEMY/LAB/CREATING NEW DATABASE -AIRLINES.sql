-- Use MASTER database
USE MASTER;
-- Comment: Dropping the 'AIRLINES' database if it exists and creating a new one.
DROP DATABASE IF EXISTS AIRLINESDB;
CREATE DATABASE AIRLINESDB;

-- Switch to the 'AIRLINES' database
USE AIRLINESDB;

-- Comment: Dropping the 'FLIGHT_PASSENGER' table if it exists and creating a new one with specified columns.
DROP TABLE IF EXISTS FLIGHT_PASSENGER;
CREATE TABLE FLIGHT_PASSENGER (
   FLIGHTID INT IDENTITY PRIMARY KEY,
   FIRSTNAME VARCHAR(20) NOT NULL,
   FLIGHTCODE VARCHAR(20) NOT NULL,
   FLIGHTDATE DATE NOT NULL,
   SEAT VARCHAR(5)
);

-- Comment: Inserting records into the 'FLIGHT_PASSENGER' table.
INSERT INTO FLIGHT_PASSENGER VALUES
('STEVE', 'SQL2022', '2022-03-27', '7F'),
('ADAM', 'SQL2022', '2022-03-27', '20A'),
('MIKE', 'SQL2022', '2022-03-27', '4B');

-- Comment: Dropping the 'CHECK_IN' table if it exists and creating a new one with specified columns.
DROP TABLE IF EXISTS CHECK_IN;
CREATE TABLE CHECK_IN (
   FIRSTNAME VARCHAR(20) NOT NULL,
   FLIGHTCODE VARCHAR(20) NOT NULL,
   FLIGHTDATE DATE NOT NULL,
   SEAT VARCHAR(5)
);

-- Comment: Inserting records into the 'CHECK_IN' table.
INSERT INTO CHECK_IN VALUES
('STEVE', 'SQL2022', '2022-03-27', '7F'),
('ADAM', 'SQL2022', '2022-03-27', '2B'),
('MIKE', 'SQL2022', '2022-03-27', '17A');
