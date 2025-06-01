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
        from source_PRODUCT
    )

    select *
    from renomeado