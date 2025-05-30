with
    source_SALESORDERHEADER as (
        select *
        from {{ source('erp', 'SALESORDERHEADER') }}
    )

    , renomeado as (
        select
            cast (SALESORDERID as int) as SALESORDERID
            , cast (REVISIONNUMBER as int) as REVISIONNUMBER
            , cast (ORDERDATE as string) as ORDERDATE
            , cast (DUEDATE as string) as DUEDATE
            , cast (SHIPDATE as string) as SHIPDATE
            , cast (STATUS as int) as STATUS
            , cast (ONLINEORDERFLAG as string) as ONLINEORDERFLAG
            , cast (CUSTOMERID as int) as CUSTOMERID
            , cast (TERRITORYID as int) as TERRITORYID
            , cast (BILLTOADDRESSID as int) as BILLTOADDRESSID
            , cast (SHIPTOADDRESSID as int) as SHIPTOADDRESSID
            , cast (SHIPMETHODID as int) as SHIPMETHODID
            , cast (CREDITCARDID as int) as CREDITCARDID
            , cast (CREDITCARDAPPROVALCODE as string) as CREDITCARDAPPROVALCODE
            , cast (SUBTOTAL as real) as SUBTOTAL
            , cast (TAXAMT as real) as TAXAMT
            , cast (FREIGHT as real) as FREIGHT
            , cast (TOTALDUE as real) as TOTALDUE
            , cast (ROWGUID as string) as ROWGUID
            , cast (MODIFIEDDATE as string) as MODIFIEDDATE
        from source_SALESORDERHEADER
    )

    select *
    from renomeado