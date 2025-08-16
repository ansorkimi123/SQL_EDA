-- (4) measures exploration

--find the total sales

select 
	sum(sales_amount) as total_sales
from [gold.fact_sales]

--find how many items are sold

select 
	sum(quantity) as total_item_sold
from [gold.fact_sales]

--find the average selling price

select 
	avg(price) as average_selling_price
from [gold.fact_sales]

--find the total number of orders

select 
	count(order_number) as total_order,
	count(distinct order_number) as total_order_made
from [gold.fact_sales]

--find total number of products

select 
	count(distinct product_number) as total_products
from [gold.dim_products] 

--find the total number of customers

select  
	count(customer_key) as total_customers
from [gold.dim_customers]

--find the total number of customers that has placed an order

select 
	count(distinct c.customer_number) as total_customer_placed_order
from [gold.dim_customers] as c
left join [gold.fact_sales] as s
on c.customer_key = s.customer_key

------------------------------------------------------------------
--generate a report that shows all key metrics of the business
------------------------------------------------------------------

select 
	'total sales' as measure_name,
	sum(sales_amount) as measure_value 
from [gold.fact_sales]
union all
select 
	'total_item_sold' as measure_name,
	sum(quantity) as measure_value
from [gold.fact_sales]
union all
select 
	'average_selling_price' as measure_name,
	avg(price) as measure_value
from [gold.fact_sales]
union all
select 
	'total_order_made' as measure_name,
	count(distinct order_number) as measure_value
from [gold.fact_sales]
union all
select 
	'total_products' as measure_name,
	count(distinct product_number) as measure_value 
from [gold.dim_products] 
union all
select  
	'total_customers' as measure_name,
	count(customer_key) as mesure_value
from [gold.dim_customers]
union all
select 
	'total_customer_placed_order' as measure_name,
	count(distinct c.customer_number) as measure_value
from [gold.dim_customers] as c
left join [gold.fact_sales] as s
on c.customer_key = s.customer_key