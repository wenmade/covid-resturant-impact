#### Setup ####
library(tidyverse)
library(generator)
library(stringi)


#### copy over column in data ####
dinesafeCSV <- read.csv("dataset/dinesafeCSV.csv", header=TRUE, sep=",")

#only keeping categories that is classified as Resturants
dinesafeCSV <- dinesafeCSV[dinesafeCSV$TYPE == 'Restaurant',]


#7221 obs in total
totalobs <- nrow(dinesafeCSV)


#### Establish some verctors ####

top_cuisine_list <- c("Chinese", "Mexican", "Italian", "Japanese", "Greek", "Korean", "Thai", "Vietnamese", "American",
                      "Indian", "Mediterranean", "Others");


business_op_list <- c("Under 1 year", "1-5 years", "6-10 years", "11-20 years", "Over 20 years");
business_owner_list <- c("Under 1 year", "1-5 years", "6-10 years", "11-20 years", "Over 20 years");
price_point_target <- c("Low-end", "Average", "High-end");
rating_list <- c("1", "2", "3", "4", "5");

#### Raw Survey Data Radomization ####

simulated_resturants <-
  tibble(
    ID = seq(1, totalobs), #auto generate index for each row of dataset
    Name = dinesafeCSV$NAME,
    Owner = r_full_names(totalobs),
    Mailing_Address = dinesafeCSV$ADDRESS, #from dinesafe
    Phone_1 = r_phone_numbers(totalobs), 
    Phone_2 = r_phone_numbers(totalobs),
    Email = r_email_addresses(totalobs),
    Website = paste(stri_rand_strings(totalobs, sample(8:16, 1, replace=TRUE), pattern = '[a-zA-Z0-9]'), "@", 
                    stri_rand_strings(totalobs, sample(3:5, 1, replace=TRUE), pattern = '[a-z]'), ".com"),
    Business_Operation_Year = sample(x = business_op_list, 
                                     size = totalobs,
                                     replace=TRUE,
                                     prob=c(0.2, 0.35, 0.15, 0.2, 0.1)),
    Franchise = sample(x = c ("Y", "N"), 
                       size=totalobs,
                       replace=TRUE,
                       prob=c(0.4, 0.6)), 
    Own_Lease = sample(x=c("Own", "Lease", "Lease, want to purchase"), 
                       size=totalobs,
                       replace=TRUE,
                       prob=c(0.4, 0.5, 0.1)),
    Number_Of_Staff_Before_Covid = runif(totalobs, min=5, max=70) %>% as.integer(), 
    Number_Of_Staff_During_Covid = runif(totalobs, min=1, max=20) %>% as.integer(), #cap staff to 20 max
    Number_Of_Staff_During_Reopen = runif(totalobs, min=1, max=70) %>% as.integer(), #cap staff to 70 max
    Total_Hours_Per_Week_Before_Covid = runif(totalobs, min=70, max=168) %>% as.integer(), 
    Total_Hours_Per_Week_During_Covid = runif(totalobs, min=0, max=70) %>% as.integer(),  #cap operation hours to 70 max
    Total_Hours_Per_Week_During_Reopen = runif(totalobs, min=40, max=98) %>% as.integer(), #cap oepration hours to 98 max
    Delivery = sample(x = c ("Y", "N"),
                      size=totalobs,
                      replace=TRUE,
                      prob=c(0.8, 0.2)),
    Curbside_Pickup = sample(x = c ("Y", "N"),
                             size=totalobs,
                             replace=TRUE,
                             prob=c(0.6, 0.4)),
    Dine_In_Service = sample(x = c ("Y", "N"),
                             size=totalobs,
                             replace=TRUE,
                             prob=c(0.7, 0.3)), 
    Patio_Service = sample(x = c ("Y", "N"),
                           size=totalobs,
                           replace=TRUE,
                           prob=c(0.15, 0.85)), 
    Cuisine = sample(x = top_cuisine_list, 
                     size = totalobs,
                     replace = TRUE,
                     prob = c(0.1, 0.12, 0.07, 0.1, 0.15, 0.05, 0.05, 0.08, 0.05, 0.07, 0.08, 0.08)), 
    Offer_Alcohol = sample(x = c ("Y", "N"),
                           size=totalobs,
                           replace=TRUE,
                           prob=c(0.4, 0.6)), 
    Price_Point_Target = sample(x=price_point_target, 
                                size=totalobs,
                                replace=TRUE,
                                prob=c(0.4, 0.4, 0.2)),
    Income_052019_062019 = runif(totalobs, min=120000, max=800000) %>% as.integer(), #Income_052019_062019
    Income_052020_062020 = runif(totalobs, min=60000, max=160000) %>% as.integer(),
    Income_052021_062021 = runif(totalobs, min=120000, max=800000) %>% as.integer(),
    Profit_052019_062019 = runif(totalobs, min=3600, max=24000) %>% as.integer(), #data filling using 0.03 from income
    Profit_052020_062020 = runif(totalobs, min=1800, max=4800) %>% as.integer(), 
    Profit_052021_062021 = runif(totalobs, min=3600, max=24000) %>% as.integer(),

    Selected_Open = sample(x = c ("Y", "N"),
                           size=totalobs,
                           replace=TRUE,
                           prob=c(0.5, 0.5)),

    Helpfulness = sample(x = rating_list, 
                         size = totalobs,
                         replace=TRUE,
                         prob=c(0.2, 0.1, 0.15, 0.2, 0.35)),
    
    Long = dinesafeCSV$LONGITUDE, #from dinesafe
    Lat = dinesafeCSV$LATITUDE #from dinesafe
  )


