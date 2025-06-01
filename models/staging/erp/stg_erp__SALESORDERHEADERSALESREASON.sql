with
    source_SALESORDERHEADERSALESREASON as (
        select *
        from {{ source('erp', 'SALESORDERHEADERSALESREASON') }}
    )

    , renomeado as (
        select
            cast (SALESORDERID as int) as pk_SALESORDERID
            ,cast (SALESREASONID as int) as fk_SALESREASONID
        from source_SALESORDERHEADERSALESREASON
    )

    select *
    from renomeado