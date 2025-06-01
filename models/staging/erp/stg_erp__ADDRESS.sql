with
    source_ADDRESS as (
        select *
        from {{ source('erp', 'ADDRESS') }}
    )

    , renomeado as (
        select
            cast (ADDRESSID as string) as pk_ADDRESSID
            , cast (CITY as string) as CITY_NAME
            , cast (STATEPROVINCEID as int) as fk_STATEPROVINCEID
            , cast (POSTALCODE as string) as POSTALCODE
        from source_ADDRESS
    )

    select *
    from renomeado