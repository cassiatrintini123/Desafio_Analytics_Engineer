with 
    PRODUCT as (
        select *
        from {{ ref('stg_erp__PRODUCT')}}
    )

select * 
from PRODUCT

