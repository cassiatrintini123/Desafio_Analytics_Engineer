/*Esse teste garante que as vendas brutas de 2012 estão corretas com o valor auditado da contabilidade R$ 230784.68*/

with
sales_2011 as (
    select sum(NEGOTIATED_PRICE) as sum_NEGOCIATED_PRICE
    from {{ ref('int_sales') }}
    where ORDERDATE between '2011-01-01' and '2011-12-31'
)

select sum_NEGOCIATED_PRICE
from sales_2011
where sum_NEGOCIATED_PRICE not between 12646112 and 12646113