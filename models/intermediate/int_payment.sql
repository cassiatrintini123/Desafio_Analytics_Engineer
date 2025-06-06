with 
    CREDITCARD as (
        select *
        from {{ ref('stg_erp__CREDITCARD')}}
    )

select *
from CREDITCARD