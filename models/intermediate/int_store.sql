with 

    customer as (
        select *
        from {{ ref('stg_erp__CUSTOMER') }}
        where PERSONID is null
    )

    , store as (
        select *
        from {{ ref('stg_erp__STORE') }}
    )

    , joined as (
        select 
            customer.PK_CUSTOMERID,
            customer.STOREID,
            customer.PERSONID, 
            store.PK_BUSINESSENTITYID_STORE,
            store.STORE_NAME
        from customer
        left join store on customer.STOREID = store.PK_BUSINESSENTITYID_STORE
    )

select *
from joined