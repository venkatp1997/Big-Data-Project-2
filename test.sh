impala-shell -q "select count(*) from nomosql_sales_raw.customers2"
impala-shell -q "select count(*) from nomosql_sales_raw.sales2"
impala-shell -q "select count(*) from nomosql_sales_raw.employees2"
impala-shell -q "select count(*) from nomosql_sales_raw.products"

impala-shell -q "select count(*) from nomosql_sales.customers2"
impala-shell -q "select count(*) from nomosql_sales.sales2"
impala-shell -q "select count(*) from nomosql_sales.employees2"
impala-shell -q "select count(*) from nomosql_sales.products"


impala-shell -q "select * from nomosql_sales.customer_monthly_sales_2019_view limit 10"
impala-shell -q "select * from nomosql_sales.top_ten_customers_amount_view limit 10"

impala-shell -q "select * from nomosql_sales.product_sales_partition limit 10"
impala-shell -q "select * from nomosql_sales.customer_monthly_sales_2019_partitioned_view limit 10"
impala-shell -q "select * from nomosql_sales.product_region_sales_partition limit 10"
