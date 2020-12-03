library(dplyr)
library(magrittr)
library(ggplot2)
library(png)
library(tidyverse)
datac <- read.csv("data_clean.csv")

par(mar=c(4,11,4,4))

#Creating a sub dataframe for jobs providing salary less than median salary
#2013
df1 <- datac %>% filter(Projected.Annual.Salary<58875,Year==2013,Employment.Type=="full time") %>% select(Year,Projected.Annual.Salary,Job.Class.Title) 
df1<-df1 %>% distinct(Job.Class.Title, .keep_all = TRUE) %>% arrange(Projected.Annual.Salary)
df1<-head(df1,10)
#2014
df2 <- datac %>% filter(Projected.Annual.Salary<58875,Year==2014,Employment.Type=="full time") %>% select(Year,Projected.Annual.Salary,Job.Class.Title)
df2<-df2 %>% distinct(Job.Class.Title, .keep_all = TRUE) %>% arrange(Projected.Annual.Salary)
df2<-head(df2,10)
#2015
df3 <- datac %>% filter(Projected.Annual.Salary<62676,Year==2015,Employment.Type=="full time") %>% select(Year,Projected.Annual.Salary,Job.Class.Title)
df3<-df3 %>% distinct(Job.Class.Title, .keep_all = TRUE) %>% arrange(Projected.Annual.Salary)
df3<-head(df3,10)
#2016
df4 <- datac %>% filter(Projected.Annual.Salary<64185,Year==2016,Employment.Type=="full time") %>% select(Year,Projected.Annual.Salary,Job.Class.Title)
df4<-df4 %>% distinct(Job.Class.Title, .keep_all = TRUE) %>% arrange(Projected.Annual.Salary)
df4<-head(df4,10)
#Barplotting 
par(mfrow=c(2,2))
barplot(main="Low Paying Occupations 2013",height=df1$Projected.Annual.Salary, names=df1$Job.Class.Title, col="#ff6600", horiz=T , las=2)
barplot(main="Low Paying Occupations 2014",height=df2$Projected.Annual.Salary, names=df2$Job.Class.Title, col="#ff6600", horiz=T , las=2)
barplot(main="Low Paying Occupations 2015",height=df3$Projected.Annual.Salary, names=df3$Job.Class.Title, col="#ff6600", horiz=T , las=2)
barplot(main="Low Paying Occupations 2016",height=df4$Projected.Annual.Salary, names=df4$Job.Class.Title, col="#ff6600", horiz=T , las=2)


#Boxplotting Proj Annual Salary 
ggplot(datac, aes(factor(`Department.Title`), Base.Pay/1000)) + geom_boxplot() + theme(axis.text.x = element_text(angle = 90)) + xlab("Department Name") + ylab("Average Annual Salary")


df1<-data %>% filter(Year==2013) %>% select(Year,Job.Class.Title,Base.Pay,Average.Benefit.Cost)
df1<- arrange(df1,desc(Base.Pay))
df1<-head(df1,3)


par(mar=c(6,4,5,4))

barplot(t(df1[,3:4]), beside = TRUE, names.arg = df1$Job.Class.Title, main="Top 3 Highest paid Jobs 2013", legend.text=c("Base Salary","Average Benefit Amount" ), args.legend=list(bty="n",horiz=TRUE), col=c("#00bfff" , "#ffff00") )
legend("topright", legend = c("Base Salary","Average Benefit Amount" ) , col = c("#00bfff" , "#ffff00") , bty = "n", pch=20 , pt.cex = 2, cex = 0.8, horiz = FALSE, inset = c(0.005, 0.005))
#text(x,y+2,labels=as.character(y))