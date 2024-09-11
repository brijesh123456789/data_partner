{% snapshot Partner_snapshot %}

{{
    config(
      target_database='dogwood-reality-336517',
      target_schema='dbt_cloud',
      Unique_key='PartnerID',
      strategy='check',
      check_cols= ['PartnerID','Canton','Name']
    )
}}

select * from {{ ref('partner_input') }}

{% endsnapshot %}