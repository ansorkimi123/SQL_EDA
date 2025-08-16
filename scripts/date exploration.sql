-- (3) date exploration

--find first and last order
--how many years of sales are available

select 
	min(order_date) first_order_date,
	max(order_date) last_order_date,
	datediff(year, min(order_date), max(order_date)) as order_year_range,
	datediff(month, min(order_date), max(order_date)) as order_month_range
from [gold.fact_sales]

select
	min(birthdate) as oldest_birthdate,
	max(birthdate) as youngest_birthdate,
	datediff(year,min(birthdate), getdate()) as oldest_customer,
	datediff(year,max(birthdate), getdate()) as youngest_customer
from [gold.dim_customers]

