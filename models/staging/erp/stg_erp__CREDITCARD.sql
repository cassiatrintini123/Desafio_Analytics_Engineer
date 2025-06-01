with
    source_CREDITCARD as (
        select *
        from {{ source('erp', 'CREDITCARD') }}
    )

    , renomeado as (
        select
            cast (CREDITCARDID as int) as pk_CREDITCARDID
            , cast (CARDTYPE as string) as CARDTYPE
        from source_CREDITCARD
    )

    select *
    from renomeado