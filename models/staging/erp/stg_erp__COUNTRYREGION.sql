with
    source_COUNTRYREGION as (
        select *
        from {{ source('erp', 'COUNTRYREGION') }}
    )

    , renomeado as (
        select
            cast (COUNTRYREGIONCODE as string) as pk_COUNTRYREGIONCODE
            , cast (NAME as string) as COUNTRY_NAME
        from source_COUNTRYREGION
    )

    select *
    from renomeado