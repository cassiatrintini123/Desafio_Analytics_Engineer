with 
    CREDITCARD as (
        select *
        from {{ ref('stg_erp__CREDITCARD')}}
    )

    , SALESORDERHEADER as (
        select *
        from {{ ref('stg_erp__SALESORDERHEADER')}}
    )

    , joined as (
        select 
            SALESORDERHEADER.PK_SALESORDERID
            , SALESORDERHEADER.FK_CREDITCARDID
            , SALESORDERHEADER.FK_CUSTOMERID
            , SALESORDERHEADER.FK_SHIPTOADDRESSID
            , SALESORDERHEADER.FK_TERRITORYID_SALESORDERHEADER
            , SALESORDERHEADER.STATUS
            , SALESORDERHEADER.ORDERDATE
            , SALESORDERHEADER.DUEDATE
            , SALESORDERHEADER.SHIPDATE
            , SALESORDERHEADER.FREIGHT
            , CREDITCARD.PK_CREDITCARDID
            , CREDITCARD.CARDTYPE
        from SALESORDERHEADER
        left join CREDITCARD on SALESORDERHEADER.fk_CREDITCARDID = CREDITCARD.pk_CREDITCARDID
    )

select * 
from joined

