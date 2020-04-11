CREATE DATABASE nomosql_sales_raw;

CREATE EXTERNAL TABLE IF NOT EXISTS nomosql_sales_raw.customers2 (
CustomerID int,
FirstName varchar,
MiddleInitial varchar,
LastName varchar)
COMMENT 'customer2 table'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/salesdb/customers2/'
TBLPROPERTIES ("skip.header.line.count"="1");

CREATE EXTERNAL TABLE IF NOT EXISTS nomosql_sales_raw.employees2 (
EmployeeID int,
FirstName varchar,
MiddleInitial varchar,
LastName varchar,
Region varchar)
COMMENT 'employees2 table'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/salesdb/employees2/'
TBLPROPERTIES ("skip.header.line.count"="1");

CREATE EXTERNAL TABLE IF NOT EXISTS nomosql_sales_raw.products (
ProductID int,
Name varchar,
Price decimal(38,4))
COMMENT 'products table'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/salesdb/products/'
TBLPROPERTIES ("skip.header.line.count"="1");

CREATE EXTERNAL TABLE IF NOT EXISTS nomosql_sales_raw.sales2 (
OrderID int,
SalesPersonID int,
CustomerID int,
ProductID int,
Quantity int,
DateSale TIMESTAMP)
COMMENT 'sales2 table'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
LOCATION '/salesdb/sales2/'
TBLPROPERTIES ("skip.header.line.count"="1");