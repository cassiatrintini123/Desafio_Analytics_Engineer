with
    source_STATEPROVINCE as (
        select *
        from {{ source('erp', 'STATEPROVINCE') }}
    )

    , renomeado as (
        select
            cast (STATEPROVINCEID as int) as pk_STATEPROVINCEID
            , cast (TERRITORYID as int) as fk_TERRITORYID
            , cast (STATEPROVINCECODE as string) as fk_STATEPROVINCECODE
            , cast (COUNTRYREGIONCODE as string) as fk_COUNTRYREGIONCODE
            , cast (ISONLYSTATEPROVINCEFLAG as string) as ISONLYSTATEPROVINCEFLAG
            , cast (NAME as string) as PROVINCE_NAME
            , cast (ROWGUID as string) as ROWGUID
            , cast (MODIFIEDDATE  as string) as MODIFIEDDATE
        from source_STATEPROVINCE
    )

    select *
    from renomeado