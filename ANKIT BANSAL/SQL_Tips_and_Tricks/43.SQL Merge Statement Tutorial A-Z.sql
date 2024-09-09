CREATE TABLE SourceProducts (
    ProductID INT,
    ProductName VARCHAR(50),
    Price DECIMAL(9,2)
);

CREATE TABLE TargetProducts (
    ProductID INT,
    ProductName VARCHAR(50),
    Price DECIMAL(9,2)
);

INSERT INTO SourceProducts VALUES (1, 'Table', 90), (3, 'Chair', 70);
INSERT INTO TargetProducts VALUES (1, 'Table', 100), (2, 'Desk', 180);


SELECT* FROM SourceProducts;
SELECT * FROM TargetProducts;

-- This MERGE statement synchronizes data from the SourceProducts table into the TargetProducts table.
MERGE TargetProducts AS t
USING SourceProducts AS s 
ON t.ProductID = s.ProductID  -- Match rows in TargetProducts and SourceProducts based on ProductID.

-- When a match is found (i.e., the same ProductID exists in both tables),
-- update the ProductName and Price in the TargetProducts table to match the SourceProducts table.
WHEN MATCHED THEN 
    UPDATE 
    SET t.Price = s.Price, 
        t.ProductName = s.ProductName

-- When there is no match found in the TargetProducts table (i.e., the ProductID from SourceProducts 
-- does not exist in TargetProducts), insert the new product into TargetProducts.
WHEN NOT MATCHED BY TARGET THEN 
    INSERT VALUES (s.ProductID, s.ProductName, s.Price)

-- When there is no match found in the SourceProducts table (i.e., the ProductID from TargetProducts
-- does not exist in SourceProducts), delete the product from TargetProducts.
WHEN NOT MATCHED BY SOURCE THEN 
    DELETE;
