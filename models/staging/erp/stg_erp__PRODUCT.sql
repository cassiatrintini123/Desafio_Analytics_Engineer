with
    source_PRODUCT as (
        select *
        from {{ source('erp', 'PRODUCT') }}
    )

    , renomeado as (
        select
            cast (PRODUCTID as int) as pk_PRODUCTID
            , cast (NAME as string) as PRODUCT_NAME
            , cast (PRODUCTNUMBER as string) as PRODUCTNUMBER
            , cast (REORDERPOINT as int) as REORDERPOINT
            , cast (STANDARDCOST as real) as STANDARDCOST
            , cast (LISTPRICE as real) as LISTPRICE
            , cast (SELLSTARTDATE as string) as SELLSTARTDATE
            , cast (ROWGUID as string) as ROWGUID
            , cast (MODIFIEDDATE as string) as MODIFIEDDATE
        from source_PRODUCT
    )

    select *
    from renomeado