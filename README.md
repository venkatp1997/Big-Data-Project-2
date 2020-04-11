# NoMoSQL
1. Venkat Parthasarathy - parth039
2. Ojas Narayanann - bhava006
3. Ahmet D - dokum001

# Slack Channel
[nomosql-hadoop](https://csci5751s2020.slack.com/archives/G0115CNKLLX)

# User Documentation
## Data Ingestion
1. Setting appropriate delimiter based on observing the CSV file.
2. Deciding on data format. For example, we used decimal(38,4) for the prices field because using the default float/decimal included more values after the decimal point and some of those values after 4 were garbage values.

## Performance on the view using partitioned and non-partitioned data (Deliverable 3- Part B Q2)
Aggregating queries from partitioned data can be faster because processing queries from partitions can be done in parallel and at the end result from all partitions can be aggregated. But in non-parititioned data, the query processing is done serially.
So execution time is better partitioned data.

## Partitioning strategy for Kudu (Deliverable 4- Q1)
Initially, we decided to parition on the basis of RANGE of year because it is apt for the business question being answered here. But, Kudu does not support partitioning on non-primary key fields. Then, we noticed that as the sales table is stored in chronological order with auto incrementing orderid. The first record has the year as 2018 and the last record has the year 2020 Hence, we decided to 3 near equi-sized partitions based on orderid (0,220000),(220000,440000) and (440000,..). The motivation here is that, records with same year are likely to reside in the same partition.

## Suggestion on how to stream records into the Sales table (Deliverable 4- Q9)
As we have observed above with Kudu being restrictive on paritioning based on primary key only and since our primary key is OrderID as given in the question, we can have two different strategies while streaming the data into the table. 
* Assumption- All the records currently are in chronological order
1. We can have an additional column called isActive that signifies if the record should exist on the table. This will make deletion faster as we mark the record to be deleted later when there is lesser load on the database.
2. We can construct a secondary index on date.
3. If there is a update to the Date field of a record, we can choose to set isActive to 0 and insert it as a new record in the table with the same orderId as the old record and insert it in the correct partition and correct position within the partition using the secondary index we created. 
4. This will ensure that the records will always be in chronological order and help us answer the business questions where we need to group by year.
5. If there is no update to the date, we can simply upsert the data which will update the record in return.

# Kudu Results (Deliverable-4)
Q3:
```
+------+-------------------+
| year | amount            |
+------+-------------------+
| 2020 | 138265412390.2275 |
| 2018 | 797483356326.3954 |
| 2019 | 931884640402.8126 |
+------+-------------------+
Fetched 3 row(s) in 2.12s
```
Q5:
```
+------+-------------------+
| year | amount            |
+------+-------------------+
| 2020 | 138265430220.2075 |
| 2018 | 797483356326.3954 |
| 2019 | 931884640402.8126 |
+------+-------------------+
Fetched 3 row(s) in 1.94s
```
Q8:
```
+------+-------------------+
| year | amount            |
+------+-------------------+
| 2020 | 138265387834.0804 |
| 2018 | 797483356326.3954 |
| 2019 | 931884640402.8126 |
+------+-------------------+
Fetched 3 row(s) in 1.89s
```

# Comments on performance
1. For deliverable-2 and 3, performance slightly improved when we were working with partitioned tables and we can expect it to improve a lot in production as well.
2. Subsequent queries in Kudu generally took slightly lesser time because we were only modifying data in one partition and the answer for only that is probably updated. This can produce a large performance boost when dealing with larger sized datasets and more partitions. 

# Deployment Runbook
1. Give permissions to run the script.  
```chmod +x main.sh ```

2. Execute the script.
``` ./main.sh```

3. To remove all data from Impala and HDFS.
``` ./clear.sh```

The .sql files for creating different views and tables ```<name_of_table/view>.sql ```
