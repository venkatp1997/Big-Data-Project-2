# NoMoSQL
1. Venkat Parthasarathy - parth039
2. Ojas Narayanann - bhava006
3. Ahmet D - dokum001

# Slack Channel
[nomosql-hadoop](https://csci5751s2020.slack.com/archives/G0115CNKLLX)

# User Documentation
## Performance on the view using partitioned and non-partitioned data (Deliverable 3- Part B Q2)
Aggregating queries from partitioned data can be faster because processing queries from partitions can be done in parallel and at the end result from all partitions can be aggregated. But in non-parititioned data, the query processing is done serially.
So execution time is better partitioned data.

# Deployment Runbook
1. Give permissions to run the script.  
```chmod +x main.sh ```

2. Execute the script.
``` ./main.sh```

3. To remove all data from Impala and HDFS.
``` ./clear.sh```

The .sql files for creating different views and tables ```<name_of_table/view>.sql ```





