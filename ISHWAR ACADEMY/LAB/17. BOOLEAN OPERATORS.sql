-- This query creates a table named 'tbl_user_login'
CREATE TABLE tbl_user_login(
    -- 'user_id' is an integer column, the primary key, and it auto-increments using IDENTITY
    user_id int PRIMARY KEY IDENTITY,

    -- 'username' is a VARCHAR(50) column, not null, and must be unique
    username VARCHAR(50) NOT NULL UNIQUE,

    -- 'email' is a VARCHAR(100) column, not null, and must be unique
    email VARCHAR(100) NOT NULL UNIQUE,

    -- 'password' is a VARCHAR(50) column, not null
    password VARCHAR(50) NOT NULL
);

-- Inserting fictional Indian user records into tbl_user_login
INSERT INTO tbl_user_login (username, email, password) VALUES
('rajkumar', 'rajkumar@example.com', 'secure_password1'),
('anitasingh', 'anita.singh@example.com', 'strong_password2'),
('sureshverma', 'suresh.verma@example.com', 'safe_password3'),
('priyasharma', 'priya.sharma@example.com', 'password123');

-- Retrieving username based on email and plain text password (Note: Storing passwords in plain text is not recommended for security reasons)
SELECT username FROM tbl_user_login 
WHERE email = 'anita.singh@example.com' 
  AND password = 'strong_password2'; 


-- Retrieving username for records where email is 'xyz@example.com' or password is 'password123'
SELECT username FROM tbl_user_login 
WHERE email = 'xyz@example.com' 
  OR password = 'password123'; 


  

-- Retrieving all columns for records where the username is not 'rajkumar'
SELECT * FROM tbl_user_login 
WHERE NOT username = 'rajkumar';

-- Retrieving all columns for records where the username is not 'rajkumar' (alternative syntax)
SELECT * FROM tbl_user_login 
WHERE username != 'rajkumar';

-- Retrieving all columns for records where the username is not 'rajkumar' (alternative syntax)
SELECT * FROM tbl_user_login 
WHERE username <> 'rajkumar';

