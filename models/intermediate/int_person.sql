with 

    customer as (
        select *
        from {{ ref('stg_erp__CUSTOMER') }}
        where STOREID is null
    )

    , person as (
        select *
        from {{ ref('stg_erp__PERSON') }}
    )

    , personcreditcard as (
        select *
        from {{ ref('stg_erp__PERSONCREDITCARD') }}
    )

    , creditcard as (
        select *
        from {{ ref('stg_erp__CREDITCARD') }}
    )

    , joined as (
        select 
            customer.PK_CUSTOMERID,
            customer.PERSONID,
            person.FIRST_NAME || ' ' || person.LAST_NAME as FULL_NAME,
            creditcard.PK_CREDITCARDID,
            creditcard.CARDTYPE,
            personcreditcard.FK_CREDITCARDID,
            person.PK_BUSINESSENTITYID_PERSON
        from customer
        left join person on customer.PERSONID = person.PK_BUSINESSENTITYID_PERSON
        left join personcreditcard on person.PK_BUSINESSENTITYID_PERSON = personcreditcard.PK_BUSINESSENTITYID_PERSONCREDITCARD
        left join creditcard on personcreditcard.FK_CREDITCARDID = creditcard.PK_CREDITCARDID
    )

select *
from joined

