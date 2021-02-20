
sample_resturants = read.csv('dataset/sample_resturants.csv', stringsAsFactors = FALSE)

#histogram over 3 years profit
ggplot(data = sample_resturants) +
  geom_histogram(aes(x = Profit_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#histogram over 3 years income
ggplot(data = sample_resturants) +
  geom_histogram(aes(x = Income_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_102021, y=(..count..)/sum(..count..)), 
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
  geom_histogram(aes(x = Profit_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")
# 3 year income
ggplot(data = low_end_rest) +
  geom_histogram(aes(x = Income_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

min(low_end_rest$Income_052021_102021) #225666
mean(low_end_rest$Income_052021_102021) #1435222

#Average Resturants
average_rest <- sample_resturants[sample_resturants$Price_Point_Target == "Average", ]

#3 years profit
ggplot(data = average_rest) +
  geom_histogram(aes(x = Profit_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#3 years income
ggplot(data = average_rest) +
  geom_histogram(aes(x = Income_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

min(average_rest$Income_052021_102021) #225666
mean(average_rest$Income_052021_102021) #1435222


high_end_rest <- sample_resturants[sample_resturants$Price_Point_Target == "High-end", ]
#3 years profit
ggplot(data = high_end_rest) +
  geom_histogram(aes(x = Profit_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Profit_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Profit_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")

#3 years income
ggplot(data = high_end_rest) +
  geom_histogram(aes(x = Income_052019_102019, y=(..count..)/sum(..count..)), 
                 alpha=0.3, fill ="red",position="identity") +
  geom_histogram(aes(x = Income_052020_102020, y=(..count..)/sum(..count..)), 
                 alpha=0.3,, fill ="green",position="identity") +
  geom_histogram(aes(x = Income_052021_102021, y=(..count..)/sum(..count..)), 
                 alpha=0.7,, fill ="blue",position="identity")





paste("min income is: ", min(low_end_rest$Income_052021_102021)) #225666
