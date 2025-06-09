with 

    STORE as (
        select *

        from {{ ref('stg_erp__STORE') }}
    )

    , CUSTOMER as (
        select *
        from {{ ref('stg_erp__CUSTOMER') }}
    )

    , renamed as (
        select
            CUSTOMER.PK_CUSTOMERID
            , CUSTOMER.PERSONID
            , CUSTOMER.STOREID
            , STORE.PK_BUSINESSENTITYID_STORE
            , STORE.STORE_NAME
        from CUSTOMER
        left join STORE on CUSTOMER.STOREID = STORE.PK_BUSINESSENTITYID_STORE
    )

select *
from renamed

