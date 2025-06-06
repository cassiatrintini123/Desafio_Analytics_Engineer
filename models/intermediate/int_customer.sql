with 
    CUSTOMER as (
        select *
        from {{ ref('stg_erp__CUSTOMER')}}
    )

select * 
from CUSTOMER