#Some data simulation to make it more realistic - all assumptions

#1. If resturant is selected to reopen, we allow assumptions to have profit from may-jun 2021,
#staff number for not reopened resturants stay the same as 2020, 1-20.
indexSY <- which(simulated_resturants$Selected_Open == "Y")
simulated_resturants$Profit_052021_062021[indexSY] <- runif(length(indexSY), min=3600, max=24000) %>% as.integer()
indexSN <- which(simulated_resturants$Selected_Open == "N")
simulated_resturants$Profit_052021_062021[indexSN] <- runif(length(indexSN), min=1800, max=4800) %>% as.integer()
simulated_resturants$Number_Of_Staff_During_Reopen[indexSN] <- runif(length(indexSN), min=1, max=20) %>% as.integer()

#2. If resturant is highend, we allow Income to be ---, if average, we allow income to be ---, if lowend, we allow income to be ----.
# For every raise in pricepoint, we cutdown half for the min, and 1.5million for the max. (2019)
indexIL <- which(simulated_resturants$Price_Point_Target == "Low-end")
simulated_resturants$Income_052019_062019[indexIL] <- runif(length(indexIL), min=120000, max=276667) %>% as.integer()
simulated_resturants$Income_052021_062021[indexIL] <- runif(length(indexIL), min=120000, max=276667) %>% as.integer()
indexIA <- which(simulated_resturants$Price_Point_Target == "Average")
simulated_resturants$Income_052019_062019[indexIA] <- runif(length(indexIA), min=176667, max=523333) %>% as.integer()
simulated_resturants$Income_052021_062021[indexIA] <- runif(length(indexIA), min=176667, max=523333) %>% as.integer()
indexIH <- which(simulated_resturants$Price_Point_Target == "High-end")
simulated_resturants$Income_052019_062019[indexIH] <- runif(length(indexIH), min=403333, max=800000) %>% as.integer()
simulated_resturants$Income_052021_062021[indexIH] <- runif(length(indexIH), min=403333, max=800000) %>% as.integer()

#cap resturants incomes assuming no resturant will make more profit/income than 2019. with random of 90% - 50% income
reduction2021 <- runif(totalobs, min=0.5, max=0.9)
simulated_resturants$Income_052021_062021[indexIL] <- floor(simulated_resturants$Income_052021_062021[indexIL]*reduction2021)
simulated_resturants$Income_052021_062021[indexIA] <- floor(simulated_resturants$Income_052021_062021[indexIA]*reduction2021)
simulated_resturants$Income_052021_062021[indexIH] <- floor(simulated_resturants$Income_052021_062021[indexIH]*reduction2021)

#2a. We assume that all resturants will receive lower income during covid, therefore, the max income from 052020 - 102020 will be based on the 052019-102019 minus a random 
# percentage from 30% - 70% 
reduction <- runif(totalobs, min=0.3, max=0.7)
calculatedmax = floor(simulated_resturants$Income_052019_062019*reduction)
simulated_resturants$Income_052020_062020 <- runif(totalobs, min=0, max=calculatedmax) %>% as.integer()

#2aa. If the resturant is not selected to open, 2021 income and profit goes down by 30% - 70% based on their 2019 data. 
# Profit is capped
indexIncProf <- which(simulated_resturants$Selected_Open == "N")
reductionIncProf <- runif(length(indexIncProf), min=0.85, max=1.15)
simulated_resturants$Income_052021_062021[indexIncProf] <- floor(simulated_resturants$Income_052020_062020[indexIncProf]*reductionIncProf)


#2b. If resturant is highend, we allow Profit to be 20000 - 40000, if average, we allow profit to be 10000 - 25000, if low-end, we allow profit to be 0-10000.
# For every raise in pricepoint, we cutdown half for the min, and 15000 for the max. (2019)
profitpercentage <- runif(totalobs, min=0.02, max=0.045)

