with
    source_PERSON as (
        select *
        from {{ source('erp', 'PERSON') }}
    )

    , renomeado as (
        select
            cast (BUSINESSENTITYID as int) as pk_BUSINESSENTITYID_PERSON
            , cast (FIRSTNAME as string) as FIRST_NAME
            , cast (LASTNAME as string) as LAST_NAME
        from source_PERSON
    )

    select *
    from renomeado