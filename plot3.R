## read and format data
setwd("./coursera/4exdata")
fileurl <- "./household_power_consumption.txt"
data <- read.table(fileurl, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data2$Time2 <- strptime(paste(data2$Date, data2$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

## plot3
png(filename = "plot3.png", width = 480, height = 480)
par(mfrow = c(1,1))
plot(data2$Time2, data2$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data2$Time2, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$Time2, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col = c("black","red","blue"))
dev.off()