/* 9.  Which channel helped to bring more gross sales in the fiscal year 2021 
and the percentage of contribution?  The final output  contains these fields, 
channel 
gross_sales_mln 
percentage 
*/

WITH temp_table AS
(
    SELECT c.channel,
		   g.gross_price,
		   s.sold_quantity,
           round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sales_mln
	FROM fact_sales_monthly s
	join fact_gross_price g 
		on s.fiscal_year = g.fiscal_year 
		and s.product_code = g.product_code
	join dim_customer c
		on c.customer_code=s.customer_code
	WHERE s.fiscal_year=2021 
	GROUP BY channel
)
SELECT channel,
	gross_sales_mln,
       ROUND(gross_sales_mln*100/SUM(gross_sales_mln) OVER(),2) AS percentage
FROM temp_table;