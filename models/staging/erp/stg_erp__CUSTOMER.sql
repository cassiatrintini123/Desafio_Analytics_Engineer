with
    source_CUSTOMER as (
        select *
        from {{ source('erp', 'CUSTOMER') }}
    )

    , renomeado as (
        select
            cast (CUSTOMERID as int) as pk_CUSTOMERID
            , cast (PERSONID as int) as PERSONID
            , cast (TERRITORYID as int) as fk_TERRITORYID_CUSTOMER
        from source_CUSTOMER
    )

    select *
    from renomeado