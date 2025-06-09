with
    
    int_person as (
        select *
        from {{ ref('int_person') }}
    )

    , int_store as (
        select *
        from {{ ref('int_store') }}
    )

    , renamed as (
        select *
        from int_store
        left join int_person on int_store.PERSONID = int_person.PK_BUSINESSENTITYID_PERSONCREDITCARD
    )

select *
from renamed

