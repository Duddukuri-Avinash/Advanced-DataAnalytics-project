select
year(order_date) AS order_year,
month(order_date) AS order_month,
sum(sales_amount) AS total_sales,
count(distinct customer_key) AS total_customers,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date IS NOT NULL
group by year(order_date),month(order_date)
order by year(order_date),month(order_date)

select
DATETRUNC(month,order_date) as order_date,
sum(sales_amount) AS total_sales,
count(distinct customer_key) AS total_customers,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date IS NOT NULL
group by DATETRUNC(month,order_date) 
order by DATETRUNC(month,order_date) 
