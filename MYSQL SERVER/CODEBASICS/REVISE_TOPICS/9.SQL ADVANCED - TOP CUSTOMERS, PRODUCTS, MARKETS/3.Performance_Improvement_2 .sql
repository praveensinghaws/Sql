-- Adding a new column 'fiscal_year' to the 'fact_sales_monthly' table in the 'gdb0041' database
ALTER TABLE `gdb0041`.`fact_sales_monthly` 

-- Adding a column named 'fiscal_year' with data type 'YEAR'
ADD COLUMN `fiscal_year` YEAR 

-- Generating the value for 'fiscal_year' using the 'YEAR' function
-- The value is derived from the 'date' column, incremented by 4 months
GENERATED ALWAYS AS (YEAR(DATE_ADD(date, INTERVAL 4 MONTH))) 

-- Placing the new column 'fiscal_year' after the existing 'sold_quantity' column
AFTER `sold_quantity`;

-- >>>>>>>>>>>>>

-- ### Module: Performance Improvement # 2

-- Added the fiscal year in the fact_sales_monthly table itself
EXPLAIN ANALYZE
	SELECT 
    	    s.date, 
            s.customer_code,
            s.product_code, 
            p.product, p.variant, 
            s.sold_quantity, 
            g.gross_price as gross_price_per_item,
            ROUND(s.sold_quantity*g.gross_price,2) as gross_price_total,
            pre.pre_invoice_discount_pct
	FROM fact_sales_monthly s
	JOIN dim_product p
        	ON s.product_code=p.product_code
	JOIN fact_gross_price g
    		ON g.fiscal_year=s.fiscal_year
    		AND g.product_code=s.product_code
	JOIN fact_pre_invoice_deductions as pre
        	ON pre.customer_code = s.customer_code AND
    		pre.fiscal_year=s.fiscal_year
	WHERE 
    		s.fiscal_year=2021     
	LIMIT 1500000;  
