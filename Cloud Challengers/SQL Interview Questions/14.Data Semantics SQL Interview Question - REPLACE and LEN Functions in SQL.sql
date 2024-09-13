CREATE TABLE tbl_cnt (col1 INT, col2 VARCHAR(50));
INSERT INTO tbl_cnt VALUES (1, 'a,b,c'), (2, 'a,b');

SELECT *, LEN(REPLACE(col2, ',', '')) AS len_
FROM tbl_cnt;