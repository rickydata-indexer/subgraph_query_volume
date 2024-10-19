library(sparklyr)
library(dplyr)
library(DBI)

# Install Spark version 3.4 locally (if needed)
# spark_install(version = "3.4")

# Connect to Spark with the necessary configuration
config <- spark_config()
config$spark.sql.parquet.int96AsTimestamp <- "false"

sc <- spark_connect(master = "local", config = config)

# Load the Parquet file again
transactions_tbl <- spark_read_parquet(sc, name = "transactions", 
                                       path = "filtered_transactions.parquet")

# Show the first few rows
transactions_tbl %>% head()


# dplyr operations on spark data ------------------------------------------

# Summarize the transactions data (assuming the structure has a column called `block_number`)
block_summary = transactions_tbl %>%
  group_by(block_num) %>%
  summarise(transaction_count = n())

# Show the summarized results
block_summary %>% head()

# Or raw SQL queries directly
dbGetQuery(sc, "SELECT block_num, COUNT(*) as transaction_count FROM transactions GROUP BY block_num LIMIT 5")



# close connection --------------------------------------------------------

spark_disconnect(sc)
