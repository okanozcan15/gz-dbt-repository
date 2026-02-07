SELECT
    date_date,
	COUNT(DISTINCT orders_id) AS nb_transactions,
    --ROUND(SUM(revenue),0) AS sum_revenue,
    ROUND (SUM(revenue),0) AS revenue,
    ROUND (SUM(operational_margin),0) AS operational_margin,
    ROUND (SUM(purchase_cost),0) AS purchase_cost,
    ROUND (SUM(shipping_fee),0) AS shipping_fee,
    ROUND (SUM(log_cost),0) AS log_cost,
    ROUND (SUM(quantity),0) AS quantity,
    (max(revenue)/NULLIF(count(DISTINCT orders_id),0)) as avegare_basket
from {{ref("int_orders_operational")}}
GROUP BY date_date
