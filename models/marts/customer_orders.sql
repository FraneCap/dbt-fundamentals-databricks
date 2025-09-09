{{ config(materialized='table', contract=true, access='public') }}

select
  c.customer_id,
  c.first_name,
  c.last_name,
  count(o.order_id)              as orders_count,
  coalesce(p.amount_total, 0.0)  as last_order_amount
from {{ ref('stg_customers') }} c
left join {{ ref('stg_orders') }} o
  on o.customer_id = c.customer_id
left join {{ ref('stg_payments') }} p
  on p.order_id = o.order_id
group by 1,2,3,5
order by 1