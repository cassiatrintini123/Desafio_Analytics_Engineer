with
    source_SALESTERRITORY as (
        select *
        from {{ source('erp', 'SALESTERRITORY') }}
    )

    , renomeado as (
        select
            cast (TERRITORYID as int) as pk_TERRITORYID
            , cast (COUNTRYREGIONCODE as string) as fk_COUNTRYREGIONCODE_SALESTERRITORY
            , cast (NAME as string) as TERRITORYID_NAME
            , cast ("group" as string) as CONTINENT
        from source_SALESTERRITORY
    )

    select *
    from renomeado