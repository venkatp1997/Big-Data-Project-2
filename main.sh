chmod +x *.sh

echo "Downloading files."
./creating_files.sh

echo "Moving files to hdfs"
./move_hdfs.sh

echo "Creating raw sales table. (Name of DB: nomosql_raw_sales)"
impala-shell -f creating_sales_raw.sql

echo "Creating parquet tables from raw data. (Name of DB: nomosql_sales)"
impala-shell -f creating_parquet.sql

echo "Creating view: customer_monthly_sales_2019_view"
impala-shell -f customer_monthly_sales_2019_view.sql

echo "Creating view: top_ten_customers_amount_view"
impala-shell -f top_ten_customers_amount_view.sql

echo "Creating table: product_sales_partition"
impala-shell -f product_sales_partition.sql

echo "Creating view: customer_monthly_sales_2019_partitioned_view"
impala-shell -f customer_monthly_sales_2019_partitioned_view.sql

echo "Creating table: product_region_sales_partition"
impala-shell -f product_region_sales_partition.sql
