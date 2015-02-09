# load file
header <- read.table("./household_power_consumption.txt", nrows = 1, header = FALSE, sep = ";", stringsAsFactors = FALSE)
data <- read.table("./household_power_consumption.txt", nrows = 2*24*60+1, skip = 66637, sep = ";", header = FALSE)
colnames(data) <- unlist(header)

# Plot 2
#dates <- data.frame(date = c("2007-02-01", "2007-02-02", "2007-02-03"))
#dates$day <- weekdays(as.Date(dates$date))
png(file = "plot2.png", height = 480, width = 480)
plot(data$Global_active_power, type = "l", xaxt = "n", xlab = NA, ylab = "Global Active Power (kilowatts)")
ticks <- c(0, 1440, 2880)
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))
dev.off()
