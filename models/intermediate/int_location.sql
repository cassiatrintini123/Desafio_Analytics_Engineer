with
    COUNTRYREGION as (
        select *
        from {{ ref('stg_erp__COUNTRYREGION') }}
    ),

    SALESTERRITORY as (
        select *
        from {{ ref('stg_erp__SALESTERRITORY') }}
    ),

    STATEPROVINCE as (
        select *
        from {{ ref('stg_erp__STATEPROVINCE') }}
    ),
    
    ADDRESS as (
        select *
        from {{ ref('stg_erp__ADDRESS') }}
    ),

    -- União de ADDRESS com STATEPROVINCE

    joined_ADDRESS_STATEPROVINCE as (
        select
            ADDRESS.PK_ADDRESSID
            , ADDRESS.CITY_NAME
            , ADDRESS.FK_STATEPROVINCEID
            , ADDRESS.POSTALCODE
            , STATEPROVINCE.PK_STATEPROVINCEID
            , STATEPROVINCE.FK_TERRITORYID_STATEPROVINCE
            , STATEPROVINCE.FK_STATEPROVINCECODE
            , STATEPROVINCE.FK_COUNTRYREGIONCODE_STATEPROVINCE
            , STATEPROVINCE.PROVINCE_NAME
        from ADDRESS
        left join STATEPROVINCE on ADDRESS.FK_STATEPROVINCEID = STATEPROVINCE.PK_STATEPROVINCEID
    ),

    -- União anterior com a SALESTERRITORY

    joined_STATEPROVINCE_SALESTERRITORY as (
        select
            jasp.*
            , SALESTERRITORY.PK_TERRITORYID
            , SALESTERRITORY.fk_COUNTRYREGIONCODE_SALESTERRITORY
            , SALESTERRITORY.TERRITORYID_NAME
            , SALESTERRITORY.CONTINENT
        from joined_ADDRESS_STATEPROVINCE jasp
        left join SALESTERRITORY on jasp.FK_TERRITORYID_STATEPROVINCE = SALESTERRITORY.PK_TERRITORYID 
    ),

    -- Última união com COUNTRYREGION

    final_joined_data as (
        select
            jsst.*
            , COUNTRYREGION.PK_COUNTRYREGIONCODE
            , COUNTRYREGION.COUNTRY_NAME
        from joined_STATEPROVINCE_SALESTERRITORY jsst
        left join COUNTRYREGION on jsst.fk_COUNTRYREGIONCODE_SALESTERRITORY = COUNTRYREGION.PK_COUNTRYREGIONCODE 
    )

select *
from final_joined_data
