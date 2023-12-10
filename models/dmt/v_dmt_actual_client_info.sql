{{
    config(
        enabled=true,
        materialized='view'
    )
}}

select
    hc.customer_pk,
    pit.as_of_date,
    scd.first_name,
    scd.last_name,
    scd.email,
    sccd.country,
    sccd.age
from
    {{ ref('hub_customer')}} hc
    inner join {{ ref('v_pit_actual_client_info')}} pit
    on hc.customer_pk=pit.customer_pk
    left join {{ ref('sat_customer_details')}} scd
    on scd.customer_pk=pit.sat_customer_details_pk and scd.load_date=pit.sat_customer_details_ldts
    left join {{ ref('sat_customer_crm_details')}} sccd
    on sccd.customer_pk=pit.sat_customer_crm_details_pk and sccd.load_date=pit.sat_customer_crm_details_ldts

