# load file
header <- read.table("./household_power_consumption.txt", nrows = 1, header = FALSE, sep = ";", stringsAsFactors = FALSE)
data <- read.table("./household_power_consumption.txt", nrows = 2*24*60+1, skip = 66637, sep = ";", header = FALSE)
colnames(data) <- unlist(header)

png(file = "plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
plot(data$Global_active_power, type = "l", xaxt = "n", xlab = NA, ylab = "Global Active Power (kilowatts)")
ticks <- c(0, 1440, 2880)
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))

plot(data$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
ticks <- c(0, 1440, 2880)
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))

plot(data$Sub_metering_1, type = "l", col = "black", xaxt = "n", ylim = c(0,40),xlab = NA, ylab = "Energy sub metering")
ticks <- c(0, 1440, 2880)
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))
par(new=T)
plot(data$Sub_metering_2, type = "l", col = "red",ylim = c(0,40), ann = NA, xaxt = "n", yaxt = "n")
par(new=T)
plot(data$Sub_metering_3, type = "l", col = "blue",ylim = c(0,40), ann = NA, xaxt = "n", yaxt = "n")
par(new=F)
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black", "red", "blue"))

plot(data$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global Reactive Power")
ticks <- c(0, 1440, 2880)
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))
dev.off()
