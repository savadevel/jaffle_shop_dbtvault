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
    scd.effective_from,
    coalesce(lead(scd.effective_from)
        over (partition by scd.customer_pk order by scd.effective_from),
        to_timestamp('9999-12-31', 'YYYY-MM-DD')::timestamp without time zone at time zone 'Etc/UTC') as effective_to
from
    {{ ref('hub_customer') }} as hc
    left join {{ ref('sat_customer_details') }} as scd
    on hc.customer_pk = scd.customer_pk