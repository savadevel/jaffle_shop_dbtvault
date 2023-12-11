{{
    config(
        enabled=true,
        materialized='view'
    )
}}

select
    hc.customer_pk,
    scd.first_name,
    scd.last_name,
    scd.email,
    pit.as_of_date as actual_on,
    scd.load_date
from
    {{ ref('hub_customer')}} hc
    inner join {{ ref('v_pit_actual_client_info')}} pit
    on hc.customer_pk=pit.customer_pk
    left join {{ ref('sat_customer_details')}} scd
    on scd.customer_pk=pit.sat_customer_details_pk and scd.load_date=pit.sat_customer_details_ldts
where scd.customer_pk is not null