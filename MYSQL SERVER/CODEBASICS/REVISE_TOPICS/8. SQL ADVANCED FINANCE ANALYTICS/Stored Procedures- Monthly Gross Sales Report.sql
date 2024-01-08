
-- Generate monthly gross sales report for any customer using stored procedure
-- Switch to the database
USE `gdb0041`;

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS `get_monthly_gross_sales_for_customer`;

-- Create a new procedure to get monthly gross sales for a customer
CREATE PROCEDURE `get_monthly_gross_sales_for_customer`(
    in_customer_codes TEXT
)
BEGIN
    -- Select monthly gross sales for the specified customer codes
    SELECT DATE_FORMAT(s.date, '%b') AS Month,
           ROUND(SUM(g.gross_price * s.sold_quantity), 2) AS Monthly_Sales
    FROM fact_sales_monthly s
    JOIN dim_product p ON p.product_code = s.product_code
    JOIN fact_gross_price g ON s.product_code = g.product_code 
                             AND get_fiscal_year(s.date) = g.fiscal_year
    WHERE s.customer_code IN (in_customer_codes) -- Assuming s.customer_code is INT, use IN for multiple values
    GROUP BY Month
    ORDER BY FIELD(Month, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
END;

-- Call the procedure with a sample customer code
CALL get_monthly_gross_sales_for_customer(90002002);

