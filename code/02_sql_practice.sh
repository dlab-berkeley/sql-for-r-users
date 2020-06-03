
# Download the target file
wget https://zenodo.org/record/3870894/files/full_dataset-statistics.tsv

# Unzip the file
gunzip full_dataset-statistics.tsv

# Install q
sudo apt-get install -y q-text-as-data

# Turn tsv into csv file
tr '\t' ',' < full_dataset.tsv > full_dataset.csv

# Remove the tsv file
rm full_dataset.csv

# List the csv file with its size (it's around 14GB)
ls -lh full_dataset.csv

# Show the first ten lines of the csv file
head -10 full_dataset.csv

# Show the last ten lines of the csv file
tail -10 full_dataset.csv

# Copy the csv file to the database 
"/usr/bin/psql" --command " "\\copy public.test_data (tweet_id, date, \"time\") FROM '/home/jae/sql-for-r-tidyverse-users/raw_data/full_dataset.csv' CSV HEADER QUOTE '\"' ESCAPE '''';""
