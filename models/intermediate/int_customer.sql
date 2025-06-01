with 
    CUSTOMER as (
        select *
        from {{ ref('stg_erp__CUSTOMER')}}
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
            , SALESORDERHEADER.fk_TERRITORYID_SALESORDERHEADER
            , SALESORDERHEADER.STATUS
            , SALESORDERHEADER.ORDERDATE
            , SALESORDERHEADER.DUEDATE
            , SALESORDERHEADER.SHIPDATE
            , SALESORDERHEADER.FREIGHT
            , CUSTOMER.PK_CUSTOMERID
            , CUSTOMER.PERSONID
            , CUSTOMER.fk_TERRITORYID_CUSTOMER

        from SALESORDERHEADER
        left join CUSTOMER on SALESORDERHEADER.fk_CUSTOMERID = CUSTOMER.pk_CUSTOMERID
    )

select * 
from joined

