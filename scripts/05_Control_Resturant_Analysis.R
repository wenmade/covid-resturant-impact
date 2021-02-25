
control_resturants = read.csv('dataset/control_resturants.csv', stringsAsFactors = FALSE)

#histogram over 3 years profit
ggplot(data = control_resturants) +
  geom_histogram(aes(x = Profit_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years income
ggplot(data = control_resturants) +
  geom_histogram(aes(x = Income_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years staff
ggplot(data = control_resturants) +
  geom_histogram(aes(x = Number_Of_Staff_Before_Covid, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Number_Of_Staff_During_Covid, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Number_Of_Staff_During_Reopen, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")


#Low-End Resturants
low_end_rest <- control_resturants[control_resturants$Price_Point_Target == "Low-end", ] 

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
average_rest <- control_resturants[control_resturants$Price_Point_Target == "Average", ]

#3 years profit
ggplot(data = average_rest) +
  geom_histogram(aes(x = Profit_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#3 years income
ggplot(data = average_rest) +
  geom_histogram(aes(x = Income_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

min(average_rest$Income_052021_062021) #225666
mean(average_rest$Income_052021_062021) #1435222


high_end_rest <- control_resturants[control_resturants$Price_Point_Target == "High-end", ]
#3 years profit
ggplot(data = high_end_rest) +
  geom_histogram(aes(x = Profit_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#3 years income
ggplot(data = high_end_rest) +
  geom_histogram(aes(x = Income_052019_062019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_062020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_062021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")





paste("min income is: ", min(low_end_rest$Income_052021_062021)) #225666


write_csv(low_end_rest, "dataset/control_low_end_resturants.csv")
write_csv(average_rest, "dataset/control_average_resturants.csv")
write_csv(high_end_rest, "dataset/control_high_end_resturants.csv")

