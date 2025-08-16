-- (2) Dimension exploration

-- explore all countries of customers come from

select distinct country
from [gold.dim_customers]

--explore all categories "the major devision"

select distinct 
	category,
	subcategory,
	product_name
from [gold.dim_products]
order by
	category,
	subcategory,
	product_name