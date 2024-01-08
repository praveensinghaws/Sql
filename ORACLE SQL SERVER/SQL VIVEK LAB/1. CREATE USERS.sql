-- Create a new user named 'praveen' with the password 'Admin260'
CREATE USER praveen IDENTIFIED BY Admin260;

-- Grant the following roles to the 'praveen' user:
-- - 'CONNECT' role allows the user to connect to the database
-- - 'RESOURCE' role provides basic resource privileges
-- - 'DBA' role grants extensive database administration privileges
GRANT CONNECT, RESOURCE, DBA TO praveen;

-- Grant the 'CREATE SESSION' privilege, allowing the user to create a database session (log in)
-- Grant the 'GRANT ANY PRIVILEGE' privilege, allowing the user to grant any privilege to other users
GRANT CREATE SESSION, GRANT ANY PRIVILEGE TO praveen;

-- Grant the 'UNLIMITED TABLESPACE' privilege, allowing the user to create tables and data without space restrictions
GRANT UNLIMITED TABLESPACE TO praveen;
