select
  cast(order_id as int)   as order_id,
  sum(cast(amount as decimal(18,2))) as amount_total
from {{ ref('raw_payments') }}
group by 1