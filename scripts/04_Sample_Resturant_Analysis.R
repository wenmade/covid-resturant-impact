
sample_resturants = read.csv('dataset/sample_resturants.csv', stringsAsFactors = FALSE)

#histogram over 3 years profit
ggplot(data = sample_resturants) +
  geom_histogram(aes(x = Profit_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years income
ggplot(data = sample_resturants) +
  geom_histogram(aes(x = Income_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years staff
ggplot(data = sample_resturants) +
  geom_histogram(aes(x = Number_Of_Staff_Before_Covid, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Number_Of_Staff_During_Covid, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Number_Of_Staff_During_Reopen, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")


#Low-End Resturants
low_end_rest <- sample_resturants[sample_resturants$Price_Point_Target == "Low-end", ] 

# 3 year profit
ggplot(data = low_end_rest) +
  geom_histogram(aes(x = Profit_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")
# 3 year income
ggplot(data = low_end_rest) +
  geom_histogram(aes(x = Income_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

min(low_end_rest$Income_052021_062021) #225666
mean(low_end_rest$Income_052021_062021) #1435222

#Average Resturants
average_rest <- sample_resturants[sample_resturants$Price_Point_Target == "Average", ]

#3 years profit
ggplot(data = average_rest) +
  geom_histogram(aes(x = Profit_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")


plot_profit_average <- data.frame(Profit_052019_062019 = average_rest$Profit_052019_062019, 
                                  Profit_052020_062020 = average_rest$Profit_052020_062020, 
                                  Profit_052021_062021 = average_rest$Profit_052021_062021)
plot_profit_average <- gather(plot_profit_average)


ggplot(plot_profit_average, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1)

min(average_rest$Profit_052021_062021) #225666
mean(average_rest$Profit_052021_062021) #1435222
max(average_rest$Profit_052021_062021)

#3 years income
ggplot(data = average_rest) +
  geom_histogram(aes(x = Income_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")


plot_income_average <- data.frame(Income_052019_062019 = average_rest$Income_052019_062019, Income_052020_062020 = average_rest$Income_052020_062020, 
                                   Income_052021_062021 = average_rest$Income_052021_062021)
plot_income_average <- gather(plot_income_average)


ggplot(plot_income_average, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1)


min(average_rest$Income_052021_062021) #225666
mean(average_rest$Income_052021_062021) #1435222


high_end_rest <- sample_resturants[sample_resturants$Price_Point_Target == "High-end", ]
#3 years profit
ggplot(data = high_end_rest) +
  geom_histogram(aes(x = Profit_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")


plot_profit_high_end <- data.frame(Profit_052019_062019 = high_end_rest$Profit_052019_062019, 
                                   Profit_052020_062020 = high_end_rest$Profit_052020_062020, 
                                   Profit_052021_062021 = high_end_rest$Profit_052021_062021)
plot_profit_high_end <- gather(plot_profit_high_end)


ggplot(plot_profit_high_end, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1)


#3 years income
ggplot(data = high_end_rest) +
  geom_histogram(aes(x = Income_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")


plot_income_high_end <- data.frame(Income_052019_062019 = high_end_rest$Income_052019_062019, Income_052020_062020 = high_end_rest$Income_052020_062020, 
                                   Income_052021_062021 = high_end_rest$Income_052021_062021)
plot_income_high_end <- gather(plot_profit_high_end)


ggplot(plot_income_high_end, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1)
  


paste("min income is: ", min(low_end_rest$Income_052021_062021)) #225666

write_csv(low_end_rest, "dataset/sample_low_end_resturants.csv")
write_csv(average_rest, "dataset/sample_average_resturants.csv")
write_csv(high_end_rest, "dataset/sample_high_end_resturants.csv")

