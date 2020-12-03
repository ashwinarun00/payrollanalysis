library(dplyr)
library(magrittr)
library(ggplot2)
library(caTools)
library(reshape2)
install.packages("caret")
data <- read.csv("data_clean.csv")

#Creating a dataset for PD 2015 - 
pd_data_2015_filtered <- data %>% select(Job.Class.Title,  Projected.Annual.Salary, Base.Pay, Total.Payments, Payments.Over.Base.Pay) %>% filter(data$Year== '2015', data$Department.Title=='police (lapd)') %>% group_by(Job.Class.Title) %>% summarise(mean_projsal = mean(Projected.Annual.Salary, na.rm=TRUE))
pd_2015 <- data %>% select(Q1.Payments:Q4.Payments,Projected.Annual.Salary, Base.Pay) %>% filter(data$Year=='2015', data$Department.Title=='police (lapd)')
pd_2016 <- data %>% select(Q1.Payments:Q4.Payments,Projected.Annual.Salary, Base.Pay) %>% filter(data$Year=='2016', data$Department.Title=='police (lapd)')
corr_df <- cor(pd_2015)
corr_df
write.csv(pd_data_2015_filtered,"C:\\Users\\Ashwin A\\Desktop\\VIT\\FALL SEM 2020-21\\DATA ANALYTICS\\DA PROJECT\\pd_data_2015_filtered.csv")

#building model
set.seed(123)
split = sample.split(pd_2015$Base.Pay, SplitRatio = 0.90)
training_set = subset(pd_2015, split == TRUE)
test_set = subset(pd_2015, split == FALSE)



#Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Base.Pay ~  Q4.Payments, data = training_set)

#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

summary(y_pred)

options("scipen"=100, "digits"=4)

ggplot() +
  geom_point(aes(x = training_set$Q4.Payments, y = training_set$Base.Pay),
             colour = 'blue') +
  geom_line(aes(x = training_set$Q4.Payments, y = predict(regressor, newdata = training_set)),
            colour = 'red') +
  ggtitle('Base Pay v/s Q4 Payments') +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  xlab('Final Quaterly Payments') +
  ylab('Base Pay (in USD)')

# Test set
ggplot() +
  geom_point(aes(x = test_set$Q4.Payments, y = test_set$Base.Pay),
             colour = 'green') +
  geom_line(aes(x = training_set$Q4.Payments, y = predict(regressor, newdata = training_set)),
            colour = 'red') +
  ggtitle('Base Pay v/s Q4 Payments') +
  xlab('Final Quaterly Payments') +
  ylab('Base Pay (in USD)')



benefit <- data %>% group_by(Benefits.Plan) %>% summarise(meanh=mean(Average.Health.Cost), meand=mean(Average.Dental.Cost),meanb=mean(Average.Basic.Life)) 
benefit <- benefit[-1,]
benefit
cmatrix_melted <- melt(benefit)
par(las=2)
ggplot(cmatrix_melted, aes(fill=variable, y=value, x=Benefits.Plan)) + geom_bar(position="stack", stat="identity")
