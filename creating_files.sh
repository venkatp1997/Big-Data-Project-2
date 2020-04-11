# Downloading data
wget https://csci5751-2020sp.s3-us-west-2.amazonaws.com/sales-data/salesdata.tar.gz

# Extracting data
tar -xf salesdata.tar.gz

# Remove tar.gz file
rm salesdata.tar.gz

# Go to salesdb directory.
cd salesdb;

# Create new directories.
mkdir customers2; mkdir employees2; mkdir products; mkdir sales2;

# Move each csv file to its respective folder.
mv Customers2.csv customers2/; mv Employees2.csv employees2/; mv Products.csv products/; mv Sales2.csv sales2/;

# Move to /home/cloudera.
cd ..;