{{
  config(
    schema = 'moola_celo',
    alias = 'borrow',
    materialized = 'view',
    post_hook = '{{ expose_spells(\'["celo"]\',
                                    "project",
                                    "moola",
                                    \'["tomfutago"]\') }}'
  )
}}

select
  blockchain,
  project,
  version,
  transaction_type,
  loan_type,
  symbol,
  token_address,
  borrower,
  repayer,
  liquidator,
  amount,
  usd_amount,
  evt_tx_hash,
  evt_index,
  evt_block_month,
  evt_block_time,
  evt_block_number
from {{ ref('lending_borrow') }}
where blockchain = 'celo'
  and project = 'moola'