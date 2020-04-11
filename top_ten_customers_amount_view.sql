CREATE VIEW IF NOT EXISTS nomosql_sales.top_ten_customers_amount_view as
select c.customerid as customerid, c.lastname as lastname, c.firstname as firstname, t.amount as amount
from
(
    select t.customerid as customerid, sum(t.amount) as amount
    from
    (
        select s.customerid as customerid, s.quantity * p.price as amount
        from nomosql_sales.sales2 s 
        join nomosql_sales.products p
        on(s.productid = p.productid)
    ) as t
    group by t.customerid
    order by amount desc
    limit 10
) as t
join nomosql_sales.customers2 c
on (t.customerid=c.customerid);