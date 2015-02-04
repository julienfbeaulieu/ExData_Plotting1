## read and format data
setwd("./coursera/4exdata")
fileurl <- "./household_power_consumption.txt"
data <- read.table(fileurl, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data2$Time2 <- strptime(paste(data2$Date, data2$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

## plot2
png(filename = "plot2.png", width = 480, height = 480)
par(mfrow = c(1,1))
plot(data2$Time2, data2$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()