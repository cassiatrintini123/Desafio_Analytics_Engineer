with
    source_STORE as (
        select *
        from {{ source('erp', 'STORE') }}
    )

    , renomeado as (
        select
            cast (BUSINESSENTITYID as int) as PK_BUSINESSENTITYID_STORE
            , cast (NAME as string) as STORE_NAME
        from source_STORE
    )

    select *
    from renomeado