create table nomosql_sales_kudu.products(productid int primary key, name varchar, price float) 
partition by hash(productid) 
partitions 2 
stored as kudu;
insert into nomosql_sales_kudu.products
select productid,name,price from nomosql_sales.products;
