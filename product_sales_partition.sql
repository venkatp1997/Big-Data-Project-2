CREATE TABLE IF NOT EXISTS nomosql_sales.product_sales_partition (orderid int, salespersonid int, customerid int, productid int, name varchar, price decimal(38,4), quantity int, amount decimal(38,4)) 
PARTITIONED BY (year int, month int)
COMMENT 'Parquet products sales materialized table partitioned by year and month'
STORED AS Parquet

INSERT INTO nomosql_sales.product_sales_partition PARTITION(year, month)
SELECT s.orderid as orderid, s.salespersonid as salespersonid, s.customerid as customerid, p.productid as productid, p.name as name, 
p.price as price, s.quantity as quantity, s.quantity * p.price as amount, year(s.datesale) as year, month(s.datesale) as month
FROM nomosql_sales.products p
JOIN nomosql_sales.sales2 s
ON (p.productid=s.productid);

CREATE VIEW IF NOT EXISTS nomosql_sales.customer_monthly_sales_2019_partitioned_view as
select c1.customerid as customerid, c1.lastname as lastname, c1.firstname as firstname, t.month as month, t.year as year, t.amount as amount 
from 
(
    select t1.customerid as customerid, t1.month as month, t1.year as year, sum(t1.amount) as amount
    from
    (
        select sp.customerid as customerid, sp.month as month, sp.year as year, sp.amount as amount
        from nomosql_sales.product_sales_partition sp
        where sp.year=2019
    ) as t1
    group by t1.customerid, t1.month, t1.year
) as t
join nomosql_sales.customers2 c1
on (c1.customerid=t.customerid);