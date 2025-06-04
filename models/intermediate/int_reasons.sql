with 
    SALESREASON as (
        select *
        from {{ ref('stg_erp__SALESREASON')}}
    )

    , SALESORDERHEADERSALESREASON as (
        select *
        from {{ ref('stg_erp__SALESORDERHEADERSALESREASON')}}
    )

    , joined as (
        select 
            SALESORDERHEADERSALESREASON.PK_SALESORDERID
            , SALESORDERHEADERSALESREASON.FK_SALESREASONID
            , SALESREASON.PK_SALESREASONID
            , SALESREASON.SALESREASON_NAME
            , SALESREASON.REASONTYPE_NAME
        from SALESORDERHEADERSALESREASON
        left join SALESREASON on SALESORDERHEADERSALESREASON.FK_SALESREASONID = SALESREASON.PK_SALESREASONID
    )

select * 
from joined

