{{
    config(
        enabled=true,
        materialized='table'
    )
}}

select t.order_week, t.status, count(*) as count
from
    (
        select {{ dbt_date.iso_week_start('order_date') }} as order_week, status
        from {{ ref('sat_order_details') }}) t
group by t.order_week, t.status
order by t.order_week desc