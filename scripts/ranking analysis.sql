-- (6) ranking analysis

--which 5 products generate the highest revenue?
select top 5
	p.product_name,
	sum(s.sales_amount) as total_revenue
from [gold.fact_sales] as s
left join [gold.dim_products] as p
on s.product_key = p.product_key
group by p.product_name
order by total_revenue desc

--what are the 5 worst-performing products in term of sales?
select  top 5
	p.product_name,
	sum(s.sales_amount) as total_revenue
from [gold.fact_sales] as s
left join [gold.dim_products] as p
on s.product_key = p.product_key
group by p.product_name
order by total_revenue asc

--find the top 10 customers who have generated the highest revenue
select top 10
	c.customer_key,
	c.first_name,
	c.last_name,
	sum(s.sales_amount) as total_revenue
from [gold.fact_sales] as s
left join [gold.dim_customers] as c
on s.customer_key = c.customer_key
group by 
	c.customer_key,
	c.first_name,
	c.last_name
order by total_revenue desc

--the 3 customers with the fewest orders placed
select top 3
	c.customer_key,
	c.first_name,
	c.last_name,
	count(distinct order_number) as total_orders
from [gold.fact_sales] as s
left join [gold.dim_customers] as c
on s.customer_key = c.customer_key
group by 
	c.customer_key,
	c.first_name,
	c.last_name
order by total_orders asc