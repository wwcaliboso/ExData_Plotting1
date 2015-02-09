# load file
header <- read.table("./household_power_consumption.txt", nrows = 1, header = FALSE, sep = ";", stringsAsFactors = FALSE)
data <- read.table("./household_power_consumption.txt", nrows = 2*24*60, skip = 66637, sep = ";", header = FALSE)
colnames(data) <- unlist(header)

# Plot 1
png(file = "plot1.png", height = 480, width = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()