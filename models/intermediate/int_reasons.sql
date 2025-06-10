with 
    SALESREASON as (
        select *
        from {{ ref('stg_erp__SALESREASON') }}
    )

    , SALESORDERHEADERSALESREASON as (
        select *
        from {{ ref('stg_erp__SALESORDERHEADERSALESREASON') }}
    )

    , joined as (
        select 
            SALESORDERHEADERSALESREASON.PK_SALESORDERID
            , SALESREASON.SALESREASON_NAME
            , SALESREASON.REASONTYPE_NAME
        from SALESORDERHEADERSALESREASON
        left join SALESREASON on SALESORDERHEADERSALESREASON.FK_SALESREASONID = SALESREASON.PK_SALESREASONID
        where SALESREASON.PK_SALESREASONID between 1 and 6
    )

select 
    PK_SALESORDERID
    , LISTAGG(distinct SALESREASON_NAME, ', ') within group (order by SALESREASON_NAME) as SALESREASON_NAMES
    , LISTAGG(distinct REASONTYPE_NAME, ', ') within group (order by REASONTYPE_NAME) as REASONTYPE_NAMES
from joined
group by PK_SALESORDERID