indexPL <- which(simulated_resturants$Price_Point_Target == "Low-end")
simulated_resturants$Profit_052019_062019[indexPL] <- floor(simulated_resturants$Income_052019_062019[indexPL]*profitpercentage)
simulated_resturants$Profit_052021_062021[indexPL] <- floor(simulated_resturants$Income_052021_062021[indexPL]*profitpercentage)
indexPA <- which(simulated_resturants$Price_Point_Target == "Average")
simulated_resturants$Profit_052019_062019[indexPA] <- floor(simulated_resturants$Income_052019_062019[indexPA]*profitpercentage)
simulated_resturants$Profit_052021_062021[indexPA] <- floor(simulated_resturants$Income_052021_062021[indexPA]*profitpercentage)
indexPH <- which(simulated_resturants$Price_Point_Target == "High-end")
simulated_resturants$Profit_052019_062019[indexPH] <- floor(simulated_resturants$Income_052019_062019[indexPH]*profitpercentage)
simulated_resturants$Profit_052021_062021[indexPH] <- floor(simulated_resturants$Income_052021_062021[indexPH]*profitpercentage)



#2c. We assume that all resturants will receive lower profit during covid, therefore, the max profit from 052020 - 102020 will be based on the 052019-102019 minus a random 
# percentage from 30% - 70% with cap of 25000
reductionP <- runif(totalobs, min=0.3, max=0.7)
calculatedmaxP <- floor(simulated_resturants$Profit_052019_062019 - simulated_resturants$Profit_052019_062019*reductionP)
simulated_resturants$Profit_052020_062020 <- runif(totalobs, min=0, max=calculatedmaxP) %>% as.integer()



#2d. If the resturant is not selected to open and not offering curb-side pick up or delivery, 
#we assume the profit and income would be 0.(2020 and 2021)
indexNCND <- which(simulated_resturants$Selected_Open == "N" && 
                     simulated_resturants$Curbside_Pickup == "N" && 
                     simulated_resturants$Delivery == "N")
simulated_resturants$Profit_052021_062021[indexNCND] <- 0
simulated_resturants$Income_052021_062021[indexNCND] <- 0
simulated_resturants$Profit_052020_062020[indexNCND] <- 0
simulated_resturants$Income_052020_062020[indexNCND] <- 0
simulated_resturants$Total_Hours_Per_Week_During_Reopen[indexNCND] <- 0

#3. If the resturant offers dine-in service, 
#we make assumption to reduce the income and profit by 30% - 50% of its current number (2021).
indexDIS <- which(simulated_resturants$Dine_In_Service == "Y" && simulated_resturants$Selected_Open == "N")
reductionDIS <- runif(length(indexDIS), min=0.5, max=0.7)
simulated_resturants$Income_052021_062021[indexDIS] <- floor(simulated_resturants$Income_052021_062021[indexDIS]*reductionDIS)
simulated_resturants$Profit_052021_062021[indexDIS] <- floor(simulated_resturants$Profit_052021_062021[indexDIS]*reductionDIS)


#4. If resturant is selected to open, helpfulness is under assumption of 1-5, otherwise, fill in 0
indexHN <- which(simulated_resturants$Selected_Open == "N")
simulated_resturants$Helpfulness[indexHN] <- 0


#5. If the resturant is lease, then profit goes down 20% - 40%. (all years)
indexLe <- which(simulated_resturants$Own_Lease == "Lease" || simulated_resturants$Own_Lease == "Lease, want to purchase")
reductionLe <- runif(length(indexLe), min=0.6, max=0.8)
simulated_resturants$Profit_052019_062019[indexLe] <- floor(simulated_resturants$Profit_052019_062019[indexLe]*reductionLe)
simulated_resturants$Profit_052020_062020[indexLe] <- floor(simulated_resturants$Profit_052020_062020[indexLe]*reductionLe)
simulated_resturants$Profit_052021_062021[indexLe] <- floor(simulated_resturants$Profit_052021_062021[indexLe]*reductionLe)

#5. Randomly fill in NA value for website to make it look real(er)
index <- which(simulated_resturants$Website %in% sample(simulated_resturants$Website, 456))
simulated_resturants$Website[index]<- NA

#6. Randomization bug: if curb-side pickup, delivery and dine-in all filled with N, then we assume the resturant does delivery
indexDineBug <- which(simulated_resturants$Dine_In_Service == "N" && 
                     simulated_resturants$Curbside_Pickup == "N" && 
                     simulated_resturants$Delivery == "N")
simulated_resturants$Delivery[indexDineBug] <- "Y"

#6. Randomization bug: if income is lower than profit of the year, then set income to profit
indexProfIncBug19 <- which(simulated_resturants$Income_052019_062019 < simulated_resturants$Profit_052019_062019)
simulated_resturants$Income_052019_062019[indexProfIncBug19] <- simulated_resturants$Profit_052019_062019[indexProfIncBug19]
indexProfIncBug20 <- which(simulated_resturants$Income_052020_062020 < simulated_resturants$Profit_052020_062020)
simulated_resturants$Income_052020_062020[indexProfIncBug20] <- simulated_resturants$Profit_052020_062020[indexProfIncBug20]
indexProfIncBug21 <- which(simulated_resturants$Income_052021_062021 < simulated_resturants$Profit_052021_062021)
simulated_resturants$Income_052021_062021[indexProfIncBug21] <- simulated_resturants$Profit_052021_062021[indexProfIncBug21]

# Write final csv for cleaning and preparation
write_csv(simulated_resturants, "dataset/raw_data_all_resturants.csv")

