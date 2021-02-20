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


#convert some variable types
resturants_data$Business_Operation_Year <- as.factor(resturants_data$Business_Operation_Year)
resturants_data$Franchise <- as.factor(resturants_data$Franchise)
resturants_data$Own_Lease <- as.factor(resturants_data$Own_Lease)
resturants_data$Delivery <- as.factor(resturants_data$Delivery)
resturants_data$Curbside_Pickup <- as.factor(resturants_data$Curbside_Pickup)
resturants_data$Dine_In_Service <- as.factor(resturants_data$Dine_In_Service)
resturants_data$Patio_Service <- as.factor(resturants_data$Patio_Service)
resturants_data$Cuisine <- as.factor(resturants_data$Cuisine)
resturants_data$Offer_Alcohol <- as.factor(resturants_data$Offer_Alcohol)
resturants_data$Price_Point_Target <- as.factor(resturants_data$Price_Point_Target)
resturants_data$Helpfulness_Factor <- as.factor(resturants_data$Helpfulness) #added this to draw some graphs as factor



# Write final csv for analysis
write_csv(resturants_data, "dataset/reopened_resturants.csv")

