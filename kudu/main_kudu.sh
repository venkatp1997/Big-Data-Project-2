chmod +x *.sh

echo "1.Creating sales table in Kudu (Name of DB: nomosql_sales_kudu)"
impala-shell -f create_sales_kudu.sql

echo "2.Creating parquet tables from raw data. (Name of DB: nomosql_sales_kudu)"
impala-shell -f create_product_kudu.sql

echo "3.Querying the total dollar amount sold by year"
impala-shell -f find_total_amount_by_year_kudu.sql

echo "4.Inserting ad-hoc records"
impala-shell -f insert_adhoc_records_kudu.sql

echo "5.Querying the total dollar amount sold by year"
impala-shell -f find_total_amount_by_year_kudu.sql

echo "6.Deleting ad-hoc records"
impala-shell -f delete_adhoc_records_kudu.sql

echo "7.Upserting ad-hoc records"
impala-shell -f upsert_adhoc_records_kudu.sql

echo "8.Querying the total dollar amount sold by year"
impala-shell -f find_total_amount_by_year_kudu.sql

