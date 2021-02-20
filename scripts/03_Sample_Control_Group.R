
library(kableExtra)
library(dplyr)
library(ggplot2)
library(janitor)

reopened_resturants = read.csv('dataset/reopened_resturants.csv', stringsAsFactors = FALSE)


#Separate data into control group
sample_size <- floor(0.7 * nrow(reopened_resturants)) #set sample size
sample_rest_ind <- sample(seq_len(nrow(reopened_resturants)), size = sample_size)

set.seed(123) #make it reproducible
sample_rest <- reopened_resturants[sample_rest_ind, ] #Train set 70% - 2470
control_rest <- reopened_resturants[-sample_rest_ind, ] #Test set 30% - 1059


table(sample_rest$Price_Point_Target) #high-end 19.8%
table(control_rest$Price_Point_Target) #high-end 20.1%

#Write files for map

write_csv(sample_rest, "dataset/sample_resturants.csv")
write_csv(control_rest, "dataset/control_resturants.csv")



