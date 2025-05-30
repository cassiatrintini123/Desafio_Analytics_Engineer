with
    source_ADDRESS as (
        select *
        from {{ source('erp', 'ADDRESS') }}
    )

    , renomeado as (
        select
            cast (ADDRESSID as string) as ADDRESSID
            , cast (ADDRESSLINE1 as string) as ADDRESSLINE1
            , cast (ADDRESSLINE2 as string) as ADDRESSLINE2
            , cast (CITY as string) as CITY_NAME
            , cast (STATEPROVINCEID as int) as STATEPROVINCEID
            , cast (POSTALCODE as string) as POSTALCODE
            , cast (SPATIALLOCATION as string) as SPATIALLOCATION
            , cast (ROWGUID as string) as ROWGUID
            , cast (MODIFIEDDATE as string) as MODIFIEDDATE
        from source_ADDRESS
    )

    select *
    from renomeado