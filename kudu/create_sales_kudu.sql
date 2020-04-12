create database nomosql_sales_kudu;
create table nomosql_sales_kudu.sales(orderid int primary key, salespersonid int, customerid int, productid int,quantity int, datesale timestamp)
PARTITION BY RANGE (orderid) (PARTITION 0 <= VALUES <= 220000, PARTITION 220001 <= VALUES <= 440000, PARTITION 440001 <= VALUES)
STORED as KUDU;
INSERT INTO nomosql_sales_kudu.sales  
select orderid,salespersonid,customerid,productid,quantity,datesale from nomosql_sales.sales2;
