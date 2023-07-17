#Q.1 How many transactions were completed during each marketing campaign?

select campaign_name,count(transaction_id) as no_of_transaction
from transactions
Inner join marketing_campaigns on transactions.purchase_date between start_date and end_date
     and transactions.product_id = marketing_campaigns.product_id
     group by campaign_name;
