SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'public';

/* 
WINDOW FUNCTION 
[1. ALTERNATE WAY TO TO WRITE SQL QUERY
 2. FRAME CLAUSE
 3. FIRST_VALUE
 4. LAST_VALUE
 5. NTH_VALUE
 6. NTILE
 7. PERCENT_RANK
 8. CUME_DIST]
 */
----------------
-- FIRST_VALUE |
----------------

/* 
Query 1:  FIRST_VALUE
Question: Display the most expensive product under each category
*/
SELECT *,
       FIRST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC) AS most_exp_product
FROM product;

----------------
-- LAST_VALUE  |
----------------
/* 
Query 2:  LAST_VALUE
Question: Display the least expensive product under each category
*/
SELECT *,
       LAST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price ASC) AS least_exp_product
FROM product;

-----------------
-- FRAME_CLAUSE |
-----------------
/*
Query 3:  FRAME_CLAUSE [RANGE BETWEEN]
Question: Display the most and least expensive products for each category using RANGE BETWEEN
*/
SELECT *,
       FIRST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC) AS most_exp_product,
       LAST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC
       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS least_exp_product
FROM product;
/*
Comment:
This query uses RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING to include all rows in the window frame,
 resulting in the same output as the ROWS BETWEEN version.
 */

/*
Query 4:  FRAME_CLAUSE [ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING]
Question: Display the most and least expensive products for the 'Phone' category
*/
SELECT *,
       FIRST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC) AS most_exp_product,
       LAST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC 
       ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS least_exp_product
FROM product
WHERE product_category = 'Phone';

/*
Query 5:  FRAME_CLAUSE [ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW]
Question: Display the most and least expensive products for the 'Phone' category
*/
SELECT *,
       FIRST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC) AS most_exp_product,
       LAST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC 
       ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS least_exp_product
FROM product
WHERE product_category = 'Phone';

/*
Comment:
This query specifically focuses on the 'Phone' category and uses ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 
to include all rows up to the current row in the window frame. The result is the same as the previous query.
*/

/*
Query 6:
-- Retrieve details for the 'Phone' category, including the most and least expensive products within a window of 2 preceding and 2 following rows.
*/

SELECT *,
       -- Find the most expensive product under each product category
       FIRST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC) AS most_exp_product,
       -- Find the least expensive product within a window of 2 preceding and 2 following rows
       LAST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price DESC 
       ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS least_exp_product
FROM product
WHERE product_category = 'Phone';

/*
Comment:
This query successfully utilizes the window frame ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING 
to include the current row along with two preceding and two following rows when determining 
the least expensive product. Ensure that your data distribution supports this window frame, 
and adjust the query accordingly based on your specific requirements.
*/

----------------------------------------
-- ALTERNATE WAY TO TO WRITE SQL QUERY |
----------------------------------------

-- Retrieve details for the 'Phone' category, including the most and least expensive products with a window frame defined by RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING.
SELECT *,
       FIRST_VALUE(product_name) OVER w AS most_exp_product,
       LAST_VALUE(product_name) OVER w AS least_exp_product
FROM product
WHERE product_category = 'Phone'
WINDOW w AS (PARTITION BY product_category ORDER BY price DESC 
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);

--------------
-- NTH_VALUE | 
--------------
-- Write query to display the second most expensive product under each category.
SELECT *,
       FIRST_VALUE(product_name) OVER w AS most_exp_product,
       LAST_VALUE(product_name) OVER w AS least_exp_product,
       NTH_VALUE (product_name ,2) OVER w AS second_most_exp_product
FROM product
WINDOW w AS (PARTITION BY product_category ORDER BY price DESC 
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);

----------
-- ntile | 
----------
-- Write a query to sefregate all the expensive phones , mid range phones and the cheaper phones.
-- Use NTILE to categorize 'Phone' products into three buckets based on price, and assign labels to each bucket.
WITH phone_bucket AS (
    SELECT *,
           NTILE(3) OVER (ORDER BY price DESC) AS buckets
    FROM product
    WHERE product_category = 'Phone'
)
SELECT *,
       CASE 
           WHEN buckets = 1 THEN 'Expensive phones'
           WHEN buckets = 2 THEN 'Mid range phones'
           WHEN buckets = 3 THEN 'Cheaper phones'
       END AS Phone_Category
FROM phone_bucket;

--------------
-- CUME_DIST |   [CUMULATIVE DISTRIBUTION];
--------------
/*
VALUE --> 1  >= CUME_DIST >0
FORMULA = CURRENT ROW NO (OR ROW NO WITH VALUE SAME AS CURRENT ROW) / TOTAL NO OF ROW
*/
-- Query to fetch all products which are constituting the first 30% of the data in product table based on price.

-- Calculate cumulative distribution of product prices and select products with a cumulative distribution percentage less than or equal to 30%.
WITH CUME_DIST_PRODUCT AS (
    SELECT *,
           CUME_DIST() OVER (ORDER BY price DESC) AS cume_distribution,
           ROUND(CUME_DIST() OVER (ORDER BY price DESC)::NUMERIC * 100, 2) AS cume_dist_percentage
    FROM product
)

SELECT product_name, cume_dist_percentage || '%' AS cume_dist_percentage
FROM CUME_DIST_PRODUCT
WHERE cume_dist_percentage <= 30;

-----------------
-- PERCENT_RANK |   [RELATIVE RANK OF THE CURRENT ROW /PERCENTAGE RANKING];
-----------------
/*
VALUE --> 1  <= PERCENT_RANK >0
FORMULA =  CURRENT ROW NO -1 / TOTAL NO OF ROWS -1
*/
--  Query to identify how much percentage more expensive is 'Samsung Galaxy Book Pro' when compared to all products.
-- Calculate the percentage rank of product prices and select information for the product 'Samsung Galaxy Book Pro'.
WITH PERCENT_RANK_Product AS (
    SELECT *,
           PERCENT_RANK() OVER (ORDER BY price) AS percentage_rank,
           ROUND(PERCENT_RANK() OVER (ORDER BY price)::NUMERIC * 100, 2) AS per_rank
    FROM product
)
SELECT *,
       per_rank ||'%' AS per_rank_pct
FROM PERCENT_RANK_Product
WHERE product_name = 'Samsung Galaxy Book Pro';

-- Done
