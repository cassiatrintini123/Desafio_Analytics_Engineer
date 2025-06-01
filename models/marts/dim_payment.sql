with
    dim_payment as (
        select *
        from {{ ref('int_payment') }}
    )

select *
from dim_payment