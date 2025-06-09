with
    source_PERSONCREDITCARD as (
        select *
        from {{ source('erp', 'PERSONCREDITCARD') }}
    )

    , renomeado as (
        select
            cast (BUSINESSENTITYID as int) as PK_BUSINESSENTITYID_PERSONCREDITCARD
            , cast (CREDITCARDID as int) as FK_CREDITCARDID
        from source_PERSONCREDITCARD
    )

    select *
    from renomeado