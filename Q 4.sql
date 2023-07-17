Q 4 What is the top-selling product category based on the total revenue 
generated?


with CTE as
(select category,sum(quantity*price) as total_revenue
from transactions t
join sustainable_clothing s on t.product_id = s.product_id
group by 1
order by total_revenue desc)

select * 
from CTE
where total_revenue in(select max(total_revenue)from CTE);
