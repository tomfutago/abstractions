{{
  config(
    schema = 'eas_polygon',
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
    blockchain = 'polygon',
    project = 'eas',
    version = '1'
  )
}}