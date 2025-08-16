--dimension or measure
--measure can be aggregate <- (sum/avg/...) <- numeric
--dimensions need to group the data
-------------------------------------------------------------
-------------------------------------------------------------
--(1) exploration of database
select *
from information_schema.tables

--explore all column in the database
select *
from information_schema.columns

select *
from information_schema.columns
where TABLE_NAME = 'gold.dim_customers'

