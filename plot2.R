edacp1p2<- function(){
  library(sqldf)
  filename<-"C:/Users/HomNhom/Desktop/Data_Science/R Workspaces/household_power_consumption.txt"
  file <- read.csv.sql(filename, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
  
  file$datetime <- strptime(paste(file$Date,file$Time), "%d/%m/%Y %H:%M:%S")
  Sys.setlocale("LC_TIME", "English")
  png(filename="plot2.png", width=480, height=480, units="px")
  plot(file$datetime,file$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  dev.off()
  
}