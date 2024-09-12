{{ config(materialized='table')
}}

select dbt_scd_id as Technical_key,PartnerID,Name,Canton,cast(dbt_valid_from as date) as Date_from,
Case when dbt_valid_to is null then cast('9999-12-31' as date) else date_sub(cast(dbt_valid_to as date),interval 1 day) end as Date_to,
case when dbt_valid_to is null then 'Yes' else 'No' end as is_valid from {{ref('Partner_snapshot')}}
