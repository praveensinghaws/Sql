-- QUERY 1: Gross Sales Report - Total Sales Amount
-- Retrieve the total gross sales amount per month
SELECT DATE_FORMAT(`DATE`, '%b') AS MONTH,
       SUM(gross_price_total) AS TOTAL_GROSS_SALES_AMOUNT
FROM monthly_product_transactions
GROUP BY MONTH;

-- OR

-- QUERY 2: Gross Sales Report - Total Sales Amount
-- Retrieve the total gross sales amount per month for a specific customer in fiscal year 2021, Q1
SELECT DATE_FORMAT(`DATE`, '%b') AS MONTH,
       ROUND(SUM(g.gross_price * s.sold_quantity), 2) AS TOTAL_GROSS_SALES_AMOUNT
FROM fact_sales_monthly s
JOIN dim_product p ON p.product_code = s.product_code
JOIN fact_gross_price g ON s.product_code = g.product_code 
                         AND get_fiscal_year(s.date) = g.fiscal_year
WHERE s.customer_code = 90002002
    AND get_fiscal_year(s.date) = 2021
    AND get_fiscal_quarter(s.date) = 1    
GROUP BY MONTH;
