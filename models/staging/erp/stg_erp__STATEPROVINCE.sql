with
    source_STATEPROVINCE as (
        select *
        from {{ source('erp', 'STATEPROVINCE') }}
    )

    , renomeado as (
        select
            cast (STATEPROVINCEID as int) as STATEPROVINCEID
            , cast (STATEPROVINCECODE as string) as STATEPROVINCECODE
            , cast (COUNTRYREGIONCODE as string) as COUNTRYREGIONCODE
            , cast (ISONLYSTATEPROVINCEFLAG as string) as ISONLYSTATEPROVINCEFLAG
            , cast (NAME as string) as PROVINCE_NAME
            , cast (TERRITORYID as int) as TERRITORYID
            , cast (ROWGUID as string) as ROWGUID
            , cast (MODIFIEDDATE  as string) as MODIFIEDDATE
        from source_STATEPROVINCE
    )

    select *
    from renomeado