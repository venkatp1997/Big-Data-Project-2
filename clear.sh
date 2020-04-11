echo "Removing DBs."
impala-shell -f remove.sql

echo "Removing salesdb from HDFS"
hdfs dfs -rm -r /salesdb

echo "Removing all scripts"
rm -rf *
