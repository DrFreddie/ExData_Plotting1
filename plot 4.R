## Plot 4 - Last one of the assignment
## Again we get the data for the two days
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Subset by date and time
dateandtime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
## Two new settings Reactive Power and Voltage
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
##Submetering also
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
## We want four figures in a 2 x 2 block
par(mfrow = c(2, 2)) 
## Plot 1 (Upper Left)
plot(dateandtime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
## Plot 2 (Upper Right)
plot(dateandtime, voltage, type="l", xlab="datetime", ylab="Voltage")
## Plot 3 (Lower Left)
plot(dateandtime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, subMetering2, type="l", col="red")
lines(dateandtime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
## Plot 4 (Lower Right)
plot(dateandtime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
## That should do it
dev.off()