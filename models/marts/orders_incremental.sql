{{ config(materialized='incremental', unique_key='order_id', incremental_strategy='merge') }}

select *
from {{ ref('stg_orders') }}
{% if is_incremental() %}
  where order_date > (select coalesce(max(order_date), '1900-01-01') from {{ this }})
{% endif %}