-- Data Analyst -> Analyzing data to identify patterns, trends, anomalies and making informed decisions about business

-- Pivoting -› Important for analyzing data across different categories ... It is helpful in comparing different categories
-- It makes data more readable ~

/*
Use Cases
---------

1) Marketing Campaign: To identify different channels like email, social media, SMS performance
2) Sales: Evaluate sales across different regions
3) Department: Analyze performance of employees of different departments
*/
-- Creating Table;
CREATE TABLE financial_data (
    investor_name VARCHAR(255),
    investment_year INT,
    investment_type VARCHAR(255),
    investment_amount DECIMAL(10, 2)
);
-- Scenario: Analyzing Data across years and investment types

/* Query */
SELECT 
    investment_type,
    ROUND(SUM(CASE WHEN investment_year = 2018 THEN investment_amount ELSE NULL END), 2) AS '2018_statement',
    ROUND(SUM(CASE WHEN investment_year = 2019 THEN investment_amount ELSE NULL END), 2) AS '2019_statement',
    ROUND(SUM(CASE WHEN investment_year = 2020 THEN investment_amount ELSE NULL END), 2) AS '2020_statement',
    ROUND(SUM(CASE WHEN investment_year = 2021 THEN investment_amount ELSE NULL END), 2) AS '2021_statement',
    ROUND(SUM(CASE WHEN investment_year = 2022 THEN investment_amount ELSE NULL END), 2) AS '2022_statement'
FROM 
    financial_data fa
GROUP BY 
    investment_type;

