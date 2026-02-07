select 
    s.date_date,
    s.orders_id,
    s.products_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
    ROUND(s.revenue - s.quantity*p.purchase_price, 2) AS margin
from {{ref("stg_raw__sales")}} as s
LEFT JOIN {{ref("stg_raw__product")}} as p
using (products_id)