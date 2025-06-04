with
    dim_reasons as (
        select *
        from {{ ref('int_reasons') }}
    )

select *
from dim_reasons