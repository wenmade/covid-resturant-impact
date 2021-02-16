#### Intro stuff ####



#### Setup ####
library(tidyverse)


#### copy over column in data ####
dinesafeCSV <- read.csv("dataset/dinesafeCSV.csv", header=TRUE, sep=",")
#17664 obs in total
totalobs <- nrow(dinesafeCSV)


#### Categories ####

#https://blogs.voanews.com/all-about-america/2015/05/18/top-10-most-popular-ethnic-cuisines-in-us/

top_cuisine_list <- c("Chinese", "Mexican", "Italian", "Japanese", "Greek", "French", "Thai", "Spanish", "American"
                      "Indian", "Mediterranean", "Others")

#### Simulation ####

# Questions comes here
# Q1: Survey question 1, what is your resturant name
# Q2: How many staff work for you?

simulated_resturants <-
  tibble(
    ID = seq(1, totalobs),
    Name = dinesafeCSV$NAME,
    Dine_Type = dinesafeCSV$TYPE,
    Number_Of_Staff = runif(totalobs, min=5, max=30) %>% as.integer(),
    Address = dinesafeCSV$ADDRESS,
    Neighbourhood = "NA",
    Annual_Income = runif(totalobs, min=0, max=1000000), #research number
    Annual_Profit = runif(totalobs, min=0, max=500000),  #research number
    #can use rnorm(totalobs, mean = 500, sd = 10),
    Average_Daily_Income = runif(totalobs, min=0, max=10000), 
    Average_Daily_Profit = runif(totalobs, min=0, max=5000),
    Delivery = "NA", # Y or N
    Curbside_Pickup = "NA", # Y or N
    Dine_In_Service = "NA", # Y or N
    Patio_Service = sample(x = c ("Y", "N"),
                           size=totalobs,
                           replace=TRUE,
                           prob=c(0.3, 0.7)), #research number
    Cuisine = sample(x = top_cuisine_list, 
                     size = totalobs,
                     replace = TRUE,
                     prob = c(0.1, 0.12, 0.07, 0.1, 0.15, 0.05, 0.05, 0.08, 0.05, 0.07, 0.08, 0.08)), #research number
    Offer_Alcohol = sample(x = c ("Y", "N"),
                           size=totalobs,
                           replace=TRUE,
                           prob=c(0.4, 0.6)),  #research number
    Guest_Capacity = runif(totalobs, min = 5, max = 150),
    Business_Start_Hour = runif(totalobs, min=7, max=10) %>% as.integer(), #research number
    Business_End_Hour = runif(totalobs, min=15, max=21) %>% as.integer(), #research number
    Privately_Owned = sample(x = c ("Y", "N"),
                             size=totalobs,
                             replace=TRUE,
                             prob=c(0.7, 0.3)), #research number
    Longitude = dinesafeCSV$LONGITUDE,
    Latitude = dinesafeCSV$LATITUDE
  )

write_csv(simulated_resturants, "dataset/simulated_resturants.csv")

#check null
is.null(simulated_resturants)
apply(simulated_resturants, 2, function(x) any(is.na(x)))

#only keep resturants which are relevant
levels(simulated_resturants$Dine_Type)

#Bake shop - all three
#Cafeteria - public access/private access - all three
#Food take out - delivery, curb side
#Hot Dog Cart - curb side
#Mobile Food Preparation Premises - curb side
#Restaurant - all three
#Bakery - all three
#Ice Cream / Yogurt Vendors - all three
#Refreshment Stand (Stationary) - curb side
#Cocktail Bar / Beverage Room - dine-in, curb side
#Food cart - curb side


simulated_resturants %>%
  ggplot(aes(x=Annual_Income)) +
  geom_histogram()

