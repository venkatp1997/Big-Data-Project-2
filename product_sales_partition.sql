CREATE TABLE IF NOT EXISTS nomosql_sales.product_sales_partition (orderid int, salespersonid int, customerid int, productid int, name varchar, price decimal(38,4), quantity int, amount decimal(38,4)) 
PARTITIONED BY (year int, month int)
COMMENT 'Parquet products sales materialized table partitioned by year and month'
STORED AS Parquet;

INSERT INTO nomosql_sales.product_sales_partition PARTITION(year, month)
SELECT s.orderid as orderid, s.salespersonid as salespersonid, s.customerid as customerid, p.productid as productid, p.name as name, 
p.price as price, s.quantity as quantity, s.quantity * p.price as amount, year(s.datesale) as year, month(s.datesale) as month
FROM nomosql_sales.products p
JOIN nomosql_sales.sales2 s
ON (p.productid=s.productid);
