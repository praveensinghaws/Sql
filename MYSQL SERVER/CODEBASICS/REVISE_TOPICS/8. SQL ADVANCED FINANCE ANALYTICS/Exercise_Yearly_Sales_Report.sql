/* -- Exercise: Yearly Sales Report
Generate a yearly report for Croma India where there are two columns

1. Fiscal Year
2. Total Gross Sales amount In that year from Croma
*/

SELECT get_fiscal_year(s.date) AS Fiscal_year,
       ROUND(SUM(g.gross_price * s.sold_quantity), 2) AS Total_Gross_Sales_amount
FROM fact_sales_monthly s
JOIN fact_gross_price g ON s.product_code = g.product_code
                       AND g.fiscal_year = get_fiscal_year(s.date)
WHERE s.customer_code = 90002002
GROUP BY get_fiscal_year(s.date);

