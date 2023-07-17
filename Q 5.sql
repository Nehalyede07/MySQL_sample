select product_name,sum(quantity) AS total_revenue
from transactions t 
join sustainable_clothing s on t.product_id = s.Product_ID
group by Product_name
having total_revenue > (select avg(quantity) from transactions)
order by total_revenue desc;