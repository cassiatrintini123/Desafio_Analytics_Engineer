with
    
    int_person as (
        select 
            PK_CUSTOMERID,
            PERSONID,
            FULL_NAME,
            CARDTYPE,
            FK_CREDITCARDID,
            NULL as STOREID,
            NULL as STORE_NAME,
            'Individual' as CUSTOMER_TYPE
        from {{ ref('int_person') }}
    )

    , int_store as (
        select 
            PK_CUSTOMERID,
            NULL as PERSONID,
            NULL as FULL_NAME,
            NULL as CARDTYPE,
            NULL as FK_CREDITCARDID,
            STOREID,
            STORE_NAME,
            'Company' as CUSTOMER_TYPE
        from {{ ref('int_store') }}
    )

    , unified_customer as (
        select * from int_person
        union all
        select * from int_store
    )

select *
from unified_customer

