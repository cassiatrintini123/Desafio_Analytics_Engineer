with
    source_CREDITCARD as (
        select *
        from {{ source('erp', 'CREDITCARD') }}
    )

    , renomeado as (
        select
            cast (CREDITCARDID as int) as pk_CREDITCARDID
            , cast (CARDTYPE as string) as CARDTYPE
            , cast (CARDNUMBER as int) as CARDNUMBER
            , cast (EXPMONTH as int) as EXPMONTH
            , cast (EXPYEAR as int) as EXPYEAR
            , cast (MODIFIEDDATE as string) as MODIFIEDDATE
        from source_CREDITCARD
    )

    select *
    from renomeado