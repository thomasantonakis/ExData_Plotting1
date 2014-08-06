edacp1p4<- function(){
  library(sqldf)
  filename<-"C:/Users/HomNhom/Desktop/Data_Science/R Workspaces/household_power_consumption.txt"
  file <- read.csv.sql(filename, sep=";",sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
  file$datetime <- strptime(paste(file$Date,file$Time), "%d/%m/%Y %H:%M:%S")
  Sys.setlocale("LC_TIME", "English")
  png(filename="plot4.png", width=480, height=480, units="px")
  par(mfrow=c(2,2))
  #top-left graph, same as plot 2
  plot(file$datetime,file$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  #top-right graph
  plot(file$datetime,file$Voltage, type="l", ylab="Voltage", xlab="datetime")
  #bottom-left graph, same as plot3
  plot(file$datetime,file$Sub_metering_1, type="l", ylab="Energy sub metering", col="black", xlab="")
  lines(file$datetime, y=file$Sub_metering_2, col="red")
  lines(file$datetime, y=file$Sub_metering_3, col="blue")
  legend("topright", pch="-", col=c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #bottom-right graph
  plot(file$datetime,file$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  dev.off()
}