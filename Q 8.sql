with CTE as
(SELECT AVG(quantity) as avg_qty_during_campaign
FROM transactions t
JOIN sustainable_clothing s on t.product_id=s.product_id
JOIN marketing_campaigns m on t.purchase_date between m.start_date and end_date
and t.product_id=m.product_id),

CTE2 as
(SELECT AVG(quantity) as total_avg_qty
FROM transactions t
JOIN sustainable_clothing s on t.product_id=s.product_id)

SELECT total_avg_qty,avg_qty_during_campaign,
total_avg_qty-avg_qty_during_campaign as avg_qty_outside_campaign
from CTE,CTE2;