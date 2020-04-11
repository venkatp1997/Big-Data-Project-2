CREATE TABLE IF NOT EXISTS nomosql_sales.product_region_sales_partition (orderid int, salespersonid int, customerid int, productid int, name varchar, price decimal(38,4), quantity int, amount decimal(38,4))
PARTITIONED BY (region varchar, year int, month int)
COMMENT 'Parquet products sales materialized table partitioned by region, year and month'
STORED AS Parquet;

INSERT INTO nomosql_sales.product_region_sales_partition PARTITION(region, year, month)
SELECT st.orderid as orderid, st.salespersonid as salespersonid, st.customerid as customerid, st.productid as productid, st.name as name,
st.price as price, st.quantity as quantity, st.amount, e.region as region, st.year, st.month
FROM nomosql_sales.product_sales_partition st
JOIN nomosql_sales.employees2 e
ON (st.salespersonid=e.employeeid);