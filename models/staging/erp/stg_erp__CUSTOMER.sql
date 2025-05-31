with
    source_CUSTOMER as (
        select *
        from {{ source('erp', 'CUSTOMER') }}
    )

    , renomeado as (
        select
            cast (CUSTOMERID as int) as pk_CUSTOMERID
            , cast (PERSONID as int) as PERSONID
            , cast (STOREID as int) as STOREID
            , cast (TERRITORYID as int) as fk_TERRITORYID
            , cast (ROWGUID as string) as ROWGUID
            , cast (MODIFIEDDATE as string) as MODIFIEDDATE
        from source_CUSTOMER
    )

    select *
    from renomeado