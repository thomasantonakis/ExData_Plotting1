edacp1p3<- function(){
  library(sqldf)
  filename<-"C:/Users/HomNhom/Desktop/Data_Science/R Workspaces/household_power_consumption.txt"
  file <- read.csv.sql(filename, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
  file$datetime <- strptime(paste(file$Date,file$Time), "%d/%m/%Y %H:%M:%S")
  Sys.setlocale("LC_TIME", "English")
  png(filename="plot3.png", width=480, height=480, units="px")
  plot(file$datetime,file$Sub_metering_1, type="l", ylab="Energy sub metering", col="black", xlab="")
  lines(file$datetime, y=file$Sub_metering_2, col="red")
  lines(file$datetime, y=file$Sub_metering_3, col="blue")
  legend("topright", pch="-", col=c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
}