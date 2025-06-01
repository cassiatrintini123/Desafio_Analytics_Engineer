with
    source_STATEPROVINCE as (
        select *
        from {{ source('erp', 'STATEPROVINCE') }}
    )

    , renomeado as (
        select
            cast (STATEPROVINCEID as int) as pk_STATEPROVINCEID
            , cast (TERRITORYID as int) as fk_TERRITORYID_STATEPROVINCE
            , cast (STATEPROVINCECODE as string) as fk_STATEPROVINCECODE
            , cast (COUNTRYREGIONCODE as string) as fk_COUNTRYREGIONCODE_STATEPROVINCE
            , cast (NAME as string) as PROVINCE_NAME
        from source_STATEPROVINCE
    )

    select *
    from renomeado