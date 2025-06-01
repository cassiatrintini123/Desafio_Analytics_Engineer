with
    source_SALESORDERHEADER as (
        select *
        from {{ source('erp', 'SALESORDERHEADER') }}
    )

    , renomeado as (
        select
            cast (SALESORDERID as int) as pk_SALESORDERID
            , cast (CREDITCARDID as int) as fk_CREDITCARDID
            , cast (CUSTOMERID as int) as fk_CUSTOMERID
            , cast (SHIPTOADDRESSID as int) as fk_SHIPTOADDRESSID
            , cast (TERRITORYID as int) as fk_TERRITORYID
            , cast (STATUS as int) as STATUS
            , cast (ORDERDATE as string) as ORDERDATE
            , cast (DUEDATE as string) as DUEDATE
            , cast (SHIPDATE as string) as SHIPDATE
            , cast (FREIGHT as real) as FREIGHT
        from source_SALESORDERHEADER
    )

    select *
    from renomeado