with
    dim_product as (
        select *
        from {{ ref('stg_erp__PRODUCT') }}
    )

select *
from dim_product