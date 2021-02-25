
library(gridExtra)

control_resturants = read.csv('dataset/control_resturants.csv', stringsAsFactors = FALSE)
sample_resturants = read.csv('dataset/sample_resturants.csv', stringsAsFactors = FALSE)

control_low_end_rest = read.csv('dataset/control_low_end_resturants.csv', stringsAsFactors = FALSE)
control_average_rest = read.csv('dataset/control_average_resturants.csv', stringsAsFactors = FALSE)
control_high_end_rest = read.csv('dataset/control_high_end_resturants.csv', stringsAsFactors = FALSE)

sample_low_end_rest = read.csv('dataset/sample_low_end_resturants.csv', stringsAsFactors = FALSE)
sample_average_rest = read.csv('dataset/sample_average_resturants.csv', stringsAsFactors = FALSE)
sample_high_end_rest = read.csv('dataset/sample_high_end_resturants.csv', stringsAsFactors = FALSE)







#Plot all control resturants - income

control_resturants_plot <- data.frame(Income_05_062019 = control_resturants$Income_052019_062019, 
                                      Income_05_062020 = control_resturants$Income_052020_062020, 
                                   Income_05_062021 = control_resturants$Income_052021_062021)
control_resturants_plot <- gather(control_resturants_plot)

income_control_all <- ggplot(control_resturants_plot, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control resturants income"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot all sample resturants - income

sample_resturants_plot <- data.frame(Income_05_062019 = sample_resturants$Income_052019_062019, 
                                     Income_05_062020 = sample_resturants$Income_052020_062020, 
                                    Income_05_062021 = sample_resturants$Income_052021_062021)
sample_resturants_plot <- gather(sample_resturants_plot)

income_sample_all <-ggplot(sample_resturants_plot, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample resturants income"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(income_control_all, income_sample_all, ncol=2, top = "Income comparision between all sample and control group")


#Plot all control resturants - profit

control_resturants_plot_profit <- data.frame(Profit_05_062019 = control_resturants$Profit_052019_062019, 
                                      Profit_05_062020 = control_resturants$Profit_052020_062020, 
                                      Profit_05_062021 = control_resturants$Profit_052021_062021)
control_resturants_plot_profit <- gather(control_resturants_plot_profit)

profit_control_all <- ggplot(control_resturants_plot_profit, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control resturants profit"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot all sample resturants - profit

sample_resturants_plot_profit <- data.frame(Profit_05_062019 = sample_resturants$Profit_052019_062019, 
                                            Profit_05_062020 = sample_resturants$Profit_052020_062020, 
                                            Profit_05_062021 = sample_resturants$Profit_052021_062021)
sample_resturants_plot_profit <- gather(sample_resturants_plot_profit)

profit_sample_all <-ggplot(sample_resturants_plot_profit, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample resturants profit"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(profit_control_all, profit_sample_all, ncol=2, top = "Profit comparision between all sample and control group")


#Plot all control resturants - staff

control_resturants_plot_staff <- data.frame(Staff_05_062019 = control_resturants$Number_Of_Staff_Before_Covid, 
                                            Staff_05_062020 = control_resturants$Number_Of_Staff_During_Covid, 
                                            Staff_05_062021 = control_resturants$Number_Of_Staff_During_Reopen)
control_resturants_plot_staff <- gather(control_resturants_plot_staff)

control_all_staff <- ggplot(control_resturants_plot_staff, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control resturants staff"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot all sample resturants - staff

sample_resturants_plot_staff <- data.frame(Staff_05_062019 = sample_resturants$Number_Of_Staff_Before_Covid, 
                                            Staff_05_062020 = sample_resturants$Number_Of_Staff_During_Covid, 
                                            Staff_05_062021 = sample_resturants$Number_Of_Staff_During_Reopen)
sample_resturants_plot_staff <- gather(sample_resturants_plot_staff)

sample_all_staff <-ggplot(sample_resturants_plot_staff, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample resturants staff"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(control_all_staff, sample_all_staff, ncol=2, top = "Staff comparision between all sample and control group")















#Plot low end control resturants - income

control_resturants_low_plot_income <- data.frame(Income_05_062019 = control_low_end_rest$Income_052019_062019, 
                                                 Income_05_062020 = control_low_end_rest$Income_052020_062020, 
                                                 Income_05_062021 = control_low_end_rest$Income_052021_062021)
control_resturants_low_plot_income <- gather(control_resturants_low_plot_income)

income_control_low_end <- ggplot(control_resturants_low_plot_income, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control low-end resturants income"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot all sample resturants - income

sample_resturants_low_plot_income <- data.frame(Income_052019_062019 = sample_low_end_rest$Income_052019_062019, 
                                     Income_05_062020 = sample_low_end_rest$Income_052020_062020, 
                                     Income_05_062021 = sample_low_end_rest$Income_052021_062021)
sample_resturants_low_plot_income <- gather(sample_resturants_low_plot_income)

income_sample_low_end <-ggplot(sample_resturants_low_plot_income, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample low-end resturants income"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(income_control_low_end, income_sample_low_end, ncol=2, top = "Income comparision between low-end resturants in sample and control group")



#Plot low end control resturants - profit

control_resturants_low_plot_profit <- data.frame(Profit_05_062019 = control_low_end_rest$Profit_052019_062019, 
                                                 Profit_05_062020 = control_low_end_rest$Profit_052020_062020, 
                                                 Profit_05_062021 = control_low_end_rest$Profit_052021_062021)
control_resturants_low_plot_profit <- gather(control_resturants_low_plot_profit)

profit_control_low_end <- ggplot(control_resturants_low_plot_profit, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control low-end resturants profit"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))

#Plot low end  sample resturants - profit

sample_resturants_low_plot_profit <- data.frame(Profit_05_062019 = sample_low_end_rest$Profit_052019_062019, 
                                            Profit_05_062020 = sample_low_end_rest$Profit_052020_062020, 
                                            Profit_05_062021 = sample_low_end_rest$Profit_052021_062021)
sample_resturants_low_plot_profit <- gather(sample_resturants_low_plot_profit)

profit_sample_low_end <-ggplot(sample_resturants_low_plot_profit, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample low-end resturants profit"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(profit_control_low_end, profit_sample_low_end, ncol=2, top = "Profit comparision between low-end resturants in sample and control group")



#Plot low end control resturants - staff

control_resturants_low_end_plot_staff <- data.frame(Staff_05_062019 = control_low_end_rest$Number_Of_Staff_Before_Covid, 
                                            Staff_05_062020 = control_low_end_rest$Number_Of_Staff_During_Covid, 
                                            Staff_05_062021 = control_low_end_rest$Number_Of_Staff_During_Reopen)
control_resturants_low_end_plot_staff <- gather(control_resturants_low_end_plot_staff)

control_low_end_staff <- ggplot(control_resturants_low_end_plot_staff, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control low-end resturants staff"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot all sample resturants - staff

sample_resturants_low_end_plot_staff <- data.frame(Staff_05_062019 = sample_low_end_rest$Number_Of_Staff_Before_Covid, 
                                           Staff_05_062020 = sample_low_end_rest$Number_Of_Staff_During_Covid, 
                                           Staff_05_062021 = sample_low_end_rest$Number_Of_Staff_During_Reopen)
sample_resturants_low_end_plot_staff <- gather(sample_resturants_low_end_plot_staff)

sample_low_end_staff <-ggplot(sample_resturants_low_end_plot_staff, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample low-end resturants staff"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(control_low_end_staff, sample_low_end_staff, ncol=2, top = "Staff comparision between low-end resturants sample and control group")




















#Plot average control resturants - income

control_resturants_average_plot_income <- data.frame(Income_05_062019 = control_average_rest$Income_052019_062019, 
                                                 Income_05_062020 = control_average_rest$Income_052020_062020, 
                                                 Income_05_062021 = control_average_rest$Income_052021_062021)
control_resturants_average_plot_income <- gather(control_resturants_average_plot_income)

income_control_average <- ggplot(control_resturants_average_plot_income, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control average resturants income"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot average sample resturants - income

sample_resturants_average_plot_income <- data.frame(Income_05_062019 = sample_average_rest$Income_052019_062019, 
                                                Income_05_062020 = sample_average_rest$Income_052020_062020, 
                                                Income_05_062021 = sample_average_rest$Income_052021_062021)
sample_resturants_average_plot_income <- gather(sample_resturants_average_plot_income)

income_sample_average <-ggplot(sample_resturants_average_plot_income, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample average resturants income"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(income_control_average, income_sample_average, ncol=2, top = "Income comparision between average resturants in sample and control group")



#Plot average control resturants - profit

control_resturants_average_profit <- data.frame(Profit_05_062019 = control_average_rest$Profit_052019_062019, 
                                                 Profit_05_062020 = control_average_rest$Profit_052020_062020, 
                                                 Profit_05_062021 = control_average_rest$Profit_052021_062021)
control_resturants_average_profit <- gather(control_resturants_average_profit)

profit_control_average <- ggplot(control_resturants_average_profit, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control average resturants profit"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))

#Plot average  sample resturants - profit

sample_resturants_average_profit <- data.frame(Profit_05_062019 = sample_average_rest$Profit_052019_062019, 
                                                Profit_05_062020 = sample_average_rest$Profit_052020_062020, 
                                                Profit_05_062021 = sample_average_rest$Profit_052021_062021)
sample_resturants_average_profit <- gather(sample_resturants_average_profit)

profit_sample_average <-ggplot(sample_resturants_average_profit, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample average resturants profit"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(profit_control_average, profit_sample_average, ncol=2, top = "Profit comparision between average resturants in sample and control group")



#Plot low end control resturants - staff

control_resturants_average_plot_staff <- data.frame(Staff_05_062019 = control_average_rest$Number_Of_Staff_Before_Covid, 
                                                    Staff_05_062020 = control_average_rest$Number_Of_Staff_During_Covid, 
                                                    Staff_05_062021 = control_average_rest$Number_Of_Staff_During_Reopen)
control_resturants_average_plot_staff <- gather(control_resturants_average_plot_staff)

control_average_staff <- ggplot(control_resturants_average_plot_staff, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control average resturants staff"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot all sample resturants - staff

sample_resturants_average_plot_staff <- data.frame(Staff_05_062019 = sample_average_rest$Number_Of_Staff_Before_Covid, 
                                                   Staff_05_062020 = sample_average_rest$Number_Of_Staff_During_Covid, 
                                                   Staff_05_062021 = sample_average_rest$Number_Of_Staff_During_Reopen)
sample_resturants_average_plot_staff <- gather(sample_resturants_average_plot_staff)

sample_average_staff <-ggplot(sample_resturants_average_plot_staff, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample average resturants staff"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(control_average_staff, sample_average_staff, ncol=2, top = "Staff comparision between average resturants sample and control group")











#Plot high end control resturants - income

control_resturants_high_plot_income <- data.frame(Income_05_062019 = control_high_end_rest$Income_052019_062019, 
                                                 Income_05_062020 = control_high_end_rest$Income_052020_062020, 
                                                 Income_05_062021 = control_high_end_rest$Income_052021_062021)
control_resturants_high_plot_income <- gather(control_resturants_high_plot_income)

income_control_high_end <- ggplot(control_resturants_high_plot_income, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control high-end resturants income"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot all sample resturants - income

sample_resturants_high_plot_income <- data.frame(Income_05_062019 = sample_high_end_rest$Income_052019_062019, 
                                                Income_05_062020 = sample_high_end_rest$Income_052020_062020, 
                                                Income_05_062021 = sample_high_end_rest$Income_052021_062021)
sample_resturants_high_plot_income <- gather(sample_resturants_high_plot_income)

income_sample_high_end <-ggplot(sample_resturants_high_plot_income, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample high-end resturants income"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(income_control_high_end, income_sample_high_end, ncol=2, top = "Income comparision between high-end resturants in sample and control group")



#Plot high end control resturants - profit

control_resturants_high_plot_profit <- data.frame(Profit_05_062019 = control_high_end_rest$Profit_052019_062019, 
                                                 Profit_05_062020 = control_high_end_rest$Profit_052020_062020, 
                                                 Profit_05_062021 = control_high_end_rest$Profit_052021_062021)
control_resturants_high_plot_profit <- gather(control_resturants_high_plot_profit)

profit_control_high_end <- ggplot(control_resturants_high_plot_profit, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control high-end resturants profit"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))

#Plot high end  sample resturants - profit

sample_resturants_high_plot_profit <- data.frame(Profit_05_062019 = sample_high_end_rest$Profit_052019_062019, 
                                                Profit_05_062020 = sample_high_end_rest$Profit_052020_062020, 
                                                Profit_05_062021 = sample_high_end_rest$Profit_052021_062021)
sample_resturants_high_plot_profit <- gather(sample_resturants_high_plot_profit)

profit_sample_high_end <-ggplot(sample_resturants_high_plot_profit, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample high-end resturants profit"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


grid.arrange(profit_control_high_end, profit_sample_high_end, ncol=2, top = "Profit comparision between high-end resturants in sample and control group")




#Plot high end control resturants - staff

control_resturants_high_end_plot_staff <- data.frame(Staff_05_062019 = control_high_end_rest$Number_Of_Staff_Before_Covid, 
                                                     Staff_05_062020 = control_high_end_rest$Number_Of_Staff_During_Covid, 
                                                     Staff_05_062021 = control_high_end_rest$Number_Of_Staff_During_Reopen)
control_resturants_high_end_plot_staff <- gather(control_resturants_high_end_plot_staff)

control_high_end_staff <- ggplot(control_resturants_high_end_plot_staff, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Control high-end resturants staff"))+ 
  theme(legend.title = element_text(size = 7), legend.text = element_text(size = 7), legend.position = c(0.8, 0.9))


#Plot all sample resturants - staff

sample_resturants_high_end_plot_staff <- data.frame(Staff_05_062019 = sample_high_end_rest$Number_Of_Staff_Before_Covid, 
                                                    Staff_05_062020 = sample_high_end_rest$Number_Of_Staff_During_Covid, 
                                                    Staff_05_062021 = sample_high_end_rest$Number_Of_Staff_During_Reopen)
sample_resturants_high_end_plot_staff <- gather(sample_resturants_high_end_plot_staff)

sample_high_end_staff <-ggplot(sample_resturants_high_end_plot_staff, aes(x = value, fill = key)) +
  geom_density(kernel = "gaussian", alpha = 0.1) + guides(fill=guide_legend(title="Sample high-end resturants staff"),
                                                          shape = guide_legend(override.aes = list(size = 0.5)))+ 
  theme(legend.title = element_text(size = 6), legend.text = element_text(size = 6), legend.position = "bottom")
        
grid.arrange(control_high_end_staff, sample_high_end_staff, ncol=2, top = "Staff comparision between high-end resturants sample and control group")

