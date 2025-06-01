with
    source_SALESREASON as (
        select *
        from {{ source('erp', 'SALESREASON') }}
    )

    , renomeado as (
        select
            cast (SALESREASONID as int) as pk_SALESREASONID
            , cast (NAME as string) as SALESREASON_NAME
            , cast (REASONTYPE as string) as REASONTYPE_NAME
        from source_SALESREASON
    )

    select *
    from renomeado