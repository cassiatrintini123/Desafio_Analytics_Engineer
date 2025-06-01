with
    source_SALESORDERDETAIL as (
        select *
        from {{ source('erp','SALESORDERDETAIL') }}
    )

    , renomeado as (
        select
            cast (SALESORDERDETAILID as int) as pk_SALESORDERDETAILID
            , cast (SALESORDERID as int) as fk_SALESORDERID
            , cast (PRODUCTID as int) as PRODUCTID
            , cast (ORDERQTY as int) as ORDER_QUANTITY
            , cast (UNITPRICE as real) as UNITPRICE
            , cast (UNITPRICEDISCOUNT as real) as UNITPRICEDISCOUNT
        from source_SALESORDERDETAIL
    )

    select *
    from renomeado