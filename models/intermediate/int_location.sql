with
    COUNTRYREGION as (
        select *
        from {{ ref('stg_erp__COUNTRYREGION')}}
    ),

    SALESTERRITORY as (
        select *
        from {{ ref('stg_erp__SALESTERRITORY')}}
    ),

    STATEPROVINCE as (
        select *
        from {{ ref('stg_erp__STATEPROVINCE')}}
    ),
    
    ADDRESS as (
        select *
        from {{ ref('stg_erp__ADDRESS')}}
    ),

    SALESORDERHEADER as (
        select *
        from {{ ref('stg_erp__SALESORDERHEADER')}}
    ),

    -- Primeira união: SALESORDERHEADER com a ADDRESS

    joined_SALESORDERHEADER_ADDRESS as (
        select
            SALESORDERHEADER.PK_SALESORDERID
            , SALESORDERHEADER.FK_CREDITCARDID
            , SALESORDERHEADER.FK_CUSTOMERID
            , SALESORDERHEADER.FK_SHIPTOADDRESSID
            , SALESORDERHEADER.fk_TERRITORYID_SALESORDERHEADER
            , SALESORDERHEADER.STATUS
            , SALESORDERHEADER.ORDERDATE
            , SALESORDERHEADER.DUEDATE
            , SALESORDERHEADER.SHIPDATE
            , SALESORDERHEADER.FREIGHT
            , ADDRESS.PK_ADDRESSID
            , ADDRESS.CITY_NAME
            , ADDRESS.FK_STATEPROVINCEID
            , ADDRESS.POSTALCODE
        from SALESORDERHEADER
        left join ADDRESS on SALESORDERHEADER.FK_SHIPTOADDRESSID = ADDRESS.PK_ADDRESSID
    ),

    -- Segunda união: união anterior com a ADDRESS

    joined_ADDRESS_STATEPROVINCE as (

        select
            jsa.*
            , STATEPROVINCE.PK_STATEPROVINCEID
            , STATEPROVINCE.FK_TERRITORYID_STATEPROVINCE
            , STATEPROVINCE.FK_STATEPROVINCECODE
            , STATEPROVINCE.FK_COUNTRYREGIONCODE_STATEPROVINCE
            , STATEPROVINCE.PROVINCE_NAME
        from joined_SALESORDERHEADER_ADDRESS jsa
        left join STATEPROVINCE on jsa.FK_STATEPROVINCEID = STATEPROVINCE.PK_STATEPROVINCEID
    ),

    -- Terceira união: união anterior com a SALESTERRITORY

    joined_STATEPROVINCE_SALESTERRITORY as (
        select
            jasp.*
            , SALESTERRITORY.PK_TERRITORYID
            , SALESTERRITORY.fk_COUNTRYREGIONCODE_SALESTERRITORY
            , SALESTERRITORY.TERRITORYID_NAME
            , SALESTERRITORY.CONTINENT
        from joined_ADDRESS_STATEPROVINCE jasp
        left join SALESTERRITORY on jasp.FK_TERRITORYID = SALESTERRITORY.PK_TERRITORYID 
    ),

    -- Última união: união anterior com a COUNTRYREGION

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