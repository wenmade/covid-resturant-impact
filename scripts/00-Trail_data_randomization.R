#### Intro stuff ####



#### Setup ####
library(tidyverse)
library(revgeo)
library(PostcodesioR)
library(generator)
library(stringi)

#### copy over column in data ####
dinesafeCSV <- read.csv("dataset/dinesafeCSV.csv", header=TRUE, sep=",")

dinesafeCSV <- dinesafeCSV[dinesafeCSV$TYPE == 'Restaurant',]


#17664 obs in total
totalobs <- nrow(dinesafeCSV)

totalobs
#### Categories ####

#https://www.chefspencil.com/top-10-most-popular-ethnic-cuisines-in-canada/

top_cuisine_list <- c("Chinese", "Mexican", "Italian", "Japanese", "Greek", "Korean", "Thai", "Vietnamese", "American",
                      "Indian", "Mediterranean", "Others");


business_op_list <- c("Under 1 year", "1-5 years", "6-10 years", "11-20 years", "Over 20 years");
business_owner_list <- c("Under 1 year", "1-5 years", "6-10 years", "11-20 years", "Over 20 years");
price_point_target <- c("Low-end", "Average", "High-end");

#### pour in postal code data based on address ####

postal_code_data <- 
  tibble(
    Postal_Code = "", 
    Long = dinesafeCSV$LONGITUDE,
    Lat = dinesafeCSV$LATITUDE,
    Addr = dinesafeCSV$ADDRESS,
  )

postal_code_data %>% 
  rowwise() %>% 
  revgeo(longitude="-79.37747", 
         latitude="43.66205", 
         provider = 'google', output="frame")

revgeo(longitude=-77.0229529, latitude=38.89283435)

reverse_geocoding("99 CARLTON ST")


stri_rand_strings(1, sample(8:16, 1, replace=TRUE), pattern = '[a-zA-Z0-9]');
#### Simulation ####

simulated_resturants <-
  tibble(
    ID = seq(1, totalobs),
    Name = dinesafeCSV$NAME,
    Owner = r_full_names(totalobs),
    Dine_Type = dinesafeCSV$TYPE,
    Mailing_Address = dinesafeCSV$ADDRESS,
    Billing_Address = dinesafeCSV$ADDRESS,
    Postal_Code = "NA",
    Phone_1 = r_phone_numbers(totalobs),
    Phone_2 = r_phone_numbers(totalobs),
    Email = r_email_addresses(totalobs),
    Website = "NA",
    Business_Operation_Year = sample(x = business_op_list, 
                                     size = totalobs,
                                     replace=TRUE,
                                     prob=c(0.2, 0.35, 0.15, 0.2, 0.1)),
    Business_Owner_Year = sample(x = business_owner_list, 
                                 size = totalobs,
                                 replace=TRUE,
                                 prob=c(0.25, 0.3, 0.15, 0.15, 0.15)),  # this has issue matching business year
    Number_Of_Staff_Before_Covid = runif(totalobs, min=5, max=30) %>% as.integer(),
    Number_Of_Staff_During_Covid = runif(totalobs, min=1, max=30) %>% as.integer(),
    Number_Of_Staff_During_Reopen = runif(totalobs, min=1, max=30) %>% as.integer(),
    Total_Hours_Per_Week_Before_Covid = runif(totalobs, min=8, max=40) %>% as.integer(),
    Total_Hours_Per_Week_During_Covid = runif(totalobs, min=0, max=40) %>% as.integer(),
    Total_Hours_Per_Week_During_Reopen = runif(totalobs, min=1, max=40) %>% as.integer(),
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
    Guest_Capacity = runif(totalobs, min = 5, max = 150) %>% as.integer(),
    Business_Start_Hour = runif(totalobs, min=9, max=13) %>% as.integer(), 
    Business_End_Hour = runif(totalobs, min=17, max=23) %>% as.integer(), 
    Franchise = sample(x = c ("Y", "N"), 
                             size=totalobs,
                             replace=TRUE,
                             prob=c(0.4, 0.6)), 
    Own_Lease = sample(x=c("Own", "Lease", "Lease, want to purchase"), 
                       size=totalobs,
                       replace=TRUE,
                       prob=c(0.4, 0.5, 0.1)),
    Income_052019_102019 = runif(totalobs, min=0, max=5000000) %>% as.integer(), 
    Income_052020_102020 = runif(totalobs, min=0, max=1000000) %>% as.integer(),
    Income_052021_102021 = runif(totalobs, min=0, max=5000000) %>% as.integer(),
    Profit_052019_102019 = runif(totalobs, min=0, max=40000) %>% as.integer(), 
    Profit_052020_102020 = runif(totalobs, min=0, max=25000) %>% as.integer(),
    Profit_052021_102021 = runif(totalobs, min=0, max=40000) %>% as.integer(),
    Customers_Weekly_Before_Covid = runif(totalobs, min=0, max=500) %>% as.integer(),
    Customers_Weekly_During_Covid = runif(totalobs, min=0, max=500) %>% as.integer(),
    Customers_Weekly_During_Reopen = runif(totalobs, min=0, max=500) %>% as.integer(),
    Helpfulness = runif(totalobs, min=1, max=5) %>% as.integer(),
  )



write_csv(simulated_resturants, "dataset/simulated_resturants.csv")

#check null
is.null(simulated_resturants)
apply(simulated_resturants, 2, function(x) any(is.na(x)))

#only keep resturants which are relevant
levels(simulated_resturants$Dine_Type)

#only Restaurant - all three


simulated_resturants %>%
  ggplot(aes(x=Annual_Income)) +
  geom_histogram()


lookup_result <- postcode_lookup("EC1Y8LX")

#overview
str(lookup_result)
