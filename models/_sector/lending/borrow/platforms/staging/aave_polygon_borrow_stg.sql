{{
  config(
    schema = 'aave_polygon',
    alias = 'borrow_stg',
    materialized = 'view'
  )
}}

{%
  set models = [
    ref('aave_v2_polygon_borrow_stg'),
    ref('aave_v3_polygon_borrow_stg')
  ]
%}

{% for model in models %}
select
  blockchain,
  project,
  version,
  transaction_type,
  loan_type,
  token_address,
  borrower,
  repayer,
  liquidator,
  amount,
  evt_tx_hash,
  evt_index,
  evt_block_month,
  evt_block_time,
  evt_block_number
from {{ model }}
{% if not loop.last %}
union all
{% endif %}
{% endfor %}