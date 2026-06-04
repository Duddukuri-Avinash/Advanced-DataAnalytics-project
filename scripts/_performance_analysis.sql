/* Analyse yearly performance of products by comparing each product's sales to both 
its average sales performance and the previous year's sales*/
WITH yearly_product_sales AS
(
SELECT 
YEAR(f.order_date) as order_year,
p.product_name,
SUM(f.sales_amount) as current_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_product p
ON f.product_key=p.product_key
WHERE order_date IS NOT NULL
GROUP BY 
YEAR(f.order_date),
p.product_name
)

select 
order_year,
product_name,
current_sales,
AVG(current_sales) OVER (PARTITION BY product_name) avg_sales,
current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
CASE 
    WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name)>0 THEN 'Above Avg'
    WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name)<0 THEN 'Below Avg'
    ELSE 'Avg'
END as avg_change,
-- Year over Year analysis
LAG(current_sales) OVER ( PARTITION BY product_name order by order_year) py_sales,
CASE 
    WHEN current_sales - LAG(current_sales) OVER ( PARTITION BY product_name order by order_year)>0 THEN 'Increasing'
    WHEN current_sales - LAG(current_sales) OVER ( PARTITION BY product_name order by order_year)<0 THEN 'Decreasing'
    ELSE 'No_Change'
END as py_change
FROM yearly_product_sales
order by product_name,order_year