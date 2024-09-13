-- Creating the studnts_tbl table
CREATE TABLE studnts_tbl (
    sname VARCHAR(50), 
    marks INT
);

-- Inserting values into studnts_tbl
INSERT INTO studnts_tbl 
VALUES 
    ('A', 75),
    ('B', 30),
    ('C', 55),
    ('A', 60),
    ('D', 91),
    ('B', 19),
    ('G', 36),
    ('S', 65),
    ('K', 49);

-- Adding a computed column 'Grade' to studnts_tbl
ALTER TABLE studnts_tbl
ADD Grade AS 
(
    CASE 
        WHEN marks >= 80 THEN 'Excellent' 
        WHEN marks >= 60 AND marks < 80 THEN 'VGood' 
        WHEN marks >= 35 AND marks < 60 THEN 'Good'
        ELSE 'Poor' 
    END
);

-- Selecting all records from studnts_tbl to verify the computed column
SELECT * FROM studnts_tbl;

