/* 4.  Follow-up: Which segment had the most increase in unique products in 
2021 vs 2020? The final output contains these fields, 
segment 
product_count_2020 
product_count_2021 
difference 
*/

WITH unique_product_count_2020 AS 
(
	SELECT segment,
		   COUNT(DISTINCT(product_code)) AS product_count_2020
	FROM dim_product
	JOIN fact_sales_monthly 
		USING (product_code)
	WHERE fiscal_year ="2020"
	GROUP BY segment
),
unique_product_count_2021 AS (
	SELECT segment,
		   COUNT(DISTINCT(product_code)) AS product_count_2021
	FROM dim_product
	JOIN fact_sales_monthly 
		USING (product_code)
	WHERE fiscal_year ="2021"
	GROUP BY segment)
SELECT segment,
	product_count_2020,
        product_count_2021,
       (product_count_2021-product_count_2020) AS difference
FROM unique_product_count_2020
JOIN unique_product_count_2021
	USING (segment)
ORDER BY difference DESC;