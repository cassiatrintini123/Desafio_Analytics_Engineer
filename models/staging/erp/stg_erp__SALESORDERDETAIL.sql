with
    source_SALESORDERDETAIL as (
        select *
        from {{ source('erp','SALESORDERDETAIL') }}
    )

    , renomeado as (
        select
            cast (SALESORDERDETAILID as int) as pk_SALESORDERDETAILID
            , cast (SALESORDERID as int) as fk_SALESORDERID
            , cast (CARRIERTRACKINGNUMBER as string) as CARRIERTRACKINGNUMBER
            , cast (ORDERQTY as int) as ORDER_QUANTITY
            , cast (PRODUCTID as int) as PRODUCTID
            , cast (SPECIALOFFERID as int) as SPECIALOFFERID
            , cast (UNITPRICE as real) as UNITPRICE
            , cast (UNITPRICEDISCOUNT as real) as UNITPRICEDISCOUNT
            , cast (ROWGUID as string) as ROWGUID
            , cast (MODIFIEDDATE  as string) as MODIFIEDDATE
        from source_SALESORDERDETAIL
    )

    select *
    from renomeado