-- Drop  database
DROP DATABASE IF EXISTS demodb;

-- Create the demodb database
CREATE DATABASE IF NOT EXISTS demodb;

USE demodb;

-- Drop the department table if it exists
DROP TABLE IF EXISTS department;

-- Create the department table
CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Drop the employee table if it exists
DROP TABLE IF EXISTS employee;

-- Create the employee table
CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    dept_id INT,
    location VARCHAR(100),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Insert sample data into the department table
INSERT INTO department (dept_name) VALUES
('HR'),
('Finance'),
('IT'),
('Sales');

-- Insert records into the employee table
INSERT INTO employee (fname, lname, salary, dept_id, location) VALUES
('Amit', 'Sharma', 50000.00, 1, 'Mumbai'),
('Neha', 'Singh', 45000.00, 4, 'Delhi'),
('Ravi', 'Kumar', 55000.00, 3, 'Bangalore'),
('Priya', 'Patel', 60000.00, 1, 'Hyderabad'),
('Vikas', 'Rao', 48000.00, 2, 'Pune'),
('Anita', 'Joshi', 53000.00, 3, 'Chennai'),
('Rohan', 'Nair', 52000.00, 4, 'Mumbai'),
('Sakshi', 'Mehta', 49000.00, 2, 'Delhi'),
('Rajesh', 'Gupta', 51000.00, 4, 'Bangalore'),
('Sunita', 'Verma', 54000.00, 1, 'Hyderabad'),
('Aman', 'Chauhan', 47000.00, 2, 'Pune'),
('Meera', 'Desai', 45000.00, 4, 'Chennai'),
('Karan', 'Pillai', 60000.00, 1, 'Mumbai'),
('Anjali', 'Reddy', 58000.00, 2, 'Delhi'),
('Suresh', 'Bansal', 61000.00, 3, 'Bangalore'),
('Preeti', 'Kapoor', 62000.00, 1, 'Hyderabad'),
('Rahul', 'Yadav', 57000.00, 2, 'Pune'),
('Shweta', 'Agarwal', 54000.00, 3, 'Chennai'),
('Vishal', 'Saxena', 55000.00, 4, 'Mumbai'),
('Rina', 'Malhotra', 50000.00, 2, 'Delhi');

-- Query to verify the inserted data
SELECT * FROM employee;