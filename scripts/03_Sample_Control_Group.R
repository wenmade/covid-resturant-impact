#### Intro stuff ####



#### Setup ####
library(tidyverse)
library(revgeo)
library(PostcodesioR)
library(generator)
library(stringi)

simulated_resturants= read.csv('dataset/simulated_resturants.csv', stringsAsFactors = FALSE)


#Separate data into control group
sample_size <- floor(0.7 * nrow(simulated_resturants)) #set sample size
sample_rest_ind <- sample(seq_len(nrow(simulated_resturants)), size = sample_size)

set.seed(123) #make it reproducible
sample_rest <- simulated_resturants[sample_rest_ind, ] #Train set 70%
control_rest <- simulated_resturants[-sample_rest_ind, ] #Test set 30%


#as.factor(sample_rest$Price_Point_Target)
table(sample_rest$Price_Point_Target) #high-end 19.8%


table(control_rest$Price_Point_Target) #high-end 20.1%

#Write files for map

write_csv(sample_rest, "dataset/sample_resturants.csv")
write_csv(control_rest, "dataset/control_resturants.csv")


