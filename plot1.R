edacp1p1<- function(){
  library(sqldf)
  filename<-"C:/Users/HomNhom/Desktop/Data_Science/R Workspaces/household_power_consumption.txt"
  file <- read.csv.sql(filename, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
  png(filename="plot1.png", width=480, height=480, units="px")
  hist(file$Global_active_power, 
       xlab="Global Active Power (kilowatts)",
       col="red", 
       main="Global Active Power")
  
  dev.off()
  
}