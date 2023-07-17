select 
		campaign_name,sum(quantity*price) as total_revenue
from transactions t
join sustainable_clothing s on t.product_id = s.Product_id
join marketing_campaigns m on t.purchase_date between m.start_date and end_date
	and t.product_id=m.product_id
    
group by campaign_name;