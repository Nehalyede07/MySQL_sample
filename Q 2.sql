Q 2. Which product had the highest sales quantity?

with CTE as
(select transactions.product_id,product_name,sum(quantity) as total_quantity_sold
from transactions
join sustainable_clothing on transactions.product_id = sustainable_clothing.product_id
group by 1,2
order by total_quantity_sold desc)

select *
from CTE
where total_quantity_sold in(select max(total_quantity_sold) from CTE);
