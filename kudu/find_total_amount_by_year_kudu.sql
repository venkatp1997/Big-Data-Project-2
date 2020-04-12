select year(t1.datesale) as year, sum(t1.amount) as amount
from
(
	select s.datesale as datesale, s.quantity * p.price as amount
        from nomosql_sales_kudu.sales s
        join nomosql_sales_kudu.products p
        on (s.productid=p.productid)
) as t1
group by year(t1.datesale);

