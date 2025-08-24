select
  cast(id as int)        as order_id,
  cast(user_id as int)   as customer_id,
  cast(order_date as date) as order_date,
  status
from {{ ref('raw_orders') }}