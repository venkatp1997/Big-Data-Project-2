CREATE VIEW IF NOT EXISTS nomosql_sales.customer_monthly_sales_2019_view as
select c1.customerid as customerid, c1.lastname as lastname, c1.firstname as firstname, t.month as month, t.year as year, t.amount as amount 
from
(
    select t1.customerid as customerid, month(t1.datesale) as month, year(t1.datesale) as year, sum(t1.amount) as amount 
    from 
    (
        select s.customerid, s.datesale as datesale, s.quantity * p.price as amount
        from nomosql_sales.sales2 s
        join nomosql_sales.products p 
        on (s.productid=p.productid)
    ) as t1
    where year(t1.datesale) = 2019
    group by t1.customerid, month(t1.datesale), year(t1.datesale)
)   as t
join nomosql_sales.customers2 c1
on (c1.customerid=t.customerid);
