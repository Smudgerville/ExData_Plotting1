# calculate memory requirements
# rows x cols x 8 bytes/numeric
# 2^20 bytes/MB
requiredMem <- (2075259*9*8)/2^20

# read data
inFile <- "../household_power_consumption.txt"
myData <- read.table(file = inFile, sep = ";", header = T, na.strings = "?", colClasses = c(rep(NA, 2), rep("numeric", 7)))

# format data & subset
myData$Date <- as.Date(myData$Date, format = "%d/%m/%Y")
myData <- subset(myData, myData$Date == "2007-02-01" | myData$Date == "2007-02-02")


myData$Time <- strptime(paste(myData$Date, myData$Time), format = "%Y-%m-%d %H:%M:%S")

# plot 2
par(mfrow = c(1, 1))
plot(myData$Time, myData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()

