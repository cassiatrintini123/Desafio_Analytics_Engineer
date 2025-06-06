with 
    SALESORDERDETAIL as (
        select *
        from {{ ref('stg_erp__SALESORDERDETAIL')}}
    )

    , SALESORDERHEADER as (
        select *
        from {{ ref('stg_erp__SALESORDERHEADER')}}
    )

    , joined as (
        select 
            SALESORDERDETAIL.PK_SALESORDERDETAILID
            , SALESORDERDETAIL.FK_SALESORDERID
            , SALESORDERDETAIL.PRODUCTID
            , SALESORDERDETAIL.ORDER_QUANTITY
            , SALESORDERDETAIL.UNITPRICE
            , SALESORDERDETAIL.UNITPRICEDISCOUNT
            , SALESORDERHEADER.PK_SALESORDERID
            , SALESORDERHEADER.FK_CREDITCARDID
            , SALESORDERHEADER.FK_CUSTOMERID
            , SALESORDERHEADER.FK_SHIPTOADDRESSID
            , SALESORDERHEADER.FK_TERRITORYID_SALESORDERHEADER
            , SALESORDERHEADER.STATUS
            , SALESORDERHEADER.ORDERDATE
            , SALESORDERHEADER.DUEDATE
            , SALESORDERHEADER.SHIPDATE
            , SALESORDERHEADER.FREIGHT
        from SALESORDERDETAIL
        left join SALESORDERHEADER on SALESORDERDETAIL.FK_SALESORDERID = SALESORDERHEADER.PK_SALESORDERID
    ) 

    , metrics as (
        select 
            PK_SALESORDERDETAILID
            , FK_SALESORDERID
            , PRODUCTID
            , ORDER_QUANTITY
            , UNITPRICE
            , UNITPRICEDISCOUNT
            , ORDER_QUANTITY*UNITPRICE as NEGOTIATED_PRICE
            , PK_SALESORDERID
            , FK_CREDITCARDID
            , FK_CUSTOMERID
            , FK_SHIPTOADDRESSID
            , FK_TERRITORYID_SALESORDERHEADER
            , STATUS
            , case 
                when STATUS like 1 then 'In process'
                when STATUS like 2 then 'In Approved'
                when STATUS like 3 then 'Backordered'
                when STATUS like 4 then 'Rejected' 
                when STATUS like 5 then 'Shipped'
                when STATUS like 6 then 'Cancelled' 
            end as STATUS_DESCRIPTION
            , ORDERDATE
            , DUEDATE
            , SHIPDATE
            , FREIGHT
        from joined
    )

select *
from metrics


