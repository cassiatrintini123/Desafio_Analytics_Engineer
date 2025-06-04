with
    fct_sales as (
        select *
        from {{ ref('int_sales') }}
    )

select *
from fct_sales