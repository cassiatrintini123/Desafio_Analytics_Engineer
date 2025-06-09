with
    source_CUSTOMER as (
        select *
        from {{ source('erp', 'CUSTOMER') }}
    )

    , renomeado as (
        select
            cast (CUSTOMERID as int) as PK_CUSTOMERID
            , cast (PERSONID as int) as PERSONID
            , cast (STOREID as int) as STOREID
            , cast (TERRITORYID as int) as FK_TERRITORYID_CUSTOMER
        from source_CUSTOMER
    )

    select *
    from renomeado