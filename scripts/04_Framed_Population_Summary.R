
library(kableExtra)
library(dplyr)
library(ggplot2)
library(janitor)

reopened_resturants = read.csv('../dataset/reopened_resturants.csv', stringsAsFactors = FALSE)


kbl(summary(reopened_resturants), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))

#Business operation year freq table
kbl(tabyl(reopened_resturants$Business_Operation_Year, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
# 1-5 years owns takes 36% of dataset

#Frachaise
kbl(tabyl(reopened_resturants$Franchise, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#Even split - 59% Non frachaise vs. 41% frachaise

#Own / Lease
kbl(tabyl(reopened_resturants$Own_Lease, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#Lease 50%, own 40%, lease to own 10%


#Pricepoint
kbl(tabyl(reopened_resturants$Price_Point_Target, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#Average 39%, Low-end 40%, High-end 21%

#Dine-in Service
kbl(tabyl(reopened_resturants$Dine_In_Service, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#70% Y 30% N


#Helpfulness
kbl(tabyl(reopened_resturants$Helpfulness_Factor, sort = TRUE), booktabs = T) %>%
  kable_styling(latex_options = c("striped", "scale-down"))
#average split of 33%

#Average of everything table
ave_Income2019 <- mean(reopened_resturants$Income_052019_102019)
ave_Income2020 <- mean(reopened_resturants$Income_052020_102020)
ave_Income2021 <- mean(reopened_resturants$Income_052021_102021)
ave_Profit2019 <- mean(reopened_resturants$Profit_052019_102019)
ave_Profit2020 <- mean(reopened_resturants$Profit_052020_102020)
ave_Profit2021 <- mean(reopened_resturants$Profit_052021_102021)
ave_Staff2019 <- mean(reopened_resturants$Number_Of_Staff_Before_Covid)
ave_Staff2020 <- mean(reopened_resturants$Number_Of_Staff_During_Covid)
ave_Staff2021 <- mean(reopened_resturants$Number_Of_Staff_During_Reopen)

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


ggplot2.histogram(data=reopened_resturants$Profit_052019_102019, xName='weight',
                  fill="white", color="black",
                  addDensityCurve=TRUE, densityFill='#FF6666')


#histogram of profit
qplot(reopened_resturants$Profit_052019_102019, geom="histogram") 
qplot(reopened_resturants$Profit_052020_102020, geom="histogram") 
qplot(reopened_resturants$Profit_052021_102021, geom="histogram") 

#histogram of income
qplot(reopened_resturants$Income_052019_102019, geom="histogram") 
qplot(reopened_resturants$Income_052020_102020, geom="histogram") 
qplot(reopened_resturants$Income_052021_102021, geom="histogram") 


#histogram over 3 years profit
ggplot(data = reopened_resturants) +
  geom_histogram(aes(x = Profit_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years income
ggplot(data = reopened_resturants) +
  geom_histogram(aes(x = Income_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years staff
ggplot(data = reopened_resturants) +
  geom_histogram(aes(x = Number_Of_Staff_Before_Covid, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Number_Of_Staff_During_Covid, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Number_Of_Staff_During_Reopen, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

