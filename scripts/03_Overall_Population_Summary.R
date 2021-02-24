
library(kableExtra)
library(dplyr)
library(ggplot2)
library(janitor)

all_resturants_data = read.csv('dataset/all_resturants.csv', stringsAsFactors = FALSE)


kbl(summary(all_resturants_data), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))

#Business operation year freq table
kbl(tabyl(all_resturants_data$Business_Operation_Year, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
# 1-5 years owns takes 36% of dataset

#Frachaise
kbl(tabyl(all_resturants_data$Franchise, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#Even split - 59% Non frachaise vs. 41% frachaise

#Own / Lease
kbl(tabyl(all_resturants_data$Own_Lease, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#Lease 50%, own 40%, lease to own 10%


#Pricepoint
kbl(tabyl(all_resturants_data$Price_Point_Target, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#Average 39%, Low-end 40%, High-end 21%

#Dine-in Service
kbl(tabyl(all_resturants_data$Dine_In_Service, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#70% Y 30% N


#Helpfulness
kbl(tabyl(all_resturants_data$Helpfulness_Factor, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#average split of 33%

#Average of everything table
ave_Income2019 <- mean(all_resturants_data$Income_052019_102019)
ave_Income2020 <- mean(all_resturants_data$Income_052020_102020)
ave_Income2021 <- mean(all_resturants_data$Income_052021_102021)
ave_Profit2019 <- mean(all_resturants_data$Profit_052019_102019)
ave_Profit2020 <- mean(all_resturants_data$Profit_052020_102020)
ave_Profit2021 <- mean(all_resturants_data$Profit_052021_102021)
ave_Staff2019 <- mean(all_resturants_data$Number_Of_Staff_Before_Covid)
ave_Staff2020 <- mean(all_resturants_data$Number_Of_Staff_During_Covid)
ave_Staff2021 <- mean(all_resturants_data$Number_Of_Staff_During_Reopen)

average_table <- data.frame("ave_Income2019" = ave_Income2019, 
                            "ave_Income2020" = ave_Income2020, 
                            "ave_Income2021" = ave_Income2021, 
                            "ave_Profit2019" = ave_Profit2019, 
                            "ave_Profit2020" = ave_Profit2020, 
                            "ave_Profit2021" = ave_Profit2021, 
                            "ave_Staff2019" = ave_Staff2019, 
                            "ave_Staff2020" = ave_Staff2020, 
                            "ave_Staff2021" = ave_Staff2021)

kbl(average_table, booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))


ggplot2.histogram(data=all_resturants_data$Profit_052019_102019, xName='weight',
                  fill="white", color="black",
                  addDensityCurve=TRUE, densityFill='#FF6666')


#histogram of profit
qplot(all_resturants_data$Profit_052019_102019, geom="histogram") 
qplot(all_resturants_data$Profit_052020_102020, geom="histogram") 
qplot(all_resturants_data$Profit_052021_102021, geom="histogram") 

#histogram of income
qplot(all_resturants_data$Income_052019_102019, geom="histogram") 
qplot(all_resturants_data$Income_052020_102020, geom="histogram") 
qplot(all_resturants_data$Income_052021_102021, geom="histogram") 


#histogram over 3 years profit
ggplot(data = all_resturants_data) +
  geom_histogram(aes(x = Profit_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years income
ggplot(data = all_resturants_data) +
  geom_histogram(aes(x = Income_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years staff
ggplot(data = all_resturants_data) +
  geom_histogram(aes(x = Number_Of_Staff_Before_Covid, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Number_Of_Staff_During_Covid, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Number_Of_Staff_During_Reopen, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

