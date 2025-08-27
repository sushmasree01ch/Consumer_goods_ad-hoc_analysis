/* 6.  Generate a report which contains the top 5 customers who received an 
average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
Indian  market. The final output contains these fields, 
customer_code 
customer 
average_discount_percentage 
*/

SELECT customer_code,
       customer,
       ROUND(AVG(pre_invoice_discount_pct),4) AS avg_discount_pct 
FROM dim_customer
JOIN fact_pre_invoice_deductions
	USING (customer_code)
WHERE market="india" AND fiscal_year="2021"
GROUP BY customer_code,customer
ORDER BY avg_discount_pct DESC

LIMIT 5;
