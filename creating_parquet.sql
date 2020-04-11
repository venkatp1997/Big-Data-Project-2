CREATE DATABASE nomosql_sales;

CREATE TABLE IF NOT EXISTS nomosql_sales.customers2
COMMENT 'Parquet customers2 table'
STORED AS Parquet
AS
SELECT * from nomosql_sales_raw.customers2;

CREATE TABLE IF NOT EXISTS nomosql_sales.employees2
COMMENT 'Parquet employees2 table'
STORED AS Parquet
AS
SELECT * from nomosql_sales_raw.employees2;

CREATE TABLE IF NOT EXISTS nomosql_sales.products
COMMENT 'Parquet products table'
STORED AS Parquet
AS
SELECT * from nomosql_sales_raw.products;

CREATE TABLE IF NOT EXISTS nomosql_sales.sales2
COMMENT 'Parquet sales2 table'
STORED AS Parquet
AS
SELECT * from nomosql_sales_raw.sales2;