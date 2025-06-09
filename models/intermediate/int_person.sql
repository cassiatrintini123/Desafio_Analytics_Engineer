with 

    PERSON as (
        select *

        from {{ ref('stg_erp__PERSON') }}
    )

    , PERSONCREDITCARD as (
        select *
        from {{ ref('stg_erp__PERSONCREDITCARD') }}
    )

    , CREDITCARD as (
        select *
        from {{ ref('stg_erp__CREDITCARD') }}
    )

    , renamed as (
        select
            CREDITCARD.PK_CREDITCARDID
            , CREDITCARD.CARDTYPE
            , PERSONCREDITCARD.FK_CREDITCARDID
            , PERSONCREDITCARD.PK_BUSINESSENTITYID_PERSONCREDITCARD
        from PERSONCREDITCARD
        left join CREDITCARD on PERSONCREDITCARD.FK_CREDITCARDID = CREDITCARD.PK_CREDITCARDID
    )

    , join_CREDITCARD_PERSONCREDITCARD AS (
    SELECT 
        renamed.*,
        PERSON.FIRST_NAME,
        PERSON.LAST_NAME
    FROM renamed
    LEFT JOIN PERSON ON renamed.PK_BUSINESSENTITYID_PERSONCREDITCARD = PERSON.PK_BUSINESSENTITYID_PERSON
)

select *
from join_CREDITCARD_PERSONCREDITCARD

