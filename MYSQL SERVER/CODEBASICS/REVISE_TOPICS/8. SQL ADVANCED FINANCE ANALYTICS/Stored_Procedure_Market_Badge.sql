-- Stored Procedure: Market Badge

--  Write a stored proc that can retrieve market badge. i.e. if total sold quantity > 5 million that market is considered "Gold" else "Silver"
-- Create a stored procedure to determine the market badge level
CREATE PROCEDURE `get_market_badge`(
    IN in_market VARCHAR(45),
    IN in_fiscal_year YEAR,
    OUT out_level VARCHAR(45)
)
BEGIN
    -- Declare and initialize variable for total sold quantity
    DECLARE qty INT DEFAULT 0;

    -- Default market is set to India if not provided
    IF in_market = "" THEN
        SET in_market = "India";
    END IF;

    -- Retrieve total sold quantity for a given market in a given year
    SELECT 
        SUM(s.sold_quantity) INTO qty
    FROM fact_sales_monthly s
    JOIN dim_customer c ON s.customer_code = c.customer_code
    WHERE 
        get_fiscal_year(s.date) = in_fiscal_year AND
        c.market = in_market;

    -- Determine Gold vs Silver status based on sold quantity
    IF qty > 5000000 THEN
        SET out_level = 'Gold';
    ELSE
        SET out_level = 'Silver';
    END IF;
END;

-- Call the stored procedure with sample parameters and retrieve the result
SET @out_badge = '0';
CALL get_market_badge('usa', 2020, @out_badge);
SELECT @out_badge;
