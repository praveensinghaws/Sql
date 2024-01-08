show tables;
SELECT * , 1 AS dim_customer from dim_customer limit 1;
SELECT *, 1 AS dim_product from dim_product limit 1;
SELECT *, 1 AS fact_forecast_monthly from fact_forecast_monthly limit 1;
SELECT *, 1 AS fact_freight_cost from fact_freight_cost limit 1;
SELECT *, 1 AS fact_gross_price from fact_gross_price limit 1;
SELECT *, 1 AS fact_manufacturing_cost from fact_manufacturing_cost limit 1;
SELECT *,1 AS fact_post_invoice_deductions from fact_post_invoice_deductions limit 1;
SELECT *, 1 AS fact_pre_invoice_deductions from fact_pre_invoice_deductions limit 1;
SELECT *, 1 AS fact_sales_monthly from fact_sales_monthly limit 1;


