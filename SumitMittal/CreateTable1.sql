-- Drop  database
DROP DATABASE IF EXISTS demodb;

-- Create the demodb database
CREATE DATABASE IF NOT EXISTS demodb;

USE demodb;


-- Drop the existing course table if it exists
DROP TABLE IF EXISTS course;

-- Create the course table
CREATE TABLE course (
    course_id INT NOT NULL,
    course_name VARCHAR(30) NOT NULL,
    course_duration_months INT NOT NULL,
    course_fee INT NOT NULL CHECK (course_fee > 0),
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (course_id)
);

-- Insert records into the course table
INSERT INTO course (course_id, course_name, course_duration_months, course_fee) VALUES
(1, 'Data Science', 6, 50000),
(2, 'Web Development', 3, 30000),
(3, 'Machine Learning', 4, 40000),
(4, 'Cloud Computing', 5, 45000),
(5, 'Python', 2, 15000);

-- Drop the existing student table if it exists
DROP TABLE IF EXISTS student;

-- Create the student table
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(30) NOT NULL,
    mname VARCHAR(30),
    email VARCHAR(30) UNIQUE,
    phone VARCHAR(15),
    alternate_phone VARCHAR(15),
    enrollment_date TIMESTAMP NOT NULL,
    selected_course INT NOT NULL DEFAULT 1,
    year_of_exp INT NOT NULL CHECK (year_of_exp >= 0 AND year_of_exp <= 10),
    student_company VARCHAR(30) NOT NULL,
    batch_date DATE NOT NULL,
    source_of_joining VARCHAR(30) NOT NULL,
    location VARCHAR(30) NOT NULL,
    FOREIGN KEY (selected_course) REFERENCES course(course_id)
);

-- Insert records into the student table
INSERT INTO student (fname, lname, mname, email, phone, alternate_phone, enrollment_date, selected_course, year_of_exp, student_company, batch_date, source_of_joining, location)
VALUES 
('Amit', 'Sharma', 'Kumar', 'amit.sharma@example.com', '9123456789', '9123456788', '2024-01-15 09:00:00', 1, 10, 'TCS', '2024-01-20', 'Referral', 'Mumbai'),
('Neha', 'Singh', NULL, 'neha.singh@example.com', '9234567890', '9234567889', '2024-01-16 09:00:00', 2, 1, 'Infosys', '2024-01-21', 'Online', 'Bangalore'),
('Ravi', 'Kumar', 'Raj', 'ravi.kumar@example.com', '9345678901', '9345678890', '2024-01-17 09:00:00', 3, 3, 'Wipro', '2024-01-22', 'Walk-In', 'Hyderabad'),
('Priya', 'Patel', NULL, 'priya.patel@example.com', '9456789012', '9456788901', '2024-01-18 09:00:00', 4, 9, 'Cognizant', '2024-01-23', 'Advertisement', 'Chennai'),
('Vikas', 'Rao', 'Suresh', 'vikas.rao@example.com', '9567890123', '9567890012', '2024-01-19 09:00:00', 5, 2, 'Capgemini', '2024-01-24', 'Referral', 'Pune'),
('Anita', 'Joshi', NULL, 'anita.joshi@example.com', '9678901234', '9678901123', '2024-01-20 09:00:00', 1, 1, 'IBM', '2024-01-25', 'Online', 'Kolkata'),
('Rohan', 'Nair', 'Vijay', 'rohan.nair@example.com', '9789012345', '9789011234', '2024-01-21 09:00:00', 2, 4, 'Accenture', '2024-01-26', 'Walk-In', 'Delhi'),
('Sakshi', 'Mehta', NULL, 'sakshi.mehta@example.com', '9890123456', '9890112345', '2024-01-22 09:00:00', 3, 7, 'HCL', '2024-01-27', 'Advertisement', 'Ahmedabad'),
('Rajesh', 'Gupta', 'Kumar', 'rajesh.gupta@example.com', '9901234567', '9901123456', '2024-01-23 09:00:00', 4, 3, 'Tech Mahindra', '2024-01-28', 'Referral', 'Jaipur'),
('Sunita', 'Verma', NULL, 'sunita.verma@example.com', '9012345678', '9011234567', '2024-01-24 09:00:00', 5, 2, 'Oracle', '2024-01-29', 'Online', 'Lucknow'),
('Aman', 'Chauhan', 'Kumar', 'aman.chauhan@example.com', '9123456789', '9123445678', '2024-01-25 09:00:00', 1, 10, 'Microsoft', '2024-01-30', 'Walk-In', 'Indore'),
('Meera', 'Desai', NULL, 'meera.desai@example.com', '9234567890', '9234556789', '2024-01-26 09:00:00', 2, 2, 'Amazon', '2024-01-31', 'Advertisement', 'Thane'),
('Karan', 'Pillai', 'Ravi', 'karan.pillai@example.com', '9345678901', '9345667890', '2024-01-27 09:00:00', 3, 9, 'Google', '2024-02-01', 'Referral', 'Bhopal'),
('Anjali', 'Reddy', NULL, 'anjali.reddy@example.com', '9456789012', '9456778901', '2024-01-28 09:00:00', 4, 4, 'Facebook', '2024-02-02', 'Online', 'Nagpur'),
('Suresh', 'Bansal', 'Kumar', 'suresh.bansal@example.com', '9567890123', '9567789012', '2024-01-29 09:00:00', 5, 8, 'Intel', '2024-02-03', 'Walk-In', 'Kanpur'),
('Preeti', 'Kapoor', NULL, 'preeti.kapoor@example.com', '9678901234', '9677890123', '2024-01-30 09:00:00', 1, 1, 'Dell', '2024-02-04', 'Advertisement', 'Ludhiana'),
('Rahul', 'Yadav', 'Raj', 'rahul.yadav@example.com', '9789012345', '9787889012', '2024-01-31 09:00:00', 2, 3, 'HP', '2024-02-05', 'Referral', 'Visakhapatnam'),
('Shweta', 'Agarwal', NULL, 'shweta.agarwal@example.com', '9890123456', '9896778901', '2024-02-01 09:00:00', 3, 5, 'Samsung', '2024-02-06', 'Online', 'Patna'),
('Vishal', 'Saxena', 'Kumar', 'vishal.saxena@example.com', '9901234567', '9905667890', '2024-02-02 09:00:00', 4, 4, 'Sony', '2024-02-07', 'Walk-In', 'Vadodara'),
('Rina', 'Malhotra', NULL, 'rina.malhotra@example.com', '9012345678', '9014556789', '2024-02-03 09:00:00', 5, 2, 'LG', '2024-02-08', 'Advertisement', 'Coimbatore'),
('Ashish', 'Saini', 'Kumar', 'ashish.saini@example.com', '9123456789', '9123456678', '2024-02-04 09:00:00', 1, 7, 'Philips', '2024-02-09', 'Referral', 'Gurgaon'),
('Nisha', 'Kaur', NULL, 'nisha.kaur@example.com', '9234567890', '9234565567', '2024-02-05 09:00:00', 2, 6, 'Cisco', '2024-02-10', 'Online', 'Mumbai');
