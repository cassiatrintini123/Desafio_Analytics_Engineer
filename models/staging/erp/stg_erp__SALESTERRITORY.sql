with
    source_SALESTERRITORY as (
        select *
        from {{ source('erp', 'SALESTERRITORY') }}
    )

    , renomeado as (
        select
            cast (TERRITORYID as int) as pk_TERRITORYID
            , cast (COUNTRYREGIONCODE as string) as fk_COUNTRYREGIONCODE
            , cast (NAME as string) as TERRITORYID_NAME
            , cast ("group" as string) as CONTINENT
            , cast (SALESYTD as int) as SALESYTD
            , cast (SALESLASTYEAR as int) as SALESLASTYEAR
            , cast (COSTYTD as int) as COSTYTD
            , cast (COSTLASTYEAR as int) as COSTLASTYEAR
            , cast (ROWGUID as string) as ROWGUID
            , cast (MODIFIEDDATE as string) as MODIFIEDDATE
        from source_SALESTERRITORY
    )

    select *
    from renomeado