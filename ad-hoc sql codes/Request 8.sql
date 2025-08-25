/* 8.  In which quarter of 2020, got the maximum total_sold_quantity? The final 
output contains these fields sorted by the total_sold_quantity, 
Quarter 
total_sold_quantity 
*/

WITH quarters AS 
(SELECT *, 
	CASE 
        WHEN month(date) IN (9,10,11) THEN "Q1"
		WHEN month(date) IN (12,1,2) THEN  "Q2"
		WHEN month(date) IN (3,4,5) THEN  "Q3"
		WHEN month(date) IN (6,7,8) THEN  "Q4" 
    END AS "Quarter"
FROM fact_sales_monthly)
SELECT Quarter,SUM(sold_quantity) AS total_sold_quantity 
FROM quarters
WHERE fiscal_year="2020"
GROUP BY quarter
ORDER BY total_sold_quantity DESC;