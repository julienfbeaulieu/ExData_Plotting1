## read and format data
setwd("./coursera/4exdata")
fileurl <- "./household_power_consumption.txt"
data <- read.table(fileurl, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data2$Time2 <- strptime(paste(data2$Date, data2$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

## plot4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#sub-plot 1
plot(data2$Time2, data2$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")

#sub-plot 2
plot(data2$Time2, data2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#sub-plot 3
plot(data2$Time2, data2$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data2$Time2, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$Time2, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col = c("black","red","blue"), bty = "n", cex = 0.9)

#sub-plot 4
plot(data2$Time2, data2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

#close png
dev.off()