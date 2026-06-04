-- Calculate total sales per month
-- and running total of sales over time
SELECT 
order_date,
total_sales,
sum(total_sales) over(order by order_date) as running_total
from(
select 
DATETRUNC(month,order_date) AS order_date,
SUM(sales_amount) AS total_sales
from gold.fact_sales
where order_date IS NOT NULL
group by DATETRUNC(month,order_date)
) t
SELECT 
order_date,
total_sales,
sum(total_sales) over(order by order_date) as running_total,
AVG(avg_price) over(order by order_date) as moving_average
from(
select 
DATETRUNC(month,order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) as avg_price
from gold.fact_sales
where order_date IS NOT NULL
group by DATETRUNC(month,order_date)
) t