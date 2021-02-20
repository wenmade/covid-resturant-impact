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
reopened_resturants$Business_Operation_Year <- as.factor(reopened_resturants$Business_Operation_Year)
reopened_resturants$Franchise <- as.factor(reopened_resturants$Franchise)
reopened_resturants$Own_Lease <- as.factor(reopened_resturants$Own_Lease)
reopened_resturants$Delivery <- as.factor(reopened_resturants$Delivery)
reopened_resturants$Curbside_Pickup <- as.factor(reopened_resturants$Curbside_Pickup)
reopened_resturants$Dine_In_Service <- as.factor(reopened_resturants$Dine_In_Service)
reopened_resturants$Patio_Service <- as.factor(reopened_resturants$Patio_Service)
reopened_resturants$Cuisine <- as.factor(reopened_resturants$Cuisine)
reopened_resturants$Offer_Alcohol <- as.factor(reopened_resturants$Offer_Alcohol)
reopened_resturants$Price_Point_Target <- as.factor(reopened_resturants$Price_Point_Target)
reopened_resturants$Helpfulness_Factor <- as.factor(reopened_resturants$Helpfulness) #added this to draw some graphs as factor



# Write final csv for analysis
write_csv(resturants_data, "dataset/reopened_resturants.csv")
