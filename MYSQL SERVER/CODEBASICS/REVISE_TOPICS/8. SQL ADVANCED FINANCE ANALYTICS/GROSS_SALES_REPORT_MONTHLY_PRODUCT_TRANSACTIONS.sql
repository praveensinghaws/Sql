/*
--Gross Sales Report: Monthly Product Transactions
-- month , Product name , variant , sold squantity , gross price per item , gross price total
-- 90002002	Croma	Brick & Mortar	Retailer	India	India	APAC	1
*/

SELECT s.date,
       s.product_code,
       p.product,
       p.variant,
       s.sold_quantity,
       g.gross_price,
       round(g.gross_price * s.sold_quantity,2) AS gross_price_total
FROM fact_sales_monthly s
JOIN dim_product p ON p.product_code = s.product_code
JOIN fact_gross_price g ON s.product_code = g.product_code 
                         AND get_fiscal_year(s.date) = g.fiscal_year
WHERE s.customer_code = 90002002
    AND get_fiscal_year(s.date) = 2021
    AND get_fiscal_quarter(s.date) = 1;


    /*--  extra query 
    ,
       YEAR(DATE_ADD(date, INTERVAL 4 MONTH)) AS FISCAL_YEAR,
        CASE
        WHEN MONTH(date) IN (9, 10, 11) THEN 1  -- Q1
        WHEN MONTH(date) IN (12, 1, 2) THEN 2    -- Q2
        WHEN MONTH(date) IN (3, 4, 5) THEN 3      -- Q3
        WHEN MONTH(date) IN (6, 7, 8) THEN 4      -- Q4
        ELSE NULL
    END as fiscal_quarter

    /*

