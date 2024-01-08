-- ==================================
-- Single Row functions in Oracle:
-- ==================================
-- Query 1: Display various transformations of first_name
SELECT
    first_name,           -- Original first name
    upper(first_name),    -- Uppercase version
    lower(first_name),    -- Lowercase version
    initcap(first_name),  -- Capitalized version
    length(first_name),   -- Length of first name
    reverse(first_name)   -- Reversed first name
FROM hr.employees;
  -- Query 2: Select employees with the first name 'John' (case-sensitive)
SELECT
    *
FROM
    employees
WHERE
    first_name = 'John';

-- Query 3: Select employees with the first name 'john' (case-sensitive)
SELECT
    *
FROM
    employees
WHERE
    first_name = 'john';

-- Query 4: Select employees with the first name 'john' (case-insensitive)
SELECT
    *
FROM
    employees
WHERE
    lower(first_name) = 'john';

-- Query 5: Select employees with the first name 'JOHN' (case-insensitive)
SELECT
    *
FROM
    employees
WHERE
    upper(first_name) = 'JOHN';

-- Query 6: Display the address and its lowercase version from customer_details
SELECT
    address,
    lower(address)
FROM
    customer_details;

select ot.all_table from ot;
-- Query 7: Select customers with the address 'chennai' (case-sensitive)
SELECT
    *
FROM
    customer_details
WHERE
    address = 'chennai';

-- Query 8: Select customers with the address 'chennai' (case-insensitive)
SELECT
    *
FROM
    customer_details
WHERE
    lower(address) = 'chennai';

-- Query 9: Select customers with the address 'chennai' (case-insensitive)
SELECT
    *
FROM
    customer_details
WHERE
    upper(address) = 'CHENNAI';

-- ==================================
-- Substr --sub string
-- ==================================
-- Query 1: Extract 5 characters starting from position 12
SELECT
    substr('Welcome to India!!!', 12, 5)
FROM
    dual;
-- Result: "India"

-- Query 2: Extract all characters from position 12 to the end
SELECT
    substr('Welcome to India!!!', 12)
FROM
    dual;
-- Result: "India!!!"

-- Query 3: Extract the last 8 characters
SELECT
    substr('Welcome to India!!!', - 8)
FROM
    dual;
-- Result: "India!!!"

-- Query 4: Extract 5 characters starting from the last 8 characters
SELECT
    substr('Welcome to India!!!', - 8, 5)
FROM
    dual;
-- Result: "India"

-- Query 5: Extract the first 4 characters from the "job_id" column
SELECT
    job_id,
    substr(job_id, 1, 4)
FROM
    employees;
-- Result: Displays the "job_id" and the first 4 characters of each "job_id"

-- =================================================
-- Instr will return the position of the character
-- =================================================
-- Query 1: Find the position of the first occurrence of 'R' in the string 'CORPORATE FLOOR'
SELECT INSTR('CORPORATE FLOOR', 'R') FROM dual;
-- Result: 3 (The first 'R' is at position 3)

-- Query 2: Find the position of the second occurrence of 'R' in 'CORPORATE FLOOR', starting from the first character, and find it once
SELECT INSTR('CORPORATE FLOOR', 'R', 1, 2) FROM dual;
-- Result: 6
-- Explanation: The function starts searching from the first character and finds the second occurrence of 'R' at the 6th position in the string 'CORPORATE FLOOR'.

-- Query 3: Find the position of the first occurrence of 'AB' in the string 'CORPORATE FLOOR'
SELECT INSTR('CORPORATE FLOOR ', 'AB') FROM dual;
-- Result: 0 (There is no 'AB' in the string, so it returns 0)


-- Query 4: Find the position of the first space (' ') in the string 'CORPORATE FLOOR '
SELECT INSTR('CORPORATE FLOOR ', ' ') FROM dual;
-- Result: 10
-- Explanation: The function returns 10 because it found the first space at the 10th position in the string.

-- ==================================
-- from 3rd position 2nd occurrence
-- =================================
-- Query 1: Find the position of the second occurrence of 'OR' in 'CORPORATE FLOOR', starting from the 3rd position, and find it twice
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) FROM dual;
-- Result: 14
-- Explanation: It starts searching from the 3rd position, finds 'OR' at the 14th position, and repeats the search, finding it again at the same position.

-- Query 2: Find the position of the first occurrence of 'OR' in 'CORPORATE FLOOR', starting from the 3rd position, and find it once
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 1) FROM dual;
-- Result: 5
-- Explanation: It starts searching from the 3rd position and finds the first occurrence of 'OR' at the 5th position in the string 'CORPORATE FLOOR'.


-- Query 3: Extract the substring before the first comma (',') in the given text
SELECT SUBSTR('When system dialog prompts, click Open Zoom Meetings.', 1, INSTR('When system dialog prompts, click Open Zoom Meetings.', ',') - 1) FROM dual;
-- Result: "When system dialog prompts"

-- Query 4: Extract the substring before the '@' symbol in an email address
SELECT SUBSTR('sample@gmail.com', 1, INSTR('sample@gmail.com', '@') - 1) FROM dual;
-- Result: "sample"

-- Query 5: Extract the substring before the '@' symbol in another email address
SELECT SUBSTR('abc@gmail.com', 1, INSTR('abc@gmail.com', '@') - 1) FROM dual;
-- Result: "abc"

-- Query 6: Find the position of the first space (' ') in the string 'CORPORATE FLOOR GARDEN'
SELECT INSTR('CORPORATE FLOOR GARDEN', ' ') FROM dual;
-- Result: 10
-- Explanation: It finds the first space at the 10th position in the string.

-- Query 7: Extract the substring starting from the 17th character in 'CORPORATE FLOOR GARDEN'
SELECT SUBSTR('CORPORATE FLOOR GARDEN', 17) FROM dual;
-- Result: "GARDEN"
-- Explanation: It extracts the text starting from the 17th character.

-- Query 8: Find the position of the second space (' ') in 'CORPORATE FLOOR GARDEN'
SELECT INSTR('CORPORATE FLOOR GARDEN', ' ', 1, 2) FROM dual;
-- Result: 16
-- Explanation: It finds the second space at the 16th position in the string.

-- Query 9: Extract the substring after the second space (' ') in 'CORPORATE FLOOR GARDEN'
SELECT SUBSTR('CORPORATE FLOOR GARDEN', INSTR('CORPORATE FLOOR GARDEN', ' ', 1, 2) + 1) FROM dual;
-- Result: "GARDEN"
-- Explanation: It extracts the text after the second space, which is "GARDEN."

-- Query 10: Extract the substring after the third space (' ') in 'WELCOME TO CHENNAI CHROMPET'
SELECT SUBSTR('WELCOME TO CHENNAI CHROMPET', INSTR('WELCOME TO CHENNAI CHROMPET', ' ', 1, 3) + 1) FROM dual;
-- Result: "CHROMPET"
-- Explanation: It extracts the text after the third space, which is "CHROMPET."

-- Query 11: Extract the substring before the '@' symbol in an email address
SELECT SUBSTR('asfdfadsfad@gmail.com', 1, INSTR('asfdfadsfad@gmail.com', '@') - 1) FROM dual;
-- Result: "asfdfadsfad"
-- Explanation: It extracts the text before the '@' symbol in the email address.

-- ==================================

-- =================================





-- ==================================

-- =================================





-- ==================================

-- =================================




-- ==================================

-- =================================





-- ==================================

-- =================================




-- ==================================

-- =================================







