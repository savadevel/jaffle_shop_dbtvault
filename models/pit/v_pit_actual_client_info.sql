{{
    config(
        enabled=true,
        materialized='view'
    )
}}

{%- set yaml_metadata -%}
source_model: hub_customer
src_pk: customer_pk
as_of_dates_table: as_of_date
satellites:
  sat_customer_details:
    pk:
      PK: customer_pk
    ldts:
      LDTS: load_date
  sat_customer_crm_details:
    pk:
      PK: customer_pk
    ldts:
      LDTS: load_date
stage_tables_ldts:
  v_stg_customers_crm: load_date
  v_stg_customers: load_date
  v_stg_orders: load_date
src_ldts: load_date
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}
{% set src_pk = metadata_dict['src_pk'] %}
{% set as_of_dates_table = metadata_dict['as_of_dates_table'] %}
{% set satellites = metadata_dict['satellites'] %}
{% set stage_tables_ldts = metadata_dict['stage_tables_ldts'] %}
{% set src_ldts = metadata_dict['src_ldts'] %}

{{ automate_dv.pit(source_model=source_model, src_pk=src_pk,
                   as_of_dates_table=as_of_dates_table,
                   satellites=satellites,
                   stage_tables_ldts=stage_tables_ldts,
                   src_ldts=src_ldts) }}