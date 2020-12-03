library(readr)
data <- read.csv("data.csv")
view (data)

#Convert to lowercase
data[c(3,6,7,26,34)]<-lapply(data[c(3,6,7,26,34)], tolower)
data[26]<-lapply(data[26], tolower)
#remove extra white spaces
data[c(3,6,7,26,34)]<- lapply(data[c(3,6,7,26,34)], function (x) gsub("^\\s+|\\s+$", "",x))
#Converting num values
data[8:14] <- lapply(data[8:14], function(x) as.numeric(gsub("\\$","",x)))
data[16:24] <- lapply(data[16:24], function(x) as.numeric(gsub("\\$","",x)))
data[30:33] <- lapply(data[30:33], function(x) as.numeric(gsub("\\$","",x)))
#Substituting na,N/A values with NA
data<-data %>% mutate(Payroll.Department=replace(Payroll.Department,Payroll.Department=="N/A",NA)) %>%
  mutate(Benefits.Plan=replace(Benefits.Plan,Benefits.Plan=="na",NA))
#Removing rows with incorrect/corrupt info ; Removing Outliers
data2<-data[!(data$Total.Payments<1),]
data2<-data2[!(data2$Projected.Annual.Salary==0),]
#Changing NA values to 0
data2$Hourly.or.Event.Rate[is.na(data2$Hourly.or.Event.Rate)] <- 0
data2$Lump.Sum.Pay[is.na(data2$Lump.Sum.Pay)] <- 0
data2$Overtime.Pay[is.na(data2$Overtime.Pay)] <- 0
#Removing MOU and MOU.Title attribute
data2 <- data2[-c(24,25,29)]

write.csv(datac,"C:\\Users\\Ashwin A\\Desktop\\VIT\\FALL SEM 2020-21\\DATA ANALYTICS\\DA PROJECT\\data_clean.csv",row.names=FALSE)
