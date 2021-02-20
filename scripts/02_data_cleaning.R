library(tidyverse)

#Load exported CSV file
all_resturants= read.csv('dataset/raw_data_all_resturants.csv', stringsAsFactors = FALSE)


#Get rid of unuseful columns
resturants_data <- all_resturants[, -c(3:8)] #Got rid of basic business contact information.

#Check null
is.null(resturants_data)
apply(resturants_data, 2, function(x) any(is.na(x)))

# No null value, ready to go
# We are only analyzing people who are selected to reopen, therefore, filter the original dataset into only selected to open

resturants_data <- resturants_data[resturants_data$Selected_Open == 'Y',]

#3529 records remain

# Write final csv for analysis
write_csv(resturants_data, "dataset/reopened_resturants.csv")
