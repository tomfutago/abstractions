{{
  config(
    schema = 'eas_optimism',
    alias = 'attestation_details',
    materialized = 'incremental',
    file_format = 'delta',
    incremental_strategy = 'merge',
    unique_key = ['schema_uid', 'ordinality_id', 'attestation_uid'],
    incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
  )
}}

{{
  eas_attestation_details(
    blockchain = 'optimism',
    project = 'eas',
    version = '1'
  )
}}